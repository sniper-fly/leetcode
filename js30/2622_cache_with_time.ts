class TimeLimitedCache {
  private cache: {
    [key: number]: {
      value: number;
      duration: number;
      timerId: number;
    };
  };

  constructor() {
    // キーバリュー型のインスタンス変数を定義する
    this.cache = {};
  }

  set(key: number, value: number, duration: number): boolean {
    let isAlreadyExisted = false;
    // key が存在しているか
    if (this.cache[key] !== undefined) {
      // 存在している場合は clearTimeoutでまずtimerを解除
      clearTimeout(this.cache[key].timerId);
      isAlreadyExisted = true;
    }
    // setTimeoutで duration後にキーバリューを削除
    const timerId: number = Number(
      setTimeout(() => delete this.cache[key], duration)
    );
    // 新たに値を設定
    this.cache[key] = { value, duration, timerId };

    return isAlreadyExisted;
  }

  get(key: number): number {
    // key が存在していたら、valueを返す
    const cache = this.cache[key];
    return cache === undefined ? -1 : cache.value;
  }

  count(): number {
    return Object.keys(this.cache).length;
  }
}

// const timeLimitedCache = new TimeLimitedCache();
// console.log(timeLimitedCache.set(1, 42, 1000)); // false
// console.log(timeLimitedCache.get(1)); // 42
// console.log(timeLimitedCache.count()); // 1

// function delay(timeoutMs: number) {
//   return new Promise((resolve) => {
//     setTimeout(resolve, timeoutMs);
//   });
// }

// Promise.resolve(() => setTimeout(() => {}, 1000)).then(() => {
//   console.log(timeLimitedCache.count());
// });

// delay(1000).then(() => {
//   console.log(timeLimitedCache.count());
// });

// new Promise((resolve) => {
//   setTimeout(resolve, 1000);
// }).then(() => {
//   console.log(timeLimitedCache.count());
// });
