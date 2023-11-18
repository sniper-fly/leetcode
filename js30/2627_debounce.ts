type F = (...args: number[]) => void;

function debounce(fn: F, t: number): F {
  let timerId: undefined | number = undefined;
  return function (...args) {
    // 現在記録されている fn を clearTimeout する
    clearTimeout(timerId);

    // t m秒後に fnをsetTimeoutする
    timerId = Number(
      setTimeout(() => {
        fn(...args);
      }, t)
    );
  };
}

/**
 * const log = debounce(console.log, 100);
 * log('Hello'); // cancelled
 * log('Hello'); // cancelled
 * log('Hello'); // Logged at t=100ms
 */

async function a(t: number) {
  return new Promise((resolve) => {
    setTimeout(resolve, t);
  });
}

// a(1000).then(() => { console.log('a') })
// console.log('b')
// a(1000).then(() => { console.log('c') })
// console.log('d')

// async function main() {
//   const timerId = setTimeout(() => {
//     console.log("aa");
//   }, 10);
//   await a(100);
//   clearTimeout(timerId);
// }

// main();
