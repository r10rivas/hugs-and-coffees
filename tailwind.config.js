module.exports = {
  purge: [
    "./app/**/*.html.erb",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        app: {
          "pink": '#EE4380',
        },
      },
      fontFamily: {
        "happy-monkey": ["Happy-Monkey"],
        "roboto": ["Roboto"],
      },
      height: {
        "screen-without-navbar": "calc(100vh - 4rem)",
      },
      minHeight: {
        "screen-without-navbar": "calc(100vh - 4rem)",
      },
      maxHeight: {
        "screen-without-navbar": "calc(100vh - 4rem)",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
  ],
}
