class TimeLimitedCache {
  private cache: {
    [key: number]: {
      value: number;
      cancelId: number;
    };
  };
  constructor() {
    this.cache = {};
  }

  set(key: number, value: number, duration: number): boolean {
    // もし値が既にあればsetTimeoutを消去する
    let result = false;
    if (this.cache[key]) {
      clearTimeout(this.cache[key].cancelId);
      result = true;
    }
    const cancelId = setTimeout(() => delete this.cache[key], duration);
    this.cache[key] = { value, cancelId: Number(cancelId) };

    return result;
  }

  get(key: number): number {
    const cache = this.cache[key];
    if (!cache) {
      return -1;
    }
    return cache.value;
  }

  count(): number {
    return Object.keys(this.cache).length;
  }
}

// const timeLimitedCache = new TimeLimitedCache();
// timeLimitedCache.set(1, 42, 1000); // false
// console.log(timeLimitedCache.get(1)); // 42
// console.log(timeLimitedCache.count()); // 1
// new Promise((res) => setTimeout(res, 1010)).then(() => {
//   console.log(timeLimitedCache.get(1));
//   console.log(timeLimitedCache.count()); // 1
// });
