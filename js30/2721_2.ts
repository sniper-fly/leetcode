type Fn<T> = () => Promise<T>;

function promiseAll<T>(functions: Fn<T>[]): Promise<T[]> {
  const resolves: T[] = new Array(functions.length);
  let count = functions.length;
  return new Promise((res, rej) => {
    for (let i = 0; i < functions.length; ++i) {
      functions[i]()
        .then((v) => {
          resolves[i] = v
          --count;
          if (count <= 0) {
            res(resolves);
          }
        })
        .catch((v) => rej(v));
    }
  });
}

// const promise = promiseAll([() => new Promise((res) => res(42))]);
// promise.then(console.log); // [42]
