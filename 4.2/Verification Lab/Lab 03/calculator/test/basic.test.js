const calculator = require("../src/basic");

describe("Add", () => {
    var BVAdata = [
        [10, 10, 20],
        [1, 10, 11],
        [2, 10, 12],
        [19, 10, 29],
        [20, 10, 30],
        [10, 1, 11],
        [10, 2, 12],
        [10, 19, 29],
        [10, 20, 30]
    ];

    describe.each(BVAdata)("BVA: add(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.add(a, b)}`, () => {
            expect(calculator.add(a, b)).toBe(expected);
        });
    });

    var DTdata = [
        [0, 89, 89],
        [-17, -35, -52],
        [65, -12, 53],
        [-78, 24, -54]
    ];

    describe.each(DTdata)("DT: add(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.add(a, b)}`, () => {
            expect(calculator.add(a, b)).toBe(expected);
        });
    });
});

describe("Subtract", () => {
    var BVAdata = [
        [10, 10, 0],
        [1, 10, -9],
        [2, 10, -8],
        [19, 10, 9],
        [20, 10, 10],
        [10, 1, 9],
        [10, 2, 8],
        [10, 19, -9],
        [10, 20, -10]
    ];

    describe.each(BVAdata)("BVA: subtract(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.subtract(a, b)}`, () => {
            expect(calculator.subtract(a, b)).toBe(expected);
        });
    });

    var DTdata = [
        [0, 7, -7],
        [-10, -4, -6],
        [25, -5, 30],
        [-20, 6, -26]
    ];

    describe.each(DTdata)("DT: subtract(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.subtract(a, b)}`, () => {
            expect(calculator.subtract(a, b)).toBe(expected);
        });
    });
});

describe("Multiply", () => {
    var BVAdata = [
        [10, 10, 100],
        [1, 10, 10],
        [2, 10, 20],
        [19, 10, 190],
        [20, 10, 200],
        [10, 1, 10],
        [10, 2, 20],
        [10, 19, 190],
        [10, 20, 200]
    ];

    describe.each(BVAdata)("BVA: multiply(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.multiply(a, b)}`, () => {
            expect(calculator.multiply(a, b)).toBe(expected);
        });
    });

    var DTdata = [
        [0, 12, 0],
        [-3, -6, 18],
        [8, -4, -32],
        [-7, 5, -35]
    ];

    describe.each(DTdata)("DT: multiply(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.multiply(a, b)}`, () => {
            expect(calculator.multiply(a, b)).toBe(expected);
        });
    });
});

describe("Divide", () => {
    var BVAdata = [
        [10, 10, 1],
        [1, 10, 0.1],
        [2, 10, 0.2],
        [19, 10, 1.9],
        [20, 10, 2],
        [10, 1, 10],
        [10, 2, 5],
        [10, 19, 10 / 19],
        [10, 20, 0.5]
    ];

    describe.each(BVAdata)("BVA: divide(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.divide(a, b)}`, () => {
            expect(calculator.divide(a, b)).toBe(expected);
        });
    });

    var DTdata = [
        [0, 5, 0],
        [-12, -3, 4],
        [15, -5, -3],
        [-20, 4, -5],
        [5, 0, Infinity]
    ];

    describe.each(DTdata)("DT: divide(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.divide(a, b)}`, () => {
            expect(calculator.divide(a, b)).toBe(expected);
        });
    });
});