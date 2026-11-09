const { insertionSort } = require("../src/3-sorting");

describe("insertionSort", () => {
  test("sorts normal and boundary inputs", () => {
    expect(insertionSort([3, -1, 2, 0]))
      .toEqual([-1, 0, 2, 3]);

    expect(insertionSort([]))
      .toEqual([]);

    const input = [2, 1];
    input[-1] = 100;

    expect(insertionSort(input).slice())
      .toEqual([1, 2]);
  });

  test("keeps equal-valued elements stable", () => {
    const first = {
      id: "first",
      valueOf: () => 2
    };

    const second = {
      id: "second",
      valueOf: () => 2
    };

    const smaller = {
      id: "smaller",
      valueOf: () => 1
    };

    const result = insertionSort([
      first,
      second,
      smaller
    ]);

    expect(result.map(item => item.id)).toEqual([
      "smaller",
      "first",
      "second"
    ]);
  });
});