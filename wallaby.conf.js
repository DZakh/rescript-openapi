const packageJson = require("./package.json");

const { files: tests } = packageJson.ava;

module.exports = () => ({
  files: ["src/**/*.res.js"],
  tests,
  env: {
    type: "node",
    runner: "node",
  },
  debug: false,
  testFramework: "ava",
});
