## 7-7
### (1)
関数や演算子を定義する際に結合性宣言を省略した場合,その関数や演算子はデフォルトで右結合と左結合のどちらになるか.  
また結合順位はいくつになるか答えよ.
### (2)
新しく作った演算子`^*`を右結合で結合順位を7にしたい場合どのように宣言したらよいか,その記述を書け.

## 7-8
欠番

## 7-9
### (1)
Eq型クラスは下のように定義されているが,`==`の型の定義(`(==) :: a -> a -> Bool`)はGHCi上`:t (==)`で確かめられるものと異なる.どのように異なるか答えよ.
```haskell
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y  = not (x /= y)
    x /= y  = not (x == y)
```
### (2)
`MString`型を以下のように定義する.
```haskell
data MString = MString String
```
`MString`を`Eq`のインスタンスにしたいが,`MString`型の値`MString s1` `MString s2`が等しいとは「文字列s1に`'M'`が一つ以上含まれかつ文字列s2に`'M'`が一つ以上含まれる」であることとしたい.  
これを満たすように`MString`を`Eq`のインスタンスにせよ.  
例:
```sh
ghci> MString "mtest" == MString "mtest"
False
ghci> MString "mtest" /= Mstring "mtest"
True
ghci> MString "Mtest" == MString "MtEsT"
True
```
### (3)
前回(第5回)三次元ベクトル型`Vector`を扱ったが,GHCi上でもっとカッコよくベクトルを表示したい.
```sh
ghci> Vector 1 2 3
(1, 2, 3)
```
このように表示されるよう`Vector`型を`Show`のインスタンスにせよ.

### (4)
```sh
ghci> :i MString Vector
ghci> :info MString Vector
```
などとすることで,`MString` `Vector`がそれぞれEq,Showのインスタンスになっていることを確認せよ.

## 7-10
monmanは新しい型を初めて見ると,その型を自作した型クラス`ColorImg`のインスタンスにする.これは初めて見たときの型に対する色のイメージをもたせる作業である.  
例えば`ColorImg`の`colorImg`メソッドを,インスタンス化された型に対して実行すると次のようになる.
```sh
ghci> colorImg (9 :: Int)
"Blue"
ghci> colorImg (2048 :: Int)
"Blue"
ghci> colorImg (0.2 :: Float)
"Cyan"
```
これを満たすような型クラス`ColorImg`をつくれ.色々な型をそのインスタンスにしなくて良い.
