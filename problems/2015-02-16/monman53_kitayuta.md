## 7-7
#### (1)
左結合。結合順位は9。
#### (2)
```haskell
infixr 7 ^*
```

## 7-9
#### (1)
GHCi上で確かめると、
```haskell
(==) :: (Eq a) => a -> a -> Bool
```
と、型クラス制約が述べられているという違いがある。
#### (2)
```haskell
instance Eq MString where
    MString s == MString t
        | 'M' `elem` s && 'M' `elem` t = True
        | otherwise = False
```
#### (3)
```haskell
data Vector a = Vector a a a
instance (Show a) => Show (Vector a) where
    show (Vector x y z) = "(" ++ show x ++ ", " ++ show y ++ ", " ++ show z ++ ")"
```

## 7-10
```haskell
class ColorImg a where
    colorImg :: a -> String
```