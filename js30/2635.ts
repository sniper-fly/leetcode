function map(arr: number[], fn: (n: number, i: number) => number): number[] {
  const newArr: number[] = [];
  let i = 0;
  for (let item of arr) {
    newArr.push(fn(item, i));
    ++i;
  }
  return newArr;
}
