type F = (...args: string[]) => void;

function debounce(fn: F, t: number): F {
  let id: number | undefined = undefined;
  return function (...args) {
    clearTimeout(id)
    // t秒後に実行する関数を登録する
    id = Number(setTimeout(() => fn(...args), t))
  };
}

// const log = debounce(console.log, 100);
// log('1Hello'); // cancelled
// log('2Hello'); // cancelled
// log('3Hello'); // Logged at t=100ms
