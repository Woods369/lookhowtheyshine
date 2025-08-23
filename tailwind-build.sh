#!/bin/bash

echo "🎨 Building Tailwind CSS..."
./tailwindcss -i ./assets/tailwind.css -o ./assets/tailwind-output.css

if [ $? -eq 0 ]; then
    echo "✅ Tailwind CSS built successfully!"
    echo "📄 Output file: assets/tailwind-output.css"
    ls -lh assets/tailwind-output.css
else
    echo "❌ Tailwind CSS build failed!"
    exit 1
fi
