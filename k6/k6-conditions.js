import http from "k6/http";
import { check } from "k6";
import { Rate } from "k6/metrics";
import exec from "k6/execution";
import { textSummary } from "https://jslib.k6.io/k6-summary/0.0.1/index.js";

const endpoint = __ENV.GATEWAY_ENDPOINT || "http://0.0.0.0:5220/graphql";
const mode = __ENV.MODE || "constant";
const isConstant = mode === "constant";
const parsedVus = parseInt(__ENV.BENCH_VUS || "", 10);
const defaultVus = isConstant ? 50 : 500;
const vus = Number.isFinite(parsedVus) && parsedVus > 0 ? parsedVus : defaultVus;
const duration = __ENV.BENCH_OVER_TIME || (isConstant ? "120s" : "60s");

const successRate = new Rate("success_rate");

const summaryTrendStats = [
  "avg",
  "min",
  "med",
  "max",
  "p(90)",
  "p(95)",
  "p(99.9)",
];

export const options = isConstant
  ? {
      duration,
      vus,
      summaryTrendStats,
    }
  : {
      scenarios: {
        stress: {
          executor: "ramping-vus",
          startVUs: 50,
          stages: [
            { duration: "10s", target: 50 },
            { duration: "40s", target: vus },
            { duration: "10s", target: 50 },
          ],
          gracefulRampDown: "5s",
          gracefulStop: "5s",
        },
      },
      summaryTrendStats,
    };

export function setup() {
  // Warm a spread of permutations so the gateway primes multiple plan shapes.
  for (let i = 0; i < vus * 2; i++) {
    sendGraphQLRequest(i);
  }
}

export default function () {
  makeGraphQLRequest(exec.scenario.iterationInTest);
}

export function handleSummary(data) {
  return handleBenchmarkSummary(data, { vus, duration });
}

let printIdentifiersMap = {};
let runIdentifiersMap = {};

function printOnce(identifier, ...args) {
  if (printIdentifiersMap[identifier]) {
    return;
  }

  console.log(...args);
  printIdentifiersMap[identifier] = true;
}

function runOnce(identifier, cb) {
  if (runIdentifiersMap[identifier]) {
    return true;
  }

  runIdentifiersMap[identifier] = true;
  return cb();
}

// One query document with 32 independent @skip/@include switches: 16 @skip
// (skip0..skip15) and 16 @include (include0..include15), every directive on its
// own unique variable, no field/spread carrying both, mixed across fragment
// spreads and fields. `users` and `topProducts` stay ungated so there is always
// baseline cross-subgraph work and a stable response shape to validate against.
const SKIP_COUNT = 16;
const INCLUDE_COUNT = 16;

const CONDITIONS_QUERY = `fragment UserCore on User {
  id
  name
}

fragment ReviewCore on Review {
  id
  body
}

fragment ProductCore on Product {
  upc
  name
}

query Conditions(
  $skip0: Boolean!, $skip1: Boolean!, $skip2: Boolean!, $skip3: Boolean!,
  $skip4: Boolean!, $skip5: Boolean!, $skip6: Boolean!, $skip7: Boolean!,
  $skip8: Boolean!, $skip9: Boolean!, $skip10: Boolean!, $skip11: Boolean!,
  $skip12: Boolean!, $skip13: Boolean!, $skip14: Boolean!, $skip15: Boolean!,
  $include0: Boolean!, $include1: Boolean!, $include2: Boolean!, $include3: Boolean!,
  $include4: Boolean!, $include5: Boolean!, $include6: Boolean!, $include7: Boolean!,
  $include8: Boolean!, $include9: Boolean!, $include10: Boolean!, $include11: Boolean!,
  $include12: Boolean!, $include13: Boolean!, $include14: Boolean!, $include15: Boolean!
) {
  users {
    ...UserCore @include(if: $include0)
    username @skip(if: $skip0)
    birthday @include(if: $include1)
    reviews @skip(if: $skip1) {
      ...ReviewCore @include(if: $include2)
      authorId @skip(if: $skip2)
      product @include(if: $include3) {
        ...ProductCore @skip(if: $skip3)
        price @include(if: $include4)
        weight @skip(if: $skip4)
        inStock @include(if: $include5)
        shippingEstimate @skip(if: $skip5)
        reviews @include(if: $include6) {
          ...ReviewCore @skip(if: $skip6)
          productUpc @include(if: $include7)
          author @skip(if: $skip7) {
            ...UserCore @include(if: $include8)
            username @skip(if: $skip8)
            reviews @include(if: $include9) {
              ...ReviewCore @skip(if: $skip9)
              product @include(if: $include10) {
                ...ProductCore @skip(if: $skip10)
                inStock @include(if: $include11)
              }
            }
          }
        }
      }
    }
  }
  topProducts {
    ...ProductCore @include(if: $include12)
    price @skip(if: $skip11)
    weight @include(if: $include13)
    inStock @skip(if: $skip12)
    reviews @include(if: $include14) {
      ...ReviewCore @skip(if: $skip13)
      authorId @include(if: $include15)
      author @skip(if: $skip14) {
        ...UserCore @skip(if: $skip15)
        username
        reviews {
          ...ReviewCore
          product {
            ...ProductCore
            inStock
            shippingEstimate
          }
        }
      }
    }
  }
}`;

// Map a global iteration counter onto a 32-bit permutation of the 32 switches.
// Math.imul keeps the Knuth multiplicative hash exact in 32-bit space (a plain
// `*` would lose precision past 2^53 for large iteration counts), so successive
// iterations sweep distinct, well-spread permutations and the run is reproducible.
function buildVariables(iter) {
  const n = Math.imul(iter >>> 0, 0x9e3779b1) >>> 0;
  const variables = {};
  for (let k = 0; k < SKIP_COUNT; k++) {
    variables["skip" + k] = ((n >>> k) & 1) === 1;
  }
  for (let k = 0; k < INCLUDE_COUNT; k++) {
    variables["include" + k] = ((n >>> (k + SKIP_COUNT)) & 1) === 1;
  }
  return variables;
}

function buildPayload(iter) {
  return JSON.stringify({
    query: CONDITIONS_QUERY,
    variables: buildVariables(iter),
  });
}

function handleBenchmarkSummary(data, additionalContext = {}) {
  const out = {
    stdout: textSummary(data, { indent: " ", enableColors: true }),
  };

  if (__ENV.SUMMARY_PATH) {
    out[`${__ENV.SUMMARY_PATH}/k6_summary.json`] = JSON.stringify(
      Object.assign(data, additionalContext)
    );
    out[`${__ENV.SUMMARY_PATH}/k6_summary.txt`] = textSummary(data, {
      indent: " ",
      enableColors: false,
    });
  }

  return out;
}

let _reqCounter = 0;

function sendGraphQLRequest(iter) {
  const reqId =
    typeof __ITER !== "undefined" ? `${__VU}-${__ITER}` : `s-${_reqCounter++}`;
  const res = http.post(endpoint, buildPayload(iter), {
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer bench-${reqId}`,
    },
  });

  return res;
}

function makeGraphQLRequest(iter) {
  const res = sendGraphQLRequest(iter);
  const ok = check(res, {
    "response code was 200": (res) => res.status == 200,
    "no graphql errors": (resp) => {
      let has_errors = !!resp.body && resp.body.includes(`"errors"`);
      if (has_errors && __ENV.PRINT_ONCE) {
        printOnce(
          "graphql_errors",
          `‼️ Got GraphQL errors, here's a sample:`,
          res.json().errors
        );
      }

      return !has_errors;
    },
    "valid response structure": (resp) => {
      return runOnce("valid response structure", () => {
        const json = resp.json();

        let isValid = checkResponseStructure(json);

        if (!isValid && __ENV.PRINT_ONCE) {
          printOnce(
            "response_strcuture",
            `‼️ Got invalid structure, here's a sample:`,
            res.body
          );
        }

        return isValid;
      });
    },
  });

  successRate.add(ok);
}

// The per-permutation shape is intentionally variable, so we only assert the
// ungated invariants: a `data` object with both root lists present. Real
// execution problems are still caught by the "no graphql errors" check.
function checkResponseStructure(x) {
  return (
    x != null &&
    typeof x === "object" &&
    x.data != null &&
    Array.isArray(x.data.users) &&
    Array.isArray(x.data.topProducts)
  );
}
