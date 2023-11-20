type JSONValue =
  | null
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };
// type Obj = Record<string, JSONValue> | Array<JSONValue>;

function chunk(arr: JSONValue[], size: number): JSONValue[][] {
  // 返却用の２次元配列
  const square: JSONValue[][] = [];
  // 2次元配列に挿入する 新しい line 配列を用意する
  let line: JSONValue[] = new Array(0);
  let count = size;
  // arr をループさせる
  for (let i = 0; i < arr.length; ++i) {
    line.push(arr[i]);
    --count;
    if (count === 0 || i === arr.length - 1) {
      square.push([...line]);
      line = new Array(0);
      count = size;
    }
  }
  return square;
}

// const arr = [1, 2, 3, 4, 5]
// console.log(chunk(arr, 2))

// Array.from({length: 5})
