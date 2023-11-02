type F = (x: number) => number;

function compose(functions: F[]): F {
  return function(x) {
    let total = x;
    const reversed = functions.reverse()
    for (const f of reversed) {
      total = f(total)
    }
    return total;
  }
};

/**
 * const fn = compose([x => x + 1, x => 2 * x])
 * fn(4) // 9
 */
