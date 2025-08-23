#!/bin/bash

echo "👀 Starting Tailwind CSS watcher..."
echo "📁 Watching files in: layout/, templates/, sections/, snippets/, blocks/, assets/"
echo "🔄 Will automatically rebuild when changes are detected"
echo "⏹️  Press Ctrl+C to stop watching"
echo ""

./tailwindcss -i ./assets/tailwind.css -o ./assets/tailwind-output.css --watch
