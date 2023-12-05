function* fibGenerator(): Generator<number, any, number> {
  let a = 0, b = 1
  while (true) {
    yield a
    const tmp = a + b
    a = b
    b = tmp
  }
};


// const gen = fibGenerator();
// console.log(gen.next().value); // 0
// console.log(gen.next().value); // 1
// console.log(gen.next().value); // 1
// console.log(gen.next().value); // 1
// console.log(gen.next().value); // 1
