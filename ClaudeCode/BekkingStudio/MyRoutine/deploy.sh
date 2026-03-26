#!/bin/bash
# GOD+生 (MyRoutine) deploy script
# Copies MyRoutine.html to all required locations for GitHub Pages

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
SRC="$SCRIPT_DIR/MyRoutine.html"
SW_SRC="$SCRIPT_DIR/sw.js"

if [ ! -f "$SRC" ]; then
  echo "ERROR: MyRoutine.html not found at $SRC"
  exit 1
fi

# Copy to local index.html
cp "$SRC" "$SCRIPT_DIR/index.html"
echo "✅ Copied to MyRoutine/index.html"

# Copy to git root for GitHub Pages
cp "$SRC" "$ROOT_DIR/index.html"
echo "✅ Copied to root/index.html"

# Copy sw.js to git root
if [ -f "$SW_SRC" ]; then
  cp "$SW_SRC" "$ROOT_DIR/sw.js"
  echo "✅ Copied sw.js to root"
fi

echo "🚀 Deploy files ready. Run 'git add' and 'git commit' to publish."
