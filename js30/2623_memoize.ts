type Fn = (...params: number[]) => number;

function memoize(fn: Fn): Fn {
  const cache = new Map<string, number>();

  return function (...args) {
    const cachedValue = cache.get(JSON.stringify(args));
    if (cachedValue !== undefined) {
      return cachedValue;
    }
    const result = fn(...args);
    cache.set(JSON.stringify(args), result);
    return result;
  };
}

/**
 * let callCount = 0;
 * const memoizedFn = memoize(function (a, b) {
 *	 callCount += 1;
 *   return a + b;
 * })
 * memoizedFn(2, 3) // 5
 * memoizedFn(2, 3) // 5
 * console.log(callCount) // 1
 */

// let callCount = 0;
// const memoizedFn = memoize(function (a, b) {
//   callCount += 1;
//   return a + b;
// });
// memoizedFn(0, 0); // 5
// memoizedFn(0, 0); // 5
// console.log(callCount); // 1
