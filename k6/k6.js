import http from "k6/http";
import { check } from "k6";
import { Rate } from "k6/metrics";
import { textSummary } from "https://jslib.k6.io/k6-summary/0.0.1/index.js";

const endpoint = __ENV.GATEWAY_ENDPOINT || "http://0.0.0.0:5220/graphql";
const mode = __ENV.MODE || "constant";
const isConstant = mode === "constant";
const parsedVus = parseInt(__ENV.BENCH_VUS || "", 10);
const defaultVus = isConstant ? 50 : 500;
const vus = Number.isFinite(parsedVus) && parsedVus > 0 ? parsedVus : defaultVus;
const duration = __ENV.BENCH_OVER_TIME || "60s";
const durationSeconds = parseDurationSeconds(duration);
const rampFloorVUs = resolveRampFloorVUs(__ENV.BENCH_RAMP_FLOOR_VUS, vus);
const rampingStages = buildRampingStages(durationSeconds, rampFloorVUs, vus);

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
          startVUs: rampFloorVUs,
          stages: rampingStages,
          gracefulRampDown: "1s",
          gracefulStop: "0s",
        },
      },
      summaryTrendStats,
    };

function parsePositiveInt(value) {
  if (value === undefined || value === null || value === "") {
    return null;
  }

  const parsed = parseInt(String(value), 10);
  if (!Number.isFinite(parsed) || parsed <= 0) {
    return null;
  }

  return parsed;
}

function resolveRampFloorVUs(value, peakVUs) {
  const fallbackFloor = 50;
  const configured = parsePositiveInt(value);
  const candidate = configured === null ? fallbackFloor : configured;
  const peak = Number.isFinite(peakVUs) && peakVUs > 0 ? Math.floor(peakVUs) : 1;
  return Math.max(1, Math.min(candidate, peak));
}

function parseDurationSeconds(value) {
  const normalized = String(value || "").trim();
  const match = normalized.match(/^(\d+)([smh]?)$/i);
  if (!match) {
    return 60;
  }

  const amount = parseInt(match[1], 10);
  const unit = (match[2] || "s").toLowerCase();

  if (unit === "m") {
    return amount * 60;
  }
  if (unit === "h") {
    return amount * 3600;
  }

  return amount;
}

function splitThreeStages(totalSeconds) {
  if (totalSeconds <= 0) {
    return [1, 1, 1];
  }

  // Keep the existing 1:4:1 profile while matching total runtime exactly.
  const stages = [
    Math.floor(totalSeconds / 6),
    Math.floor((totalSeconds * 4) / 6),
    Math.floor(totalSeconds / 6),
  ];

  for (let i = 0; i < stages.length; i++) {
    if (stages[i] < 1) {
      stages[i] = 1;
    }
  }

  let sum = stages[0] + stages[1] + stages[2];
  while (sum > totalSeconds) {
    if (stages[1] > 1) {
      stages[1] -= 1;
      sum -= 1;
      continue;
    }
    if (stages[0] > 1) {
      stages[0] -= 1;
      sum -= 1;
      continue;
    }
    if (stages[2] > 1) {
      stages[2] -= 1;
      sum -= 1;
      continue;
    }
    break;
  }

  while (sum < totalSeconds) {
    stages[1] += 1;
    sum += 1;
  }

  return stages;
}

function buildRampingStages(totalSeconds, floorVUs, targetVUs) {
  const validTotal = Number.isFinite(totalSeconds)
    ? Math.max(1, Math.floor(totalSeconds))
    : 60;

  if (validTotal === 1) {
    return [{ duration: "1s", target: targetVUs }];
  }

  if (validTotal === 2) {
    return [
      { duration: "1s", target: targetVUs },
      { duration: "1s", target: floorVUs },
    ];
  }

  const [up, hold, down] = splitThreeStages(validTotal);
  return [
    { duration: `${up}s`, target: targetVUs },
    { duration: `${hold}s`, target: targetVUs },
    { duration: `${down}s`, target: floorVUs },
  ];
}

export function setup() {
  for (let i = 0; i < vus * 2; i++) {
    sendGraphQLRequest();
  }
}

export default function () {
  makeGraphQLRequest();
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

const graphqlRequest = {
  payload: JSON.stringify({
    query: `fragment User on User {
      id
      username
      name
    }

    fragment Review on Review {
      id
      body
    }

    fragment Product on Product {
      inStock
      name
      price
      shippingEstimate
      upc
      weight
    }

    query TestQuery {
      users {
        ...User
        reviews {
          ...Review
          product {
            ...Product
            reviews {
              ...Review
              author {
                ...User
                reviews {
                  ...Review
                  product {
                    ...Product
                  }
                }
              }
            }
          }
        }
      }
      topProducts {
        ...Product
        reviews {
          ...Review
          author {
            ...User
            reviews {
              ...Review
              product {
                ...Product
              }
            }
          }
        }
      }
    }`,
  }),
  params: {
    headers: {
      "Content-Type": "application/json",
    },
  },
};

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

function sendGraphQLRequest() {
  const reqId = typeof __ITER !== "undefined" ? `${__VU}-${__ITER}` : `s-${_reqCounter++}`;
  const res = http.post(
    endpoint,
    graphqlRequest.payload,
    {
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer bench-${reqId}`,
      },
    }
  );

  return res;
}

function makeGraphQLRequest() {
  const res = sendGraphQLRequest();
  const ok = check(res, {
    "response code was 200": (res) => res.status == 200,
    "no graphql errors": (resp) => {
      let has_errors = !!resp.body && resp.body.includes(`"errors"`);
      if (has_errors && __ENV.PRINT_ONCE) {
        printOnce(
          "graphql_errors",
          `‼️ Got GraphQL errors, here's a sample:`,
          res.json.errors
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

function checkResponseStructure(x) {
  function checkRecursive(obj, structure) {
    if (obj == null) {
      return false;
    }
    for (var key in structure) {
      if (
        !obj.hasOwnProperty(key) ||
        (structure[key] !== null && typeof obj[key] !== typeof structure[key])
      ) {
        return false;
      }
      if (typeof structure[key] === "object" && structure[key] !== null) {
        if (!checkRecursive(obj[key], structure[key])) {
          return false;
        }
      }
    }
    return true;
  }

  const expectedStructure = {
    data: {
      users: [
        {
          id: "1",
          username: "urigo",
          name: "Uri Goldshtein",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          id: "2",
          username: "dotansimha",
          name: "Dotan Simha",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          id: "3",
          username: "kamilkisiela",
          name: "Kamil Kisiela",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          id: "4",
          username: "ardatan",
          name: "Arda Tanrikulu",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          id: "5",
          username: "gilgardosh",
          name: "Gil Gardosh",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          id: "6",
          username: "laurin",
          name: "Laurin Quast",
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              product: {
                inStock: true,
                name: "Table",
                price: 899,
                shippingEstimate: null,
                upc: "1",
                weight: 100,
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "3",
                    body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                  {
                    id: "4",
                    body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
                    author: {
                      id: "1",
                      username: "urigo",
                      name: "Uri Goldshtein",
                      reviews: [
                        {
                          id: "1",
                          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                        {
                          id: "2",
                          body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                          product: {
                            inStock: true,
                            name: "Table",
                            price: 899,
                            shippingEstimate: null,
                            upc: "1",
                            weight: 100,
                          },
                        },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        },
      ],
      topProducts: [
        {
          inStock: true,
          name: "Table",
          price: 899,
          shippingEstimate: null,
          upc: "1",
          weight: 100,
          reviews: [
            {
              id: "1",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "2",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "3",
              body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "4",
              body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          inStock: false,
          name: "Couch",
          price: 1299,
          shippingEstimate: null,
          upc: "2",
          weight: 1000,
          reviews: [
            {
              id: "5",
              body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "6",
              body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "7",
              body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "8",
              body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          inStock: false,
          name: "Glass",
          price: 15,
          shippingEstimate: null,
          upc: "3",
          weight: 20,
          reviews: [
            {
              id: "9",
              body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          inStock: false,
          name: "Chair",
          price: 499,
          shippingEstimate: null,
          upc: "4",
          weight: 100,
          reviews: [
            {
              id: "10",
              body: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
            {
              id: "11",
              body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
              author: {
                id: "1",
                username: "urigo",
                name: "Uri Goldshtein",
                reviews: [
                  {
                    id: "1",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                  {
                    id: "2",
                    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugi",
                    product: {
                      inStock: true,
                      name: "Table",
                      price: 899,
                      shippingEstimate: null,
                      upc: "1",
                      weight: 100,
                    },
                  },
                ],
              },
            },
          ],
        },
        {
          inStock: true,
          name: "TV",
          price: 1299,
          shippingEstimate: null,
          upc: "5",
          weight: 1000,
          reviews: [],
        },
      ],
    },
  };
  return checkRecursive(x, expectedStructure);
}
