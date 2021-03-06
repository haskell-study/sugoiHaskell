**"(PC)"とあるものについてはPCを利用して構いません。それ以外はなるべく頭のなかで。**  
**"(自由課題)"とあるものについては、時間が余ったら解く程度で構いません。**

# 4章
## 4-1
教科書で再帰を用いて実装した次の関数のうち,基底部といえるものが**存在しない**関数を選べ.(複数回答可)

* elem'
* maximum'
* repeat'
* replicate'
* reverse'
* take'
* zip'

## 4-2 (PC)
### (1)
与えられた文字列(`[Char]`)中に文字`'m'`が何文字含まれるか(整数)を返す関数`mcount`を再帰を用いてつくれ.
### (2)
与えられた文字列(`[Char]`)中に文字`'m'`または文字`'M'`があれば,その部分を`"**M**"`に置き換える関数`memph :: [Char] -> [Char]`を再帰を用いてつくれ.

## 4-3 (PC) (自由課題)
正の整数を1から順につなげてできる下のような無理数を考える.
```
0.12345678910111213141516...
```
### (1)
この数の少数点より右側(`12345678910111213141516...`)を文字列とみなし,その無限文字列`[Char]`を出力する関数をつくれ.
### (2)
(1)でつくった関数を用いると、僕が長年解けずに放置している[ProjectEuler40](https://projecteuler.net/problem=40)を解くことができる.この問題を解け.(答えは知らない)

## 4-4 (PC) (自由課題)
マージソートを関数`msort :: (Ord a) => [a] -> [a]`として実装せよ.

# 5章
## 5-1 (PC)
僕の好きな[L-system](http://ja.wikipedia.org/wiki/L-system)にまつわる問題.  
置換規則`rules`に基づいて文字列`S`が,そのすべての文字がある文字列に置換され新たな文字列`S'`になることを「世代が1増える」とする.初期状態として文字列`start`が与えられた時を世代0として,世代nの文字列を求めたい.  
例(Wikipediaの[藻類](http://ja.wikipedia.org/wiki/L-system)):  
`rules`: 'A' -> "AB", 'B' -> "A"  
`start`: "A"  
の時,

* "A" = start (世代0)
* "AB" (世代1)
* "ABA" (世代2)
* "ABAAB" (世代3)
* "ABAABABA" (世代4)
* ...

である. 
### (1)
関数`rules :: Char -> [Char]`に置換規則(先の藻類の場合でよい)を定義し,`rules`と`start`と`n`をこの順で引数にとり、世代`n`の文字列を返す関数
```haskell
lsystem :: (Char -> [Char]) -> [Char] -> Int -> [Char]
```
をつくれ.なおnが負の場合の扱いは自由.nが0以上と保証されているとして作っても良い.また,この二つの関数の型が正しければ,別に関数を用意して`lsystem`内で利用しても良い.
### (2)
(1)でつくった関数を用いて(`rules`は定義し直す),[Penroseovo dláždění](http://cs.wikipedia.org/wiki/L-syst%C3%A9m)の世代3の文字列を出力せよ.  
試しに(1)でつくった関数を用いて(`rules`は定義し直す),[Wikipedia](http://cs.wikipedia.org/wiki/L-syst%C3%A9m)に挙げられている例"Penroseovo dláždění"について,世代3の文字列を出力せよ.

```haskell

