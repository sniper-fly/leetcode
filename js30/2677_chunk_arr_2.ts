type JSONValue =
  | null
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };

function chunk(arr: JSONValue[], size: number): JSONValue[][] {
  const square: JSONValue[][] = [];
  for (let i = 0; i < arr.length; i += size) {
    square.push(arr.slice(i, i + size))
  }
  return square
}

const arr = [1, 2, 3, 4, 5]
console.log(chunk(arr, 2))
