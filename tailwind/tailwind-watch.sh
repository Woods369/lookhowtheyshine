#!/usr/bin/env bash
set -euo pipefail

# Determine project root relative to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "👀 Starting Tailwind CSS watcher..."
echo "📁 Watching files in: layout/, templates/, sections/, snippets/, blocks/, assets/ (under $ROOT_DIR)"
echo "🔄 Will check for changes every 2 seconds"
echo "⏹️  Press Ctrl+C to stop watching"
echo ""

# Resolve tailwindcss binary
TW_BIN=""
if [[ -x "$ROOT_DIR/tailwindcss" ]]; then
  TW_BIN="$ROOT_DIR/tailwindcss"
elif [[ -x "$ROOT_DIR/node_modules/.bin/tailwindcss" ]]; then
  TW_BIN="$ROOT_DIR/node_modules/.bin/tailwindcss"
elif command -v npx >/dev/null 2>&1; then
  TW_BIN="npx tailwindcss"
fi

if [[ -z "$TW_BIN" ]]; then
  echo "❌ Could not find tailwindcss. Expected one of:"
  echo "   - $ROOT_DIR/tailwindcss"
  echo "   - $ROOT_DIR/node_modules/.bin/tailwindcss"
  echo "   - npx tailwindcss"
  echo "👉 Install with: npm i -D tailwindcss or place the standalone binary at project root."
  exit 1
fi

# Get initial timestamp
get_latest_mtime() {
  find "$ROOT_DIR/layout" "$ROOT_DIR/templates" "$ROOT_DIR/sections" \
       "$ROOT_DIR/snippets" "$ROOT_DIR/blocks" "$ROOT_DIR/assets" \
       -type f \( -name "*.liquid" -o -name "*.css" -o -name "*.js" \) 2>/dev/null \
    | xargs -r stat -c %Y 2>/dev/null \
    | sort -n | tail -1
}

LAST_CHANGE="$(get_latest_mtime || true)"

rebuild() {
  echo "🔄 Changes detected, rebuilding..."
  set +e
  # Use input/output relative to project root
  if $TW_BIN -i "$ROOT_DIR/assets/tailwind.css" -o "$ROOT_DIR/assets/tailwind-output.css"; then
    echo "✅ Tailwind CSS rebuilt successfully at $(date)"
  else
    echo "❌ Build failed!"
  fi
  set -e
}

while true; do
  CURRENT_CHANGE="$(get_latest_mtime || true)"
  if [[ "$CURRENT_CHANGE" != "$LAST_CHANGE" ]]; then
    rebuild
    LAST_CHANGE="$CURRENT_CHANGE"
  fi
  sleep 2
done
