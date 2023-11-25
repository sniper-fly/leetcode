type MultiDimensionalArray = (number | MultiDimensionalArray)[];

var flat = function (
  arr: MultiDimensionalArray,
  n: number
): MultiDimensionalArray {
  const flatRecursion = (
    flattedArr: MultiDimensionalArray,
    arr: MultiDimensionalArray,
    n: number
  ) => {
    if (n < 0) {
      flattedArr.push(arr)
      return
    }
    for (const elem of arr) {
      // 要素が numberであれば、配列newArrに追加する
      if (typeof elem === "number") {
        flattedArr.push(elem);
      } else {
        flatRecursion(flattedArr, elem, n - 1)
      }
    }
  };

  // 新しい配列を用意する
  const flattedArr: MultiDimensionalArray = [];
  flatRecursion(flattedArr, arr, n);
  return flattedArr;
};

// const hoge = [1, 2, 3, [4, 5, 6], 7, [8, 9, [10, 11, 12], 13], 14, [15, [16, [17, [18, [19]]]]]]
// const hoge = [1,2,3,[4,5,6],[7,8,[9,10,11],12],[13,14,15]]

// console.log(flat(hoge, 1))
