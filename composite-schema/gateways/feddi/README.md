# feddi Gateway

[feddi Gateway](https://feddi.dev) ([feddi-dev/feddi-gateway](https://github.com/feddi-dev/feddi-gateway))
is a JVM-native GraphQL composite-schema federation gateway built on
[GraphQL Java](https://github.com/graphql-java/graphql-java). It composes source
schemas, plans cross-subgraph operations, and executes requests entirely inside
the JVM.

## How this integration works

feddi is built from source (there is no published OSS binary) and configured for
the benchmark port layout (gateway on `5220`, subgraphs on `5221`–`5224`).

- **`install.sh`**
  1. Bundles a JDK 25 into `./.jdk` (feddi requires Java 25+).
  2. Clones `feddi-dev/feddi-gateway` at a pinned commit into `./source`.
  3. Builds the distribution (`./gradlew :app:feddiGatewayDistZip`) and extracts
     it to `./dist`.
  4. Assembles `./subgraphs.zip` from `./subgraph-config`.
- **`start.sh`** launches `dist/feddi-gateway/bin/feddi-gateway`, waits for the
  admin endpoint, uploads `subgraphs.zip` (feddi composes the supergraph at
  runtime), verifies the composed schema serves queries, then stays attached so
  the harness can manage the process.
- **`feddi-gateway.yml`** sets the gateway port (`5220`), admin port (`9091`),
  and management/health port (`9090`, `GET /actuator/health`).
- **`subgraph-config/<name>/`** holds each subgraph's `schema.graphqls` + a
  `config.yaml` with its `url` and `batching: variables` (see below).

### Subgraph SDL adaptation (`@key`)

The `schema.graphqls` files are the benchmark subgraph schemas with one change:
`@key(fields: …)` is added to the shared entity types (`User` keyed by `id`,
`Product` keyed by `upc`). The subgraphs use lookup-only entity resolution (no
`@key` on the type); feddi's composer additionally requires the shared key field
to be declared, otherwise composition fails with `INVALID_FIELD_SHARING` because
the key field is contributed by multiple subgraphs. This is a composition-time
declaration only — entity resolution still happens through the `@lookup` fields.

### Subgraph connection pool

`start.sh` raises the reactor-netty subgraph connection pool
(`-Dreactor.netty.pool.maxConnections`) above feddi's default of 500/host. Under
load the benchmark keeps many subgraph requests in flight, which can otherwise
exhaust the default pool. This is the equivalent of
the connection settings the other gateways ship with (e.g. fusion's
`MaxConnectionsPerServer=256`). Override with `FEDDI_SUBGRAPH_MAX_CONNECTIONS`.

## Entity batching

feddi deduplicates entity lookups per plan step and, per subgraph, can batch them
(`batching:` in the subgraph's `config.yaml`):

- `none` (feddi's default): one request per unique entity.
- `alias`: one spec-compliant request with an aliased lookup per entity; works
  with any GraphQL server.
- `variables`: one request with a `variables` array (variable batching, as
  proposed in graphql-over-http#307); the subgraph must support it.

The benchmark subgraphs (HotChocolate and the Rust subgraphs) support variable
batching, so this integration uses `batching: variables`. The heavy query then
needs 8 subgraph requests.
