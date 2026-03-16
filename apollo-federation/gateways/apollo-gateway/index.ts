import { ApolloServer } from "@apollo/server";
import { expressMiddleware } from "@apollo/server/express4";
import { ApolloGateway, RemoteGraphQLDataSource } from "@apollo/gateway";
import { readFileSync } from "fs";
import cluster from "cluster";
import { availableParallelism } from "os";
import express from "express";
import http from "http";

class AuthenticatedDataSource extends RemoteGraphQLDataSource {
  willSendRequest({ request, context }: any) {
    if (context.authorization) {
      request.http.headers.set("Authorization", context.authorization);
    }
  }
}

async function main() {
  const forkCount = process.env.FORK
    ? parseInt(process.env.FORK)
    : availableParallelism();
  if (cluster.isPrimary && forkCount > 1) {
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
    await server.start();

    const app = express();
    app.use(
      "/graphql",
      express.json(),
      expressMiddleware(server, {
        context: async ({ req }) => ({
          authorization: req.headers.authorization,
        }),
      })
    );

    const port = process.env.PORT ? parseInt(process.env.PORT) : 4000;
    const httpServer = http.createServer(app);
    httpServer.listen(port, () => {
      console.log(`🚀  Server ready at http://localhost:${port}/graphql`);
    });
  }
}

main().catch(console.error);
