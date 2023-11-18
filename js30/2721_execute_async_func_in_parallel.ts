type Fn<T> = () => Promise<T>;

function promiseAll<T>(functions: Fn<T>[]): Promise<T[]> {
  return new Promise((resolve, reject) => {
    const allValue: T[] = new Array(functions.length);
    let count = functions.length;
    // functions でループを回して、thenにresolve、catchにrejectを登録する
    for (let i = 0; i < functions.length; ++i) {
      functions[i]()
        .then((result) => {
          allValue[i] = result
          --count;
          if (count === 0) {
            resolve(allValue);
          }
        })
        .catch(reject);
    }
  });
}

// functions 全ての promise を実行し、
// 全ての promise が成功した場合 resolve する新しい promise を返す
// 全てのpromiseが成功、もしくはどれか一つがresolveするまで待つ

// const promise = promiseAll([() => new Promise(res => res(42))])
// promise.then(console.log); // [42]

// [
//   () => new Promise((resolve) => setTimeout(() => resolve(4), 50)),
//   () => new Promise((resolve) => setTimeout(() => resolve(10), 150)),
//   () => new Promise((resolve) => setTimeout(() => resolve(16), 100)),
// ];
