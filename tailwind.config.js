/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./layout/*.liquid",
    "./templates/*.liquid", 
    "./sections/*.liquid",
    "./snippets/*.liquid",
    "./blocks/*.liquid"
  ],
  theme: {
    extend: {
      fontFamily: {
        'heading': ['var(--font-primary--heading)'],
        'body': ['var(--font-primary--body)']
      },
      colors: {
        'background': 'var(--color-background)',
        'foreground': 'var(--color-foreground)'
      },
      maxWidth: {
        'page': 'var(--page-width)'
      },
      spacing: {
        'page-margin': 'var(--page-margin)'
      },
      borderRadius: {
        'input': 'var(--style-border-radius-inputs)'
      },
      gridTemplateColumns: {
        'content': 'var(--content-grid)'
      }
    },
  },
  plugins: []
}
