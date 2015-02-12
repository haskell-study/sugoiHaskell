## 6-1
#### (1)
```haskell
import qualified Data.Map as Map hiding (size)
```

#### (2)
```
ghci> ord '阪'
38442
```

#### (3)
`foldl'`が正格な評価を行う。

## 6-2
#### (1)
```haskell
import Data.List
countM :: String -> Int
countM = length . filter (\xs -> not (null xs) && head xs == 'M') . tails
```

#### (2)
```haskell
find' :: (a -> Bool) -> [a] -> Maybe a
find' f = foldr (\x ac -> if f x then Just x else ac) Nothing
```

## 6-3
#### (1)
```haskell
import Data.List
countString :: String -> String -> Int
countString q str = length $ filter (q `isPrefixOf`) $ tails str
```

#### (2)
```haskell
countWords :: [String] -> String -> [(String,Int)]
countWords ws str = map (\w -> (w,length $ filter (== w) $ words str)) ws
```

## 6-4
```haskell
module SugoiModule (countM,find',countString,countWords) where

import Data.List

countM :: String -> Int
countM = length . filter (\xs -> not (null xs) && head xs == 'M') . tails

find' :: (a -> Bool) -> [a] -> Maybe a
find' f = foldr (\x ac -> if f x then Just x else ac) Nothing

countString :: String -> String -> Int
countString q str = length $ filter (q `isPrefixOf`) $ tails str

countWords :: [String] -> String -> [(String,Int)]
countWords ws str = map (\w -> (w,length $ filter (== w) $ words str)) ws
```
