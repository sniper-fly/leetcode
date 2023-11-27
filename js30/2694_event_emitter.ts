type Callback = (...args: any[]) => any;
type Subscription = {
  unsubscribe: () => void;
};

class EventEmitter {
  // インスタンスはsubscribeされた関数の配列を保持する必要がある
  // eventName: Callback[] とする
  private callbacks: {
    [key: string]: Callback[];
  };

  constructor() {
    this.callbacks = {}
  }

  subscribe(eventName: string, callback: Callback): Subscription {
    // callbacks に callbackを追加する
    (this.callbacks[eventName] ??= []).push(callback);
    return {
      // subscribe時に、追加したcallbackに対する参照を保持し、
      // unsubscribe時に削除できるようにする
      unsubscribe: () => {
        this.callbacks[eventName] = this.callbacks[eventName].filter(
          (fn) => fn !== callback
        );
      },
    };
  }

  emit(eventName: string, args: any[] = []): any[] {
    return (this.callbacks[eventName] ??= []).map((fn) => fn(...args));
  }
}

// const emitter = new EventEmitter();

// // Subscribe to the onClick event with onClickCallback
// function onClickCallback() { return 99 }
// const sub = emitter.subscribe('onClick', onClickCallback);

// console.log(emitter.emit('onClick')); // [99]
// sub.unsubscribe(); // undefined
// console.log(emitter.emit('onClick')); // []
// console.log(emitter.emit('onCli')); // []
