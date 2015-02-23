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
###(2)
c回シャッフルしたときの上からw番目にあるカードを求めたい。  
c回シャッフルしたときの上からw番目にあるカードが(c-n)回のシャッフル後に上から何番目にあるかを示す関数を`start w c n xs`とする。  
`modoru`はn回シャッフルした後上からw番目にあるカードがn-1回のシャッフル後に上から何番目にあるかを示す関数。
```haskell
main = do
    t <- readLn
    forM_ [1..t] $ \n -> do
        xs <- getLine
        let [m,c,w] = map read $ words xs
        ablist <- replicateM c getLine
        putStrLn $ "Case #"　++ show n ++ ": " ++ 
            show (start w c c ablist)

start :: Int -> Int -> Int -> [String] -> Int
start w c n xs
    | n == 0 = w
    | n >= 1 = modoru (ab (c-n+1) xs) (start w c (n-1) xs)

modoru :: [Int] -> Int -> Int
modoru ab x
    | x >= a+b           = x
    | (x < a+b)&&(x > b) = x - b
    | x <= b             = x + (a-1)
    where
        a = ab !! 0
        b = ab !! 1

ab :: Int -> [String] -> [Int]
ab n xs = map read $ (map words xs) !! (n-1)
```
結果
```
Small の入力
5 ポイント	
A-small を解く
最終応募作品の採点結果: 正解です。
```
```
Large の入力
13 ポイント	
A-large を解く
最終応募作品の採点結果: 正解です。
```
やったぜ。
