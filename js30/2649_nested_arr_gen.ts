type MultidimensionalArray = (MultidimensionalArray | number)[];

function* inorderTraversal(
  arr: MultidimensionalArray
): Generator<number, void, unknown> {
  for (const subset of arr) {
    if (typeof subset === "number") {
      yield subset;
    } else {
      // for (const elem of inorderTraversal(subset)) {
      //   yield elem
      // }
      yield* inorderTraversal(subset);
    }
  }
}

// const gen = inorderTraversal([1, [2, [3, [4, 5, 6]]]]);
// for (const val of gen) {
//   console.log(val)
// }
