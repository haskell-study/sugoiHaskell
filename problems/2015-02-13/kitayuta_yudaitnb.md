# 第7章
## 7-1
#### (1)
`=`以前の`Point`は型コンストラクタ、`=`以後の`Point`は値コンストラクタの一部。

#### (2)
```haskell
Point :: Float -> Float -> Point
```

#### (3)
```haskell
module Modulename (Point(..)) where
```
とすればよい。  
## 7-2
#### (1)
```haskell
name :: EnergyDrink -> String
caffeine :: EnergyDrink -> Float
sugar :: EnergyDrink -> Float
price :: EnergyDrink -> Int
```
とすればよい。
#### (2)
```hasekell
ghci > EnergyDrink {name="Monster", caffeine=144.0, sugar=12.6, price=190}
```
1時間以内に1L以上飲むのは自殺行為らしいです。浪人中それくらい飲んでたかも...
## 7-3
もし仮にdata宣言に型クラス制約をつけることにしても、その型を用いる関数が型クラス制約を前提としているならば、  
関数内で結局もう一度型クラス制約を書くので二度手間になる。  
data宣言で型クラス制約を書かなければ、その型を用いる関数に型クラス制約が特に必要されてない場合    型クラス制約を省き、一般性を保つことが出来る。   
以上の二観点から、ここで宣言しても特に利益が無いと結論できる。
## 7-4
```haskell
data GInteger = NInf | Inte Integer | PInf deriving (Eq, Ord, Show, Read)
```
Eq型クラスのインスタンスとしてのGInteger
```
ghci > Inte 4 == Inte 6
True
```
Ord型クラスのインスタンスとしてのGInteger
```
ghci > NInf < Inte 4
True
```
Show型クラスのインスタンスとしてのGInteger
```
ghci > show NInf
"NInf"
```
Read型クラスのインスタンスとしてのGInteger
```
ghci > let a = "Inte " ++ "6"
ghci > read a :: GInteger
Inte 6
```
## 7-5
三次元ベクトル型`Vector`を
```haskell
data Vector a = Vector a a a deriving (Show)
```
とする。
#### (1)
```haskell
crossProd :: (Num a) => Vector a -> Vector a -> Vector a
crossProd (Vector ax ay az) (Vector bx by bz) 
	= Vector (ay*bz-az*by) (az*bx-ax*bz) (ax*by-ay*bx)
```
```
ghci> crossProd (Vector 1 0 0) (Vector 0 1 0)
Vector 0 0 1
```
ex*ey=ezのcyclicになっていることが確認できる。
#### (2)
```haskell
import Data.Complex
type CVector r = Vector (Complex r)
```

#### (3)
```haskell
dotProd :: RealFloat a => CVector a -> CVector a -> Complex a
dotProd (Vector i j k) (Vector l m n) 
	= i*(conjugate l) + j*(conjugate m) + k*(conjugate n)
```
```
ghci> dotProd (Vector (1:+1) (1:+1) (1:+1)) (Vector (1:+(-1)) (1:+(-1)) (1:+(-1)))
0.0 :+ 6.0
```
`(a:+b)`でa+biの意味。
## 7-6
```
ghci> :k Int
Int : *
ghci> :k []
[] :: * -> *
ghci> :k Maybe
Maybe :: * -> *
ghci> :k Map
Map :: * -> * -> *
ghci> :k (Num a) => Maybe a
(Num a) => Maybe a :: *
```
など。
