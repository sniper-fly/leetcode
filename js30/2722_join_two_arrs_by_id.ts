type simpleObj = { [key: string]: JSONValue; id: number };

type JSONValue =
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };

function join(arr1: simpleObj[], arr2: simpleObj[]): JSONValue[] {
  // number を key とするオブジェクト を作成
  const idKeyObj: { [id: number]: JSONValue } = {};
  // arr1 から順に読み取り、idをkeyにしてvalueをelemとする
  for (const elem of arr1) {
    idKeyObj[elem.id] = elem;
  }

  // arr2 を順に読み取る
  for (const elem of arr2) {
    // obj が既に存在したら、value を上書きするが、objにあってelemにないものは残す
    // Object.assign((idKeyObj[elem.id] ??= elem), elem);
    if (idKeyObj[elem.id]) {
      Object.assign(idKeyObj[elem.id], elem);
    } else {
      idKeyObj[elem.id] = elem;
    }
  }
  // idKeyObjを配列に変換する
  return Object.values(idKeyObj);
}

// const arr1 = [
//   { id: 1, x: 2, y: 3 },
//   { id: 2, x: 3, y: 6 },
// ];
// const arr2 = [
//   { id: 2, x: 10, y: 20 },
//   { id: 3, x: 0, y: 0 },
// ];

const arr1 = [{ id: 1, b: { b: 94 }, v: [4, 3], y: 48 }];
const arr2 = [{ id: 1, b: { c: 84 }, v: [1, 3] }];

console.log(join(arr1, arr2));
