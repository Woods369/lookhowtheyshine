#!/bin/bash

echo "🎨 Tailwind CSS Helper"
echo "====================="
echo "1. Build once (./tailwind-build.sh)"
echo "2. Watch for changes (./tailwind-watch.sh)"
echo "3. Show current CSS file info"
echo "4. Exit"
echo ""

read -p "Choose an option (1-4): " choice

case $choice in
    1)
        echo "Building Tailwind CSS..."
        ./tailwind-build.sh
        ;;
    2)
        echo "Starting Tailwind watcher..."
        ./tailwind-watch.sh
        ;;
    3)
        echo "📄 Tailwind CSS files:"
        echo "Input:  assets/tailwind.css"
        echo "Output: assets/tailwind-output.css"
        echo ""
        if [ -f "assets/tailwind-output.css" ]; then
            echo "Output file details:"
            ls -lh assets/tailwind-output.css
            echo ""
            echo "Last 5 lines of input file:"
            tail -5 assets/tailwind.css
        else
            echo "❌ Output file not found. Run build first."
        fi
        ;;
    4)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid option. Please choose 1-4."
        ;;
esac
