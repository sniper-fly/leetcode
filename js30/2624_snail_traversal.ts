declare global {
  interface Array<T> {
    snail(rowsCount: number, colsCount: number): number[][];
  }
}

// Array.prototype.snail = function (
//   rowsCount: number,
//   colsCount: number
// ): number[][] {
//   if (rowsCount * colsCount !== this.length || rowsCount < 0 || colsCount < 0) {
//     return [];
//   }

//   // rowsCount のぶんだけ配列をparentに追加する
//   const parent: number[][] = Array.from({length: rowsCount}, () => [])

//   for (let i = 0; i < this.length; ) {
//     // 下り
//     // x を 最初は 0 から固定 y を 0 ~ rowsCount - 2 まで動かす
//     for (let y = 0; y < rowsCount && i < this.length; ++y, ++i) {
//       parent[y].push(this[i]);
//     }

//     // 上り
//     // x を +1 して固定 y を rowCount - 1 ~ 0 まで動かす
//     for (let y = rowsCount - 1; y >= 0 && i < this.length; --y, ++i) {
//       parent[y].push(this[i]);
//     }
//   }

//   return parent;
// };

Array.prototype.snail = function (
  rowsCount: number,
  colsCount: number
): number[][] {
  if (rowsCount * colsCount !== this.length || rowsCount < 0 || colsCount < 0) {
    return [];
  }

  // rowsCount のぶんだけ配列をparentに追加する
  const parent: number[][] = Array.from({length: rowsCount}, () => [])

  for (let i = 0, y = 0, alt = 1; i < this.length; ++i, y += alt) {
    // 上下方向転換
    if (y >= rowsCount || y < 0) {
      alt = -alt
      y += alt
    }
    parent[y].push(this[i])
  }

  return parent;
};


const nums = [19, 10, 3, 7, 9, 8, 5, 2, 1, 17, 16, 14, 12, 18, 6, 13, 11, 20, 4, 15]
const rowsCount = 5
const colsCount = 4
console.log(nums.snail(rowsCount, colsCount)); // [[1,2,3,4]]

let hoge: number[][] = new Array(3).fill(undefined).map(() => [])
console.log(hoge)
// [ [], [], [] ]

let fuga: number[][] = new Array(3).map(() => [])
console.log(fuga)
// [ <3 empty items> ]

export {};
