const basic = require("../Scripts/basic");
const advanced = require("../Scripts/advanced");
const custom = require("../Scripts/custom");

describe("Custom Calculator Unit Tests", () => {
    test("compound interest should calculate amount and interest correctly", () => {
        const result = custom.compoundInterest(1000, 10, 2);

        expect(result.amount).toBeCloseTo(1210);
        expect(result.interest).toBeCloseTo(210);
    });

    test("compound interest should handle zero rate", () => {
        const result = custom.compoundInterest(1000, 0, 5);

        expect(result.amount).toBeCloseTo(1000);
        expect(result.interest).toBeCloseTo(0);
    });

    test("compound interest should handle zero time", () => {
        const result = custom.compoundInterest(1000, 10, 0);

        expect(result.amount).toBeCloseTo(1000);
        expect(result.interest).toBeCloseTo(0);
    });

    test("compound interest should handle zero principal as boundary input", () => {
    const result = custom.compoundInterest(0, 10, 2);

    expect(result.amount).toBeCloseTo(0, 2);
    expect(result.interest).toBeCloseTo(0, 2);
});

    test("compound interest should throw error for negative principal", () => {
        expect(() => custom.compoundInterest(-1000, 10, 2)).toThrow();
    });

    test("compound interest should throw error for negative rate", () => {
        expect(() => custom.compoundInterest(1000, -10, 2)).toThrow();
    });

    test("compound interest should throw error for negative time", () => {
        expect(() => custom.compoundInterest(1000, 10, -2)).toThrow();
    });
});

describe("Integration Tests", () => {
    afterEach(() => {
        jest.restoreAllMocks();
    });

    test("compound interest should use both basic and advanced calculator modules", () => {
        const divideSpy = jest.spyOn(basic, "divide");
        const addSpy = jest.spyOn(basic, "add");
        const multiplySpy = jest.spyOn(basic, "multiply");
        const subtractSpy = jest.spyOn(basic, "subtract");
        const powSpy = jest.spyOn(advanced, "pow");

        const result = custom.compoundInterest(1000, 10, 2);

        expect(divideSpy).toHaveBeenCalledWith(10, 100);
        expect(addSpy).toHaveBeenCalled();
        expect(powSpy).toHaveBeenCalled();
        expect(multiplySpy).toHaveBeenCalled();
        expect(subtractSpy).toHaveBeenCalled();

        expect(result.amount).toBeCloseTo(1210);
        expect(result.interence).not.toBeDefined();
        expect(result.interest).toBeCloseTo(210);
    });
});

describe("installmentPlan", () => {
    test("splits amount evenly across months", () => {
        const result = custom.installmentPlan(1200, 12);

        expect(result.installment).toBeCloseTo(100, 2);
        expect(result.remainder).toBeCloseTo(0, 2);
    });

    test("calculates remainder for uneven installment split", () => {
        const result = custom.installmentPlan(1000, 3);

        expect(result.installment).toBeCloseTo(333.33, 2);
        expect(result.remainder).toBeCloseTo(0.01, 2);
    });

    test("throws error when months is zero", () => {
        expect(() => custom.installmentPlan(1000, 0)).toThrow();
    });

    test("throws error when months is negative", () => {
        expect(() => custom.installmentPlan(1000, -3)).toThrow();
    });

    test("throws error when months is not an integer", () => {
        expect(() => custom.installmentPlan(1000, 2.5)).toThrow();
    });

    test("throws error for negative total amount", () => {
        expect(() => custom.installmentPlan(-1000, 5)).toThrow();
    });

    test("throws error for invalid total amount", () => {
        expect(() => custom.installmentPlan(NaN, 5)).toThrow();
    });
});

describe("Driver Test", () => {
    test("driver directly invokes the custom calculator module", () => {
        const result = custom.compoundInterest(2000, 5, 2);

        expect(result.amount).toBeCloseTo(2205);
        expect(result.interest).toBeCloseTo(205);
    });
});