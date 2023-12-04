type Fn = (...params: any) => any;

function memoize(fn: Fn): Fn {
  const cache: { [key: string]: any } = {};
  return function (...params) {
    // paramsをjsonでstringifyしてcacheのkeyにする
    const key = JSON.stringify(params);
    if (cache[key]) {
      return cache[key];
    }

    cache[key] = fn(...params);
    return cache[key];
  };
}

// let callCount = 0;
// const memoizedFn = memoize(function (a, b) {
//   callCount += 1;
//   return a + b;
// });
// console.log(memoizedFn(2, 3)); // 5
// console.log(memoizedFn(2, 3)); // 5
// console.log(callCount); // 1
