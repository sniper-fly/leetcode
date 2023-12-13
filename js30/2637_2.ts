type Fn = (...params: any[]) => Promise<any>;

function timeLimit(fn: Fn, t: number): Fn {
  return async function (...args) {
    // tが時間制限
    // args
    // t秒後にraise errorする
    const originalPromise = fn(...args);
    const timeLimit = new Promise((_, rej) =>
      setTimeout(() => rej("Time Limit Exceeded"), t)
    );
    return Promise.race([originalPromise, timeLimit]);
  };
}

const limited = timeLimit((t) => new Promise((res) => setTimeout(res, t)), 100);
limited(150).catch(console.log); // "Time Limit Exceeded" at t=100ms
