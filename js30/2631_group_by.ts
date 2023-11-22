declare global {
  interface Array<T> {
    groupBy(fn: (item: T) => string): Record<string, T[]>;
  }
}

Array.prototype.groupBy = function <T>(
  fn: (item: T) => string
): Record<string, T[]> {
  const groups: Record<string, T[]> = {};

  // for (const elem of this) {
  //   const key = fn(elem);
  //   if (groups[key] !== undefined) {
  //     groups[key].push(elem)
  //   } else {
  //     groups[key] = [elem]
  //   }
  // }

  for (const elem of this) {
    const key = fn(elem);
    (groups[key] ??= []).push(elem)
  }

  return groups;
};


console.log([1,2,3].groupBy(String)) // {"1":[1],"2":[2],"3":[3]}


export {};
