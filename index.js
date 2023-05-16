import { Hono } from "hono";
import { serve } from "@hono/node-server";

const app = new Hono();

app.get("/", (c) => c.text("Hello World"));

serve({
  port: Number.parseInt(process.env.PORT) || 8080,
  fetch: app.fetch,
});
