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
  `config.yaml` with its `url`.

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
(`-Dreactor.netty.pool.maxConnections`) above feddi's default of 500/host. The
benchmark's nested query fans out into many concurrent per-entity subgraph
requests, which otherwise exhausts the default pool. This is the equivalent of
the connection settings the other gateways ship with (e.g. fusion's
`MaxConnectionsPerServer=256`). Override with `FEDDI_SUBGRAPH_MAX_CONNECTIONS`.

## Known limitation — heavy query planner defect

> **As of the pinned commit, feddi does not return correct results for the
> benchmark's standard heavy query.**

feddi composes the schema and correctly executes a wide range of queries
(single-subgraph, two/three-hop cross-subgraph, deep single-root recursion, and
dual-root queries). However, on the benchmark's full deeply-recursive,
dual-root query it mis-plans the operation: it grafts the root field
`topProducts` onto a `User` entity lookup sent to the `accounts` subgraph, e.g.

```graphql
query ($id: ID!) {
  user(id: $id) {
    username
    name
    topProducts { reviews { author { username name } } }  # topProducts is not a field of User
  }
}
```

The `accounts` subgraph rejects this with
`The field 'topProducts' does not exist on the type 'User'`, so the benchmark
run reports subgraph errors and only partial data rather than a throughput
number. This is an upstream query-planner defect (not a composition or
configuration issue in this integration) and is expected to be fixed in feddi.
