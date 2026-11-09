function pow(x, n) {
  return x ** n;
}

function modulo(a, b) {
  return a % b;
}

const advanced = { pow, modulo };

if (typeof module !== "undefined" && module.exports) {
  module.exports = advanced;
}
if (typeof window !== "undefined") {
  window.advanced = advanced;
}
