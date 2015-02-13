# 7章

## 7-1
### (1)
=の前の`Point`は型コンストラクタ。  
=の後の`Point`は値コンストラクタ。
### (2)
```haskell
Point :: Float -> Float -> Point
```
### (3)
```haskell
module PointModule
( Point(..)
) where
```
## 7-2
### (1)
```haskell
name :: EnergyDrink -> String
caffeine :: EnergyDrink -> Float
sugar :: EnergyDrink -> Float
price :: EnergyDrink -> Int
```
### (2)
```sh
ghci> EnergyDrink {name = "LipovitanD", caffeine = 50.0, sugar = 19.0, price = 142}
```

## 7-3

* データ宣言時に型クラス制約をしても、その型を用いる関数定義時に結局再び型クラス制約を記述しなくてはならなくなるため。
* そもそもコーディング規約で決まっている。

## 7-4
```haskell
data GInteger = NegInf | Value Integer | Inf deriving (Eq, Ord, Show, Read, Bounded)
```

## 7-5
### (1)
```haskell
crossProd :: Num a => Vector a -> Vector a -> Vector a
crossProd (Vector i j k) (Vector l m n) = Vector (j*n - m*k) (k*l - i*n) (i*m - j*l)
```
### (2)
```haskell
import Data.Complex
type CVector a = Vector (Complex a)
```
### (3)
```haskell
dotProd :: RealFloat a => CVector a -> CVector a -> Complex a
dotProd (Vector i j k) (Vector l m n) = i*(conjugate l) + j*(conjugate m) + k*(conjugate n)
```
## 7-6
```sh
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
ghci> 
```
