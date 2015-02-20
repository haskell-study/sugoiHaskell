# 問題
[Google Code Jam Japan 2011 予選 問題A カードシャッフル](https://code.google.com/codejam/contest/889487/dashboard#s=p0) を解くことを考える。

#### (1)
カードの枚数`m`、カット操作のリスト`cs`、知りたいカードの位置`w`として、`solve m cs w`がカードの番号を表す関数
```haskell
solve :: Int -> [(Int,Int)] -> Int -> Int
```
が既に実装されているものとして、この問題に解答するプログラムを作成せよ。
```haskell
solve _ _ _ = 114514
```
などとしておけば、コンパイルおよびは実行は可能となる。

#### (2) （時間があれば）
実際に`solve`関数を実装し、完全なプログラムを作成せよ。できれば Large のサンプルケースも（現実的な時間内で）解答可能なプログラムを作成する。また、Google Code Jam 上に提出し、正答かどうか確認せよ。
