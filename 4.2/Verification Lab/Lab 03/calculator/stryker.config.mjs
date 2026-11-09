/** @type {import('@stryker-mutator/api/core').PartialStrykerOptions} */
export default {
  mutate: ["src/**/*.js"],

  testRunner: "jest",

  reporters: [
    "html",
    "clear-text",
    "progress"
  ],

  coverageAnalysis: "perTest",

  htmlReporter: {
    fileName: "reports/mutation/mutation.html"
  }
};