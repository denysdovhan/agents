#!/usr/bin/env python3

import os
import sys
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 3333
LOG_DIR = ".debug"
LOG_FILE = os.path.join(LOG_DIR, "debug.log")

os.makedirs(LOG_DIR, exist_ok=True)


class DebugHandler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(204)
        self.send_cors_headers()
        self.end_headers()

    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok")
            return

        self.send_response(404)
        self.end_headers()

    def do_POST(self):
        if self.path != "/debug":
            self.send_response(404)
            self.end_headers()
            return

        length = int(self.headers.get("Content-Length", "0") or "0")
        body = self.rfile.read(length).decode("utf-8")

        with open(LOG_FILE, "a", encoding="utf-8") as log_file:
            log_file.write(f"[{datetime.now(timezone.utc).isoformat()}] {body}\n")

        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"ok")

    def log_message(self, format, *args):
        return

    def send_cors_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")


server = HTTPServer(("", PORT), DebugHandler)
print(f"Debug server on :{PORT}")
print(f"Writing logs to {LOG_FILE}")

try:
    server.serve_forever()
except KeyboardInterrupt:
    server.server_close()
