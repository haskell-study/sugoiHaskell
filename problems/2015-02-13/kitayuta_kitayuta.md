# 第7章

## 7-1
#### (1)
左の`Point`は型名であるのに対し、右の`Point`は値コンストラクタである。
#### (2)
```haskell
Point :: Float -> Float -> Point
```
#### (3)
```haskell
module Geometry (Point (..)) where
```
などとすればよい。

## 7-2
#### (1)
```haskell
name :: EnergyDrink -> String
caffeine :: EnergyDrink -> Float
sugar :: EnergyDrink -> Float
price :: EnergyDrink -> Int
```
#### (2)
```haskell
redbull = EnergyDrink {name="Red Bull", caffeine=80, sugar=20, price=200}
```
などとすればよい。

## 7-3
データ宣言に型クラス制約を付けても、結局関数の型宣言にも型クラス制約を付ける必要があるなど、特に利益が無いから。

## 7-4
```haskell
data GInteger = NInf | Fin Int | Inf deriving (Eq, Ord, Show, Read)
```
などとすればよい。

## 7-5
#### (1)
```haskell
crossProd :: (Num a) => Vector a -> Vector a -> Vector a
crossProd (Vector ax ay az) (Vector bx by bz) = Vector (ay*bz-az*by) (az*bx-ax*bz) (ax*by-ay*bx)
```
#### (2)
```haskell
type CVector r = Vector (Complex r)
```
#### (3)
```haskell
dotProd :: (RealFloat r) => CVector r -> CVector r -> Complex r
dotProd (Vector ax ay az) (Vector bx by bz) = ax * conjugate bx + ay * conjugate by + az * conjugate bz
```

## 7-6
省略