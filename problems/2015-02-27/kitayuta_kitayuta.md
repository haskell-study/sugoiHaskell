# 解答

## 11-1
#### コード
```haskell
import Control.Applicative

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap f (Node a t u) = Node (f a) (fmap f t) (fmap f u)
    fmap f EmptyTree = EmptyTree

instance Applicative Tree where
    pure f = Node f (pure f) (pure f)
    EmptyTree <*> _ = EmptyTree
    _ <*> EmptyTree = EmptyTree
    (Node f t u) <*> (Node x v w) = Node (f x) (t <*> v) (u <*> w)
```

#### 実行例
```
ghci > let t = Node 1 (Node 2 (Node 4 EmptyTree EmptyTree) (Node 5 EmptyTree EmptyTree) ) (Node 3 EmptyTree EmptyTree)
ghci > let u = Node 6 (Node 7 EmptyTree (Node 9 EmptyTree EmptyTree)) (Node 8 EmptyTree (Node 10 EmptyTree EmptyTree))
ghci > (*) <$> u <*> t
Node 6 (Node 14 EmptyTree (Node 45 EmptyTree EmptyTree)) (Node 24 EmptyTree EmptyTree)
```

## 11-2
#### コード
```haskell
import Control.Applicative

newtype PList a b = PList { getList :: [(a,b)] }

instance Functor (PList a) where
    fmap f (PList pl) = PList $ map (\(p,v) -> (p,f v)) pl

instance (Num a) => Applicative (PList a) where
    pure f = PList $ [(1,f)]
    (PList pl) <*> (PList pn) = PList $ (map (\(p,f) -> \(q,a) -> (p*q,f a)) pl) <*> pn
```

#### 実行例
```
ghci> let dice = PList [(1/6,n) | n <- [1..6]]
ghci> sum $ map (\(p,v) -> p * v) $ getList $ pure (+) <*> dice <*> dice
7.0
```
