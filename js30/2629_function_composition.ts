type F = (x: number) => number;

function compose(functions: F[]): F {
  if (functions.length === 0) {
    return (x) => x
  }

  return functions.reduceRight((prev, curr) => {
    return (x) => curr(prev(x));
  });
}

// const fn = compose([x => x + 1, x => 2 * x])
// fn(4) // 9

// const hoge = [x => x + 1, x => 2 * x]
// const result = hoge.reduceRight((prev, curr) => {
//   return curr(prev(x))
// })

// const foo = [2, 4, 5, 1, 3, 9, 7, 6]
// const res = foo.reduceRight((prev, curr) => {
//   console.log(prev, curr)
//   return prev + curr
// })

const foo = [2, 4, 5, 1, 3, 9, 7, 6]
const res = foo.reduce((prev, curr) => {
  console.log(prev, curr)
  return prev + curr
})

console.log('==========')
console.log(res)
