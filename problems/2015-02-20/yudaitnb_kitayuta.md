## 8-1
#### (1)
`getLine`は`String`型ではなく、`IO String`型である。また、通常の型の値の束縛は`let`を付ける必要がある。
*修正後のコード*
```haskell
main = do
    putStrLn "What's your name?"
    s <- getLine
    let name = "I'm " ++ s
    putStrLn name
```

#### (2)
通常の型の値の束縛は`let`を付ける必要がある。
*修正後のコード*
```haskell
main = do
     let a = "my favorite number "
         b = "is "
     fNumber <- getLine
     putStrLn $ a ++ b ++ fNumber
```

#### (3)
正常にコンパイルされる。

## 8-2
以下を`initials.hs`とする。
```haskell
main = do
    lastName <- getLine
    firstName <- getLine
    putStrLn $ head firstName : '.' : head lastName :"."
```

## 8-3
```haskell
putStr :: String -> IO ()
putChar :: Char -> IO ()
print :: (Show a) => a -> IO ()
```
`putStr`は、文字列を受け取って出力する（改行はしない）。
`putChar`は、文字をひとつ受け取って出力する。
`print`は、`Show`のインスタンスの値を受け取って`show`した結果の文字列を出力する（改行もする）。

## 8-4
*出力結果*
```
1
2
3
[(),(),()]
```
`sequence`の返り値は`IO`に包まれた`[(),(),()]`であり、これが出力された。
`sequence`の代わりに`sequence_`を使えば、返り値は出力されない。

## 8-5
以下を`height.hs`とする。
```haskell
data Tree a = EmptyTree | Node a (Tree a) (Tree a)

singleton :: a -> Tree a
singleton e = Node e EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert e EmptyTree = singleton e
treeInsert e t@(Node g l r)
    | e < g = Node g (treeInsert e l) r
    | e > g = Node g l (treeInsert e r)
    | otherwise = t

heightTree :: Tree a -> Int
heightTree EmptyTree = 0
heightTree (Node _ l r) = 1 + max (heightTree l) (heightTree r)

genTree :: [Int] -> Tree Int
genTree as = foldr treeInsert EmptyTree as

main = do
    ss <- getContents
    mapM_ (print . heightTree . genTree . read) $ lines ss
```

## 8-6
```haskell
import Data.List
import Control.Monad

main = do
    n <- readLn
    ws <- replicateM n getLine
    let (as',bs') = partition (odd . fst) $ zip [1..] $ map (isValid . reverse) $ tail $ inits ws 
        as = map snd as'
        bs = map snd bs'
    putStrLn $ if and as && (not (and bs) || odd n) then "WIN" else "LOSE"

isValid :: [String] -> Bool
isValid [_] = True
isValid (nw:wrem@(lw:_)) = head nw == last lw && not (nw `elem` wrem)
```