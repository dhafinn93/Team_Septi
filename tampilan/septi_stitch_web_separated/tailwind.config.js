/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['"Plus Jakarta Sans"', 'sans-serif'],
      },
      colors: {
        brand: {
          navy: '#0F172A',
          navylight: '#1E293B',
          gold: '#D97706',
          goldlight: '#F59E0B',
          goldbg: '#FFFBEB',
          cream: '#FAF9F6',
          graybg: '#F8FAFC'
        }
      }
    },
  },
  plugins: [],
}
