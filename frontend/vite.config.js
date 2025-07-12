import { defineConfig } from 'vite'

export default defineConfig({
  build: {
    outDir: '../assets',
    emptyOutDir: true,
    rollupOptions: {
      input: './src/main.js',
      output: {
        entryFileNames: 'main.min.js'
      }
    }
  }
})