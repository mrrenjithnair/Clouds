#!/bin/bash
# Starts a local web server and opens the memories app in your browser.
cd "$(dirname "$0")"

# Pick a free port starting at 8000
PORT=8000
while lsof -i :$PORT >/dev/null 2>&1; do
  PORT=$((PORT+1))
done

echo "Serving Memories on http://localhost:$PORT"
echo "Press Ctrl+C to stop."

# Open the browser after a short delay (macOS)
( sleep 1 && open "http://localhost:$PORT" ) &

python3 -m http.server $PORT
