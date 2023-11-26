type JSONValue =
  | null
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };
type Obj = Record<string, JSONValue> | Array<JSONValue>;

const isRecord = (obj: any): obj is Record<string, JSONValue> => {
  return typeof obj === "object" && obj !== null && !Array.isArray(obj);
};

function compactObject(obj: Obj): Obj {
  if (isRecord(obj)) {
    const compacted: Record<string, JSONValue> = {};
    Object.keys(obj).forEach((key) => {
      const val = obj[key];
      if (!val) return;
      compacted[key] = typeof val === "object" ? compactObject(val) : val;
    });
    return compacted;
  } else {
    const compacted: Array<JSONValue> = [];
    for (const elem of obj) {
      if (elem)
        compacted.push(typeof elem === "object" ? compactObject(elem) : elem);
    }
    return compacted;
  }
}

// const hoge: Obj = [0, 1, [1, 2, 0, [ 0, 1 ]], { 1: 0, 2: 1 } ];
// const fuga: Obj = { a: "a", b: 0 };

// console.log(compactObject(hoge));
// console.log(compactObject(fuga));
