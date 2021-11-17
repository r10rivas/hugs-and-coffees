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
      maxWidth: {
        "72": "18rem",
        "80": "20rem",
        "88": "22rem",
        "92": "23rem",
      },
      minWidth: {
        "72": "18rem",
        "80": "20rem",
        "88": "22rem",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
    require('@tailwindcss/line-clamp'),
  ],
}
