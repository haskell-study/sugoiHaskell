## 6-1
### (1) (PC)
```
import qualified Data.Map as Map hiding (size)
```
### (2) (PC)
```
ghci> :m + Data.Char
ghci> ord '阪'
38442
```
### (3)
`Prelude`モジュールの`foldl`関数はアキュムレータの評価は最後に行い、まず先延ばしにした計算のスタックを構築する。  
`Data.List`モジュールの`foldl'`関数は計算が遅延されず、直ちにアキュムレータの評価を行う。  
### (4) (PC)
http://hackage.haskell.org/package/base-4.7.0.2/docs/Prelude.html#v:mod
## 6-2 (PC)
### (1)
```
import Data.List
countM xs =  length (filter (=='M') (head (tails xs)))
```
```
ghci > countM "kitayuta is M"
1
```
### (2)
```
find' :: (Eq a) => (a -> Bool) -> [a] -> [a]
find' _ [] = []
find' law (x:xs)
    | law x = x : next
    | otherwise = next
    where next = find' law xs
```
## 6-3 (PC)
### (1)
```
import Data.List
countString xs ys = length (filter (isPrefixOf xs) (tails ys))
```
```
ghci> countString " w" "ww ww www"
2
```
### (2)
与えられた文章(単語(連続した半角アルファベット)と空白からなる文字列)中に,与えられた複数の単語が、それぞれいくつあるかを返す関数`countWords`をつくれ.  
たとえば`countWords`は下のような動作をする
```sh
ghci> countWords ["your", "and", "lecture"] "Thank you for your mail and your lectures"
[("and", 1), ("your", 2)]
```
上の例では,含まれていない単語に関して何も返していないが,例えば
```sh
[("and", 1), ("lecture", 0), ("your", 2)]
```
を返してもよい.(僕がこの関数を作ることができなかった(時間がなかった(言い訳)))
## 6-4 (PC)
今回作成した関数をまとめたモジュールをつくれ.  
エクスポートする関数は自由.  
関数名も自由に変更してよい.
