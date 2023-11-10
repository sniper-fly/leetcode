type JSONValue =
  | null
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };
type Fn = (...args: JSONValue[]) => void;

function cancellable(fn: Fn, args: JSONValue[], t: number): Function {
  const timerId = setTimeout(() => fn(...args), t);
  return () => clearTimeout(timerId);
  // return () => {}
}

const result: JSONValue[] = [];

const fn = (x: number) => x * 5;
const args = [2],
  t = 2,
  cancelT = 5;

const start = performance.now();

const log = (...argsArr: JSONValue[]) => {
  const diff = Math.floor(performance.now() - start);
  result.push({ time: diff, returned: fn(argsArr[0] as number) });
};

const cancel = cancellable(log, args, t);

const maxT = Math.max(t, cancelT);

setTimeout(() => {
  cancel();
}, cancelT);

setTimeout(() => {
  console.log(result); // [{"time":20,"returned":10}]
}, maxT + 100);
