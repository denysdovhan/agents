#!/usr/bin/env node

const http = require("http");
const fs = require("fs");
const path = require("path");

const port = Number.parseInt(process.argv[2] || "3333", 10);
const logDir = ".debug";
const logFile = path.join(logDir, "debug.log");

fs.mkdirSync(logDir, { recursive: true });

const server = http.createServer((req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");

  if (req.method === "OPTIONS") {
    res.writeHead(204);
    res.end();
    return;
  }

  if (req.url === "/health") {
    res.writeHead(200);
    res.end("ok");
    return;
  }

  if (req.url === "/debug" && req.method === "POST") {
    let body = "";

    req.on("data", (chunk) => {
      body += chunk;
    });

    req.on("end", () => {
      fs.appendFileSync(logFile, `[${new Date().toISOString()}] ${body}\n`);
      res.writeHead(200);
      res.end("ok");
    });

    return;
  }

  res.writeHead(404);
  res.end();
});

server.listen(port, () => {
  console.log(`Debug server on :${port}`);
  console.log(`Writing logs to ${logFile}`);
});

process.on("SIGINT", () => {
  server.close(() => process.exit(0));
});
