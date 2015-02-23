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
            show ((card c m ablist) !! (w-1))

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
結果
```
$ runhaskell gcj2011.hs < A-small-practice.in
Case #1: 6
Case #2: 2
Case #3: 2
Case #4: 24
Case #5: 12
Case #6: 100
Case #7: 25
Case #8: 10
Case #9: 1
Case #10: 10
Case #11: 4
Case #12: 98
Case #13: 12
Case #14: 18
Case #15: 12
Case #16: 34
Case #17: 8
Case #18: 16
Case #19: 2
Case #20: 5
Case #21: 23
Case #22: 2
Case #23: 29
Case #24: 16
Case #25: 1
Case #26: 13
Case #27: 14
Case #28: 9
Case #29: 23
Case #30: 8
Case #31: 19
Case #32: 15
Case #33: 31
Case #34: 2
Case #35: 29
Case #36: 6
Case #37: 11
Case #38: 12
Case #39: 1
Case #40: 3
Case #41: 11
Case #42: 15
Case #43: 1
Case #44: 11
Case #45: 99
Case #46: 94
Case #47: 2
Case #48: 19
Case #49: 14
Case #50: 6
Case #51: 17
Case #52: 13
Case #53: 29
Case #54: 7
Case #55: 16
Case #56: 9
Case #57: 11
Case #58: 20
Case #59: 26
Case #60: 22
Case #61: 41
Case #62: 1
Case #63: 13
Case #64: 12
Case #65: 13
Case #66: 50
Case #67: 2
Case #68: 40
Case #69: 17
Case #70: 4
Case #71: 15
Case #72: 6
Case #73: 22
Case #74: 14
Case #75: 26
Case #76: 8
Case #77: 34
Case #78: 4
Case #79: 18
Case #80: 33
Case #81: 14
Case #82: 21
Case #83: 68
Case #84: 16
Case #85: 38
Case #86: 54
Case #87: 18
Case #88: 3
Case #89: 21
Case #90: 30
Case #91: 24
Case #92: 4
Case #93: 10
Case #94: 6
Case #95: 11
Case #96: 23
Case #97: 3
Case #98: 20
Case #99: 61
Case #100: 20
Case #101: 23
Case #102: 3
Case #103: 5
Case #104: 7
Case #105: 5
Case #106: 89
Case #107: 7
Case #108: 15
Case #109: 9
Case #110: 18
Case #111: 24
Case #112: 5
Case #113: 1
Case #114: 5
Case #115: 17
Case #116: 18
Case #117: 91
Case #118: 14
Case #119: 9
Case #120: 7
Case #121: 41
Case #122: 2
Case #123: 8
Case #124: 21
Case #125: 1
Case #126: 68
Case #127: 10
Case #128: 10
Case #129: 19
Case #130: 24
Case #131: 19
Case #132: 22
Case #133: 23
Case #134: 19
Case #135: 4
Case #136: 16
Case #137: 18
Case #138: 20
Case #139: 70
Case #140: 9
Case #141: 21
Case #142: 17
Case #143: 20
Case #144: 10
Case #145: 1
Case #146: 1
Case #147: 22

```
