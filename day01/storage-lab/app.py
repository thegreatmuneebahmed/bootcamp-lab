from http.server import HTTPServer, BaseHTTPRequestHandler
from pathlib import Path

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        data = Path("/data/visits.txt")

        visits = int(data.read_text()) if data.exists() else 0
        visits += 1

        data.write_text(str(visits))

        self.send_response(200)
        self.end_headers()

        self.wfile.write(
            f"Hello! Total visits: {visits}".encode()
        )

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()

