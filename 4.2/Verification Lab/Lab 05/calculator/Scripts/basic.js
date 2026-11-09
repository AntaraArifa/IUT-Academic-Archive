function add(a, b) {
  return a + b;
}

function subtract(a, b) {
  return a - b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

const basic = { add, subtract, multiply, divide };

// Works both in Node (Jest tests) and in the browser (script tag)
if (typeof module !== "undefined" && module.exports) {
  module.exports = basic;
}
if (typeof window !== "undefined") {
  window.basic = basic;
}
