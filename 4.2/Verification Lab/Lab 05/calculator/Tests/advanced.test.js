const calculator = require("../Scripts/advanced");

describe("Power", () => {
    var BVAdata = [
        [10, 10, 10000000000],
        [1, 10, 1],
        [2, 10, 1024],
        [19, 10, 6131066257801],
        [20, 10, 10240000000000],
        [10, 1, 10],
        [10, 2, 100],
        [10, 19, 10000000000000000000],
        [10, 20, 100000000000000000000]
    ];

    describe.each(BVAdata)("BVA: pow(%p, %p), Expected: %p", (x, n, expected) => {
        test(`returns ${calculator.pow(x, n)}`, () => {
            expect(calculator.pow(x, n)).toBe(expected);
        });
    });

    var DTdata = [
        [3, 2, 9],
        [-2, 3, -8],
        [-2, 2, 4],
        [5, 0, 1],
        [2, -2, 0.25]
    ];

    describe.each(DTdata)("DT: pow(%p, %p), Expected: %p", (x, n, expected) => {
        test(`returns ${calculator.pow(x, n)}`, () => {
            expect(calculator.pow(x, n)).toBe(expected);
        });
    });
});

describe("Modulo", () => {
    var BVAdata = [
        [10, 10, 0],
        [1, 10, 1],
        [2, 10, 2],
        [19, 10, 9],
        [20, 10, 0],
        [10, 1, 0],
        [10, 2, 0],
        [10, 19, 10],
        [10, 20, 10]
    ];

    describe.each(BVAdata)("BVA: modulo(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.modulo(a, b)}`, () => {
            expect(calculator.modulo(a, b)).toBe(expected);
        });
    });

    var DTdata = [
        [15, 4, 3],
        [-10, 3, -1],
        [10, -3, 1],
        [-10, -3, -1]
    ];

    describe.each(DTdata)("DT: modulo(%p, %p), Expected: %p", (a, b, expected) => {
        test(`returns ${calculator.modulo(a, b)}`, () => {
            expect(calculator.modulo(a, b)).toBe(expected);
        });
    });
});
