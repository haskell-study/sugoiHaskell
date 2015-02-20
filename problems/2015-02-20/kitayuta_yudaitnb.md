### (1)
```haskell
import Control.Monad
import Data.Char

main = do
	t <- readLn
	forM_ [1..t] $ \n -> do
		xs <- getLine
		let [m,c,w] = map read $ words xs
		ab <- replicateM c getLine
		putStrLn $ "Case #"　++ show n ++ ": " ++ show (solve m (cs n ab) w)

solve :: Int -> [(Int,Int)] -> Int -> Int
solve _ _ _ = 114514

cs :: Read b => Int -> [String] -> [b]
cs n xs = map read $ (map words xs) !! (n-1)
```
ファイル名`0220`として
```
$ ./0220
2
1 1 1
1 1
2 3 1
2 1
2 1
2 1
Case #1: 114514
Case #2: 114514
```
