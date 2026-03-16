import { defineConfig } from "@graphql-hive/gateway";

export const gatewayConfig = defineConfig({
  propagateHeaders: {
    fromClientToSubgraphs({ request }) {
      return {
        authorization: request.headers.get("authorization"),
      };
    },
  },
});
