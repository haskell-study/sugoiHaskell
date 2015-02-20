# 8
## 8-1
### (1)
`getLine`は`IO String`型であって`String`ではないため。この場合、IOアクションの結果は束縛して用いる。
```haskell
main = do
    putStrLn "What's your name?"
    name <- getLine
    putStrLn $ "I'm " ++ name
```
### (2)
純粋な式には`let`を用いて束縛する必要がある。
```hasklell
main = do
    let a = "my favorite number "
        b = "is "
    fNumber <- getLine
    putStrLn $ a ++ b ++ fNumber
```
### (3)
エラーにはならない。

## 8-2
```haskell
-- initials.hs

import Data.Char

main = do
    lastName <- getLine
    firstName <- getLine
    putStrLn $ (toUpperHead firstName):'.':(toUpperHead lastName):'.':[]                                           

toUpperHead :: String -> Char
toUpperHead str = toUpper (head str)
```

## 8-3
### putStr
文字列を改行なしで表示する。
```haskell
putStr :: [Char] -> IO ()
```
### putChar
文字を改行なしで表示する。
```haskell
putChar :: Char -> IO ()
```
### print
Showのインスタンスの型であれば、改行つきでその値を表示する。(GHCiでの表示と同じ)
```haskell
print :: (Show a) => a -> IO ()
```

## 8-4
```sh
ghci> sequence $map print [1,2,3]
1
2
3
[(),(),()]
```
`IO ()`型は表示が省略されるが、それ以外は表示されるため。今回の場合は`sequence`が`IO [()]`を返す。
```sh
ghci> mapM_ print [1,2,3]
```
とすれば`[(),(),()]`が表示されない。
## 8-5
### (1)
```haskell
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a -> Tree a
singleton n = Node n EmptyTree EmptyTree 

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node n left right)
    | x == n    = Node x left right
    | x < n     = Node n (treeInsert x left) right
    | x > n     = Node n left (treeInsert x right)

numTree :: (Ord a) => [a] -> Tree a
numTree = foldr treeInsert EmptyTree
```
### (2)
```haskell
main = forever $ do
    tree <- readLn
    print $ heightTree ( numTree ( tree :: [Int]))

heightTree :: Tree a -> Int
heightTree EmptyTree = 0
heightTree (Node _ left right) = 1 + max (heightTree left) (heightTree right)
```
## 8-6
```haskell
main = do
    n <- readLn 
    list <- sequence $ replicate n getLine
    if result list ["Z"]
        then putStrLn "A no KACHI!"
        else putStrLn "A no MAKE"

result :: [String] -> [String] -> Bool
result [] _     = False
result (xa:[]) h  = if last (last h) /= head xa || elem xa h then False else True
result (xa:xb:ls) h         
    | elem xa h             = False
    | last xa /= head xb    = True
    | otherwise             = result ls (h ++ xa:[] ++ xb:[])
```
