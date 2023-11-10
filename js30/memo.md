2629. Function Composition
reduceRight, reduce, call, bind, 再帰
を使ったソリューションもやるべき

2715. timeout
基本的に、setTimeoutが全部完了するまでプログラムは終了しない

cancellableの実行でt秒timeout設定

setTimeout(() => {
  cancel();
}, cancelT);

の実行でcancelT秒timeout設定

t < cancelT のとき
実行予約が解除される前にresult.pushができるので、空ではない

t > cancelT
const timerId = setTimeout(() => fn(...args), t);
で予約した関数が実行されず、cancel()が先に実行されるので
配列は空
