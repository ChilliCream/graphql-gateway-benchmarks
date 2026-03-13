import { defineConfig } from "@graphql-hive/gateway";

export const gatewayConfig = defineConfig({
  transportEntries: {
    "*.http": {
      options: {
        deduplicateInflightRequests: false,
      },
    },
  },
});
