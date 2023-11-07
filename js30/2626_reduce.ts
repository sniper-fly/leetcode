type Fn = (accum: number, curr: number) => number;

function reduce(nums: number[], fn: Fn, init: number): number {
  let total = init;
  for (let i = 0; i < nums.length; ++i) {
    total = fn(total, nums[i])
  }
  return total;
}
