# 8
9章,10章は今回の問題に一部含めました。
## 8-1
以下のプログラムはコンパイルするとエラーとなるものがある。エラーとなるものはその理由を説明し、適切な形に直せ。
### (1)
```haskell
main = do
    putStrLn "What's your name?"
    name = "I'm " ++ getLine
    putStrLn name
```
### (2)
```haskell
main = do
     a = "my favorite number "
     b = "is "
     fNumber <- getLine
     putStrLn $ a ++ b ++ fNumber
```
### (3)
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
自分の`lastName`と`firstName`をこの順に入力すると、イニシャルを表示してくれるプログラム`initials`を書け。  
その際`Data.Char`モジュールをインポートすると良い。  
```
$ ./initials
Tanabe
Yudai
Y.T.
```
となる。
## 8-3
以下の3関数は似たような振る舞をする。相違点を説明せよ。(各関数の型シグネクチャは明記すること。)
```haskell
putStr
putChar
print
```
## 8-4
```
ghci> sequence $ map print [1,2,3]
```
の出力結果を書け。また、この結果には数字でないものが含まれるが、それは何故出力されるのだろうか。説明せよ。  
また、出力結果を数字\n数字\n数字...とするにはどうすればよいか？
## 8-5
### (1)(復習)
二分木を数のリスト`nums`から生成するプログラムを書け。ただし`Tree`型は
```haskell
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)
```
と定義し、補助関数
```haskell
singleton :: a -> Tree a -- 要素が一つしかない木を作る
treeInsert :: (Ord a) => a -> Tree a -> Tree a -- 数字を木に挿入する
```
を定義することで
```
ghci> let numTree = foldr treeInsert EmptyTree nums
```
を作る。入力として`nums = [7,5,3,1,6,2,4]`を与えると
```
Node 4 (Node 2 (Node 1 EmptyTree EmptyTree) (Node 3 EmptyTree EmptyTree)) (Node 6 (Node 5 EmptyTree EmptyTree) (Node 7 EmptyTree EmptyTree))
```
となる。　　
#### 以下の問題ではテキストファイルをプログラムに読み込ませる。方法はp.176に書いてあるので参照せよ。  
### (2)
(1)で用いた関数に加え新たな関数
```haskell
heightTree :: Tree a -> Int
```
を用いて、入力の集合で出来る各木の高さを出力するプログラム`height`を書け。  
例えば入力`list.txt`が
```
[1,2,3]
[3,2,1]
[3,1,2]
```
であれば
```
$ ./height < list.txt
3
3
2
```
となる。
## 8-6
AくんとBくんでしりとりをする。  
しりとりは(全アルファベット小文字の)英単語で行い、前の人が言った単語の最後のアルファベットを次の人は言わなければならない。  
一度使った単語を使う、又は前の単語の最後のアルファベットから始まる単語を初めに言わなかった人の負けである。
以下の形式で与えられた入力に対し、Aの勝ち負けを出力するプログラムを書け。
```
N
Word1
Word2
...
WordN
```
`N`は単語数。`WordN`は`N`が奇数のときAくんの、偶数の時Bくんの言葉。  
`N`は1以上100以下の整数で与えられ、各`Word`の長さは20文字以下である。  
### testcase 
```
4
ai
iu
ue
eo
```
Aの勝ち(何もなく終わった場合、最後の発言者が勝ち)
```
3
ai
ue
ok
```
Aの負け
```
4
aiu
uaa
aiu
ueo
```
Aの負け(Aが同じ単語を言っている)
```
4
aiu
ueo
oku
ueo
```
Aの勝ち(Bが同じ単語を言っている)
```
4
aiu
uaa
cba
abc
```
Aの負け(しりとりになってない)
```
4
aiu
uaa
abc
def
```
Bの負け(しりとりになってない)
# 9-N
欠番
# 10-N
p.216からp.226までの記述を読んでおいて下さい。(最短経路関数)
