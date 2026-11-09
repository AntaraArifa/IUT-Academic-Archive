const { LengthConverter } = require("../src/2-converter");

describe("LengthConverter", () => {
  test("converts all supported measurements", () => {
    expect(LengthConverter("feets", 3)).toEqual([
      "36.00 inches",
      "0.00 miles"
    ]);

    expect(LengthConverter("inches", 63360)).toEqual([
      "5280.00 feets",
      "1.00 miles"
    ]);

    expect(LengthConverter("miles", 2)).toEqual([
      "10560.00 feets",
      "126720.00 inches"
    ]);
  });

  test("handles unsupported and loosely equal inputs", () => {
    expect(LengthConverter("meters", 3))
      .toBe("wrong input");

    expect(LengthConverter(new String("feets"), 1)).toEqual([
      "12.00 inches",
      "0.00 miles"
    ]);
  });
});