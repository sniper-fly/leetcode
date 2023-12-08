type JSONValue =
  | null
  | boolean
  | number
  | string
  | JSONValue[]
  | { [key: string]: JSONValue };

declare global {
  interface Function {
    callPolyfill(
      context: Record<PropertyKey, any>,
      ...args: JSONValue[]
    ): JSONValue;
  }
}

Function.prototype.callPolyfill = function (context, ...args): JSONValue {
  const sym = Symbol();
  context[sym] = this;
  const result = context[sym](...args);
  delete context[sym];

  return result;
};

// function increment() {
//   this.count++;
//   return this.count;
// }
// increment.callPolyfill({ count: 1 }); // 2

export {};
