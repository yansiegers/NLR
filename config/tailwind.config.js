const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        'nlr-blue': {
          DEFAULT: '#19AEE9',
          dark: '#004D7D'
        },
        'nlr-orange': {
          light: '#F8B985',
          DEFAULT: '#ED7914'
        },
        'nlr-grey': {
          light: '#F2F5FB',
          DEFAULT: '#D8DEEB'
        }
      },
      fontFamily: {
        sans: ['Poppins', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
