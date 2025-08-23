#!/bin/bash

echo "👀 Starting simple Tailwind CSS watcher..."
echo "📁 Watching files in: layout/, templates/, sections/, snippets/, blocks/, assets/"
echo "🔄 Will check for changes every 2 seconds"
echo "⏹️  Press Ctrl+C to stop watching"
echo ""

# Get initial timestamp
LAST_CHANGE=$(find layout/ templates/ sections/ snippets/ blocks/ assets/ -name "*.liquid" -o -name "*.css" -o -name "*.js" 2>/dev/null | xargs stat -c %Y 2>/dev/null | sort -n | tail -1)

while true; do
    # Check for changes
    CURRENT_CHANGE=$(find layout/ templates/ sections/ snippets/ blocks/ assets/ -name "*.liquid" -o -name "*.css" -o -name "*.js" 2>/dev/null | xargs stat -c %Y 2>/dev/null | sort -n | tail -1)
    
    if [ "$CURRENT_CHANGE" != "$LAST_CHANGE" ]; then
        echo "🔄 Changes detected, rebuilding..."
        ./tailwindcss -i ./assets/tailwind.css -o ./assets/tailwind-output.css
        if [ $? -eq 0 ]; then
            echo "✅ Tailwind CSS rebuilt successfully at $(date)"
        else
            echo "❌ Build failed!"
        fi
        LAST_CHANGE=$CURRENT_CHANGE
    fi
    
    sleep 2
done
