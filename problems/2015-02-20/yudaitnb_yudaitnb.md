# 8 解答
## 8-1
### (1)
`getLine`は`String`型では無く、`IO String`型なので`++`演算子の引数として取ることが出来ない。  
一度適当な`xs`に束縛してやればよい。
```haskell
main = do
    putStrLn "What's your name?"
    xs <- getLine
    name = "I'm " ++ xs
    putStrLn name
```
### (2)
`do`ブロック内での通常の型の値の束縛は`let`構文内で行う必要がある。
```haskell
main = do
     let a = "my favorite number "
         b = "is "
     fNumber <- getLine
     putStrLn $ a ++ b ++ fNumber
```
### (3)
正常にコンパイル可。
```haskell
import Data.Char

main = do
    line <- getLine
    if null line
        then return ()
        else putStrLn $ toBigWords line

toBigWords :: String -> String
toBigWords xs = map toUpper xs
```
## 8-2
```haskell
main = do
    lastName <- getLine
    firstName <- getLine
    putStrLn $ head firstName : '.' : head lastName "."
```
を`initials.hs`とする。コンパイルして実行すると
```
$ ./initials
Tanabe
Yudai
Y.T.
```
となる。
## 8-3
```haskell
putStr :: String -> IO ()
putChar :: Char -> IO ()
print :: (Show a) => a -> IO ()
```
`putStr`は、文字列を受け取って出力する。`putStrLn`と違って出力後に改行はしない。  
`putChar`は、文字を一つ受け取って出力する。改行はしない。  
`print`は、`Show`のインスタンスの値を受け取り`show`関数を適用した文字列を出力した後、改行する。
## 8-4
```
ghci> sequence $ map print [1,2,3]
1
2
3
[(),(),()]
```
`sequence`の返り値は`IO`に包まれた`[(),(),()]`であり、これが出力されている。
```
ghci> mapM print [1,2,3]
```
としても全く同じことである。以下の何方かを持ちいれば題意を満たす。
```
ghci> sequence_ print [1,2,3]
```
```
ghci> mapM_ print [1,2,3]
```
## 8-5
### (1)(復習)
```haskell
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a -> Tree a
singleton n = Node n EmptyTree EmptyTree 

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node n left right)
    | x == n = Node x left right
    | x < n  = Node n (treeInsert x left) right
    | x > n  = Node n left (treeInsert x right)

numTree :: (Ord a) => [a] -> Tree a
numTree = foldr treeInsert EmptyTree
```
### (2)

```haskell
heightTree :: Tree a -> Int
heightTree EmptyTree = 0
heightTree (Node _ x y) = 1 + max (heightTree x) (heightTree y)
```
を(1)に追加し、`height.hs`としてコンパイルする。  
入力`list.txt`が
```
[1,2,3]
```
であれば
```
$ ./height < list.txt
3
```
となる。
## 8-6
以下を`siritori.hs`として保存。
```haskell
import Data.List
import Data.Char
import Control.Monad

main = do
    m <- readLn
    siritori <- replicateM m getLine
    putStrLn $ if judge m siritori 1
        then "A WIN"
        else "A LOSE"

judge :: Int -> [String] -> Int -> Bool
judge m xs n -- n回目の発言をジャッジする。
    | not(siri n xs) && odd n  = False -- しり取りになってない。最後の発言者の負け。
    | not(siri n xs) && even n = True  -- 同上。
    | n == m && odd m          = True  -- 問題なく終わる。最後の発言者の勝ち。m=1も。
    | n == m && even  m        = False -- 同上。
    | otherwise                = judge m xs (n+1) -- 問題無ければn+1回目の発言をジャッジする。

siri :: Int -> [String] -> Bool
siri n xs -- n-1,n回目のしりとりが成立しているかを調べる。
    | n == 1                               = True
    | head(word n xs)==last(word (n-1) xs) = True
    | otherwise                            = False
    where
        word n xs = xs !! (n-1)
```
```
$ runhaskell siritori.hs < testcase.txt
A LOSE
```
testcase
```
100
abcsde
ebsnjkd
dmirnfck
ksndje
encf
fmroc
cfnmrm
mxiencini
iddcn
nduedkmdeo
odbuendkwla
anicnrled
dnrifcklmdcvf
fanserhfvbjsk
kncffnvfj
jfbgrhfbualp
prjnednxmz
zcnurnwksmx
xncirenakoa
abcstde
ebstnjkd
dmirtnfck
ksndtje
entcf
fmtroc
cfntmrm
mxietncini
iddctn
nduetdkmdeo
odbuetndkwla
anicntrled
dnriftcklmdcvf
fanserthfvbjsk
kncffntvfj
jfbgrthfbualp
prjnedtnxmz
zcnurtnwksmx
xnciretnakou
ucvjrbtdskamza
abcgstde
ebsgtnjkd
dmigrtnfck
ksngdtje
entcgf
fmtrogc
cfntmgrm
mxietngcini
iddctgn
nduetdgkmdeo
odbuetngdkwla
anicntrlged
dnriftckglmdcvf
fanserthfgvbjsk
kncffntvfgj
jfbgrthfgbualp
prjnedtnxgmz
zcnurtnwgksmx
xnciretnakogu
ucvjrbtdskamzga
abcygstde
ebsygtnjkd
dmigrtynfck
ksngdytje
entcygf
fmtyrogc
cyfntmgrm
myxietngcini
iddcytgn
ndyuetdgkmdeo
odbyuetngdkwla
anicnytrlged
dnriftcykglmdcvf
fansertyhfgvbjsk
kncffntyvfgj
jfbgrtyhfgbualp
prjnedytnxgmz
zcnurtynwgksmx
xncireytnakogu
ucvjrbytdskamzga
abrcygstde
ebrsygtnjkd
dmirgrtynfck
ksngrdytje
entcyrgf
fmtyrorgc
cyfntmgrrm
myxietngrcini
iddcytgrn
ndyuetdrgkmdeo
odbyuetnrgdkwla
anicnytrlrged
dnriftcykgrlmdcvf
fansertyhfgrvbjsk
kncffntyvfgrj
jfbgrtyhfgburalp
prjnedytnxgmrz
zcnurtynwgksmrx
xncireytnakogru
ucvjrbytdskamzrga
abcdefghijk
```
# 9-N
欠番
# 10-N
p.216からp.226までの記述を読んでおいて下さい。(最短経路関数)
