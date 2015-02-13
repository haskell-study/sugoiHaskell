# 第7章
## 7-1
```haskell
data Point = Point Float Float 
```
#### (1)
上のコードにおける二つの`Point`の違いを簡潔に説明せよ。

#### (2)
（後者の）`Point`の型シグネチャを書け。

#### (3)
型`Point`およびその値コンストラクタをモジュールとしてエクスポートする方法を確認せよ。

## 7-2
```haskell
data EnergyDrink = EnergyDrink { name :: String, caffeine :: Float, sugar :: Float, price :: Int }
```
#### (1)
上の`EnergyDrink`の定義により自動的に生成される全ての関数の型シグネチャを書け。
 
#### (2)
実際に`EnergyDrink`の値を作成してみよ。

## 7-3
データ宣言に型クラス制約を付けないことの理由を簡潔に説明せよ。

## 7-4
整数に加えて無限大、マイナス無限大を取りうるデータ型`GInteger`を適当に定義せよ。なお、インスタンスの自動導出を利用して、`GInteger`を`Eq`, `Ord`, `Show`, `Read`, `Bounded` のインスタンスとすること。また、その型クラスのインスタンスとして適切に振る舞うことを確認せよ。

## 7-5
三次元ベクトル型`Vector`を
```haskell
data Vector a = Vector a a a deriving (Show)
```
とする。
#### (1)
外積`crossProd`を実装せよ。適切な実装を行えば`crossProd`の型は型推論されるが、自力で型シグネチャも書いてみよ。

#### (2)
モジュール`Data.Complex`中の`Complex`を用いて、複素三次元ベクトルの型シノニム`CVector`を定義せよ。

#### (3)
`CVector`を用いて、エルミート内積`dotProd`を実装せよ。適切な実装を行えば`dotProd`の型は型推論されるが、自力で型シグネチャも書いてみよ。

## 7-6
値に対して型というものが存在するが、型そのものに対してもメタな型が考えられ、Haskellではこれを種(kind)と呼ぶ。`Int`, `[]`, `Maybe`,  `Map`, `(Num a) => Maybe a` などについてkindを調べ、このことから「型コンストラクタは型を引数に取って新しい型を作る、型レベルのメタな関数と捉えられる」ということを確認せよ。kindは`:k`コマンドで調べられる。
