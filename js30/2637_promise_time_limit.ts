type Fn = (...params: any[]) => Promise<any>;

// function timeLimit(fn: Fn, t: number): Fn {
//   return async function (...args) {
//     const original = fn(...args);
//     const onExceeded = new Promise((_res, rej) =>
//       setTimeout(() => {
//         rej("Time Limit Exceeded");
//       }, t)
//     );

//     return Promise.race([original, onExceeded]);
//   };
// }

function timeLimit(fn: Fn, t: number): Fn {
  return async function (...args) {
    return new Promise((res, rej) => {
      setTimeout(() => rej("Time Limit Exceeded"), t)
      fn(...args).then(res).catch(rej)
    })
  };
}

// const limited = timeLimit((t) => new Promise((res) => setTimeout(res, t)), 100);
// limited(150).catch(console.log); // "Time Limit Exceeded" at t=100ms
