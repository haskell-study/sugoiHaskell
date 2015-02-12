## 5-2
#### (1)
```
Prelude> map (map (*3)) a
[[3,6,9,12],[15,18,21],[24,27,30]]
```

#### (2)
```
Prelude> map (filter (<=25) . map (*3)) a
[[3,6,9,12],[15,18,21],[24]]
```

#### (3)
```
Prelude> map (takeWhile (\x -> x `mod` 3 /= 0)) a
[[1,2],[5],[8]]
```

## 5-3
#### (1)
```
[0,3,6,9]
```
各要素に3を掛けている。

#### (2)
```
[4,3,2,1]
```
`reverse [1,2,3,4]` と同様の動作。

#### (3)
```
[[],[3],[2,3],[1,2,3]]
```
`reverse` の途中経過を記録する。

## 5-4
#### (1)
```haskell
addThree :: Int -> Int -> Int -> Int
addThree = \x -> \y -> \z -> x + y + z
```

#### (2)
```haskell
flip' :: (a -> b -> c) -> b -> a -> c
flip' = \f -> \x -> \y -> f y x
```

## 5-5
#### (1)
```haskell
-- foldl 版
mapl :: (a -> b) -> [a] -> [b]
mapl f xs = foldl (\ac x -> ac ++ [f x]) [] xs
-- foldr 版
mapr :: (a -> b) -> [a] -> [b]
mapr f xs = foldr (\x ac -> f x : ac) [] xs
```

#### (2)
- foldl 版では`++`を使うことになり、計算量が悪化する。これは、配列が foldr に適合した構造になっていることに由来する。
- foldl 版では無限リストをうまく扱えない。

## 5-6
```haskell
reverse' :: [a] -> [a]
-- 本来は Data.List の foldl' を使うべきである。foldl を使うべき局面はほぼないらしい。
-- 詳しくは http://tanakh.jp/posts/2014-04-07-foldl-is-broken.html 等を参照のこと。
reverse' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldr (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x ac -> if f x then x : ac else ac) []

last' :: [a] -> a
last' = foldr1 (flip const)
```

## 5-7
```haskell
hoge :: Num b => [b] -> [b]
hoge = map negate . map (+10)
```
