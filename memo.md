601. or条件を沢山使うこと、order by の多用は速度低下の要因になりうる
preceding, current row, following をウィンドウ関数で使う解法を一つ
row_number でdiffをとる方法を一つ

182. [sql] duplicate emails
愚直な方法しかできなかったので、他におもいついた方法
group byの利用、cross join, joinの利用 も試す

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

2677. chunk
slice を利用したもっとシンプルな実装も試す

# sqliteのテスト環境設定

まず適当にデータを用意する
sqlite3 test.db < create_table.sql

用意したスクリプトファイルで結果を出力する
sqlite3 test.db < 177_nth_highest.sq
