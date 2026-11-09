const { calculateLoan } = require("../src/1-loan");

describe("calculateLoan", () => {
  test("calculates valid and boundary payments", () => {
    expect(calculateLoan(1000, 12, 10)).toBe("112.00");
    expect(calculateLoan(0, 0, 1)).toBe("0.00");
    expect(calculateLoan(1000, 5, 0)).toBe("Infinity");
  });

  test("rejects invalid loan amounts", () => {
    expect(calculateLoan("", 5, 12))
      .toBe("Please provide a valid loan amount");

    expect(calculateLoan(-1, 5, 12))
      .toBe("Please provide a valid loan amount");

    expect(calculateLoan("abc", 5, 12))
      .toBe("Please provide a valid loan amount");
  });

  test("rejects invalid interest rates", () => {
    expect(calculateLoan(1000, "", 12))
      .toBe("Please provide a valid interestRate");

    expect(calculateLoan(1000, -1, 12))
      .toBe("Please provide a valid interestRate");

    expect(calculateLoan(1000, "abc", 12))
      .toBe("Please provide a valid interestRate");
  });

  test("rejects invalid months", () => {
    expect(calculateLoan(1000, 5, ""))
      .toBe("Please provide a valid month");

    expect(calculateLoan(1000, 5, -1))
      .toBe("Please provide a valid month");

    expect(calculateLoan(1000, 5, "abc"))
      .toBe("Please provide a valid month");
  });
});