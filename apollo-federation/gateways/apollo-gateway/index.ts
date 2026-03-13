import { ApolloServer } from "@apollo/server";
import { ApolloGateway, RemoteGraphQLDataSource } from "@apollo/gateway";
import { startStandaloneServer } from "@apollo/server/standalone";
import { readFileSync } from "fs";
import cluster from "cluster";
import { availableParallelism } from "os";

class AuthenticatedDataSource extends RemoteGraphQLDataSource {
  willSendRequest({ request, context }: any) {
    if (context.authorization) {
      request.http.headers.set("Authorization", context.authorization);
    }
  }
}

async function main() {
  const forkCount = (process.env.FORK
    ? parseInt(process.env.FORK)
    : availableParallelism()) - 1;
  if (cluster.isPrimary && forkCount) {
    console.log(`Forking ${forkCount} workers...`);
    for (let i = 0; i < forkCount; i++) {
      cluster.fork();
    }
  } else {
    const supergraphSdl = readFileSync("./supergraph.graphql").toString();
    const gateway = new ApolloGateway({
      supergraphSdl,
      buildService({ url }) {
        return new AuthenticatedDataSource({ url });
      },
    });
    const server = new ApolloServer({ gateway });

    const { url } = await startStandaloneServer(server, {
      listen: { port: process.env.PORT ? parseInt(process.env.PORT) : 4000 },
      context: async ({ req }) => ({
        authorization: req.headers.authorization,
      }),
    });

    console.log(`🚀  Server ready at ${url}`);
  }
}

main().catch(console.error);
