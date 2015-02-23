### 問題の指定の型シグネクチャを無視してます
###(1)
```haskell
import Data.List
import Data.Char
import Control.Monad

main = do
    t <- readLn
    forM_ [1..t] $ \n -> do
        xs <- getLine
        let [m,c,w] = map read $ words xs
        ablist <- replicateM c getLine
        putStrLn $ "Case #"　++ show n ++ ": " ++ 
            show (solve (card c m ablist) w)

solve :: [Int] -> Int -> Int
solve card w = card !! (w-1)

card :: Int -> Int -> [String] -> [Int]
card n m xs
    | n == 0    = [1..m]
    | n >= 1     = shuffle (ab n xs) (card (n-1) m xs)

shuffle :: [Int] -> [Int] -> [Int]
shuffle cut cardlist =
    take b (drop (a-1) cardlist) ++ 
        take (a-1) cardlist ++ 
        drop (a+b-1) cardlist
    where
        a = cut !! 0
        b = cut !! 1

ab :: Int -> [String] -> [Int]
ab n xs = map read $ (map words xs) !! (n-1)
```
