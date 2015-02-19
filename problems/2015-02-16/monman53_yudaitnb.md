## 7-7
### (1)
左結合で、`infixl 9` (結合性最大)になる。
### (2)
```haskell
infixl 7 ^*
```

## 7-8
欠番

## 7-9
### (1)
下の型クラス定義では`a`の`Eq`型クラス制約が明示されているが`(==) :: a -> a -> Bool`ではそれが明示されていない。
```haskell
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y  = not (x /= y)
    x /= y  = not (x == y)
```
### (2)
```haskell
data MString = MString String
instance Eq MString
	where
		MString xs == MString ys
			| 'M' `elem` xs && 'M' `elem` ys = True
			| otherwise = False
```
確認してみると
```
ghci> MString "mtest" == MString "mtest"
False
ghci> MString "mtest" /= Mstring "mtest"
True
ghci> MString "Mtest" == MString "MtEsT"
True
```
### (3)
```haskell
data Vector a = Vector a a a
instance (Show a) => Show (Vector a) where
	show (Vector a b c) = "(" ++ (show a) ++ ", " ++ (show b) ++ ", " ++ (show c) ++ ")"
```
確認してみると
```
ghci> Vector 1 2 3
(1, 2, 3)
```
### (4)
確認
```
ghci> :i MString Vector
data MString = MString String   -- Defined at 1.hs:1:1
instance Eq MString -- Defined at 1.hs:4:10
data Vector a = Vector a a a    -- Defined at 1.hs:2:1
instance Show a => Show (Vector a) -- Defined at 1.hs:10:10
```
```
ghci> :info MString Vector
data MString = MString String   -- Defined at 1.hs:1:1
instance Eq MString -- Defined at 1.hs:4:10
data Vector a = Vector a a a    -- Defined at 1.hs:2:1
instance Show a => Show (Vector a) -- Defined at 1.hs:10:10
```
## 7-10
```haskell
class ColorImg a
	where
		colorImg :: a -> String
```
