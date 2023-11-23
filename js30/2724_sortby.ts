type JSONValue = boolean | number | string | JSONValue[] | { [key: string]: JSONValue };
type Fn = (value: JSONValue) => number

function sortBy(arr: JSONValue[], fn: Fn): JSONValue[] {
	return arr.sort((a, b) => fn(a) - fn(b))
};

// sortBy([[3, 4], [5, 2], [10, 1]], d => d[1])
// console.log([[3, 4], [5, 2], [2, 1]].sort((a, b) => a[1] - b[1]))
