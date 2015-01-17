## 解答
[問題ページ](../problems/2015-01-15_yudaitnb.md)

### 1-1
(1) エラーとなる。`div 4 div`が計算されようとしてしまうため。`div 4 (div 6 2) -1` とすればよい。

(2) エラーとなる。``-4 `div` 2``は整数型であるが、`succ 1.0`は浮動小数点型であり、型の違う値同士はそのままでは足し算することはできない。例えば、``-4 `div` 2 + succ 1``とするか、``fromIntegral (-4 `div` 2) + succ 1.0``とすればよい。ただし、前者は整数型であるが、後者は浮動小数点型となる。

### 1-2
`div`,`mod` と `quot`,`rem` は、引数がどちらも非負の値の場合には同じ結果を返す。
```
Prelude> divMod 7 3
(2,1)
Prelude> quotRem 7 3
(2,1)
```
しかし、どちらか片方だけが負であった場合には違う結果を返す。
```
Prelude> divMod (-7) 3
(-3,2)
Prelude> quotRem (-7) 3
(-2,-1)
Prelude> divMod 7 (-3)
(-3,-2)
Prelude> quotRem 7 (-3)
(-2,1)
```
`quot`は割って0に近くなるように切り捨て、`rem`はその`quot`と整合するようになっている。これは、Cなどの`/`,`%`の動作と同じである。一方、`mod`は除数と剰余の符号が等しくなるように定義されており、`div`はその`mod`と整合するようになっている。(ただし、除数が負の場合に`div`,`mod`を考えることはあまりないであろうが……) このような仕様の違いのため、上述の違った結果が生まれる。
ちなみに、この仕様に従うと、引数が両方とも負である場合は結果が同じになる。
```
Prelude> divMod (-7) (-3)
(2,-1)
Prelude> quotRem (-7) (-3)
(2,-1)
```

### 1-3
(1) `10`
(2) `5`
(3) `False`
(4) `True`

### 1-4
```
Prelude> let tris = [(a,b,c) | c<-[1..50],b<-[1..c],a<-[1..b],c^2==a^2+b^2]
Prelude> length tris
20
Prelude> tris
[(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20),(15,20,25),(7,24,25),(10,24,26),(20,21,29),(18,24,30),(16,30,34),(21,28,35),(12,35,37),(15,36,39),(24,32,40),(9,40,41),(27,36,45),(30,40,50),(14,48,50)]
```

### 2-1
(1) `(>) :: (Ord a) => a -> a -> Bool`
(2) `compare :: (Ord a) => a -> Ordering`
(3) `(/=) :: (Eq a) => a -> a -> Bool`
(4) `(show True) :: String`

### 2-2
(1) 型推論に必要な情報が不足しているため。型注釈を行えばよい。`read "1" ::  Int`などとする。
(2) 第一項は整数型なのに対し、第二項は浮動小数点型であるため。`fromIntegral (length [1,2,3]) + 3.2`とすればよい。

### 2-3
* Eq : 等値性が定義される型のクラス。
* Ord : 順序が定義される型のクラス。
* Show : Stringに変換できる型のクラス。
* Read : Stringから変換できる型のクラス。
* Enum : 列挙が可能な型のクラス。レンジで使用できる型のクラスとも言える。
* Bounded : 有界な型のクラス。上限と下限が定義される。
* Num : 数全体の型のクラス。
* Floating : 浮動小数点型全体のクラス。
* Integral : 整数型全体のクラス。

### 3-1
(1)
```haskell
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' n
    | n == 0 || n == 1 = 1
    | otherwise = fib' (n-1) + fib' (n-2)

fib'' n = case n of 0 -> 1
                    1 -> 1
                    _ -> fib'' (n-1) + fib'' (n-2)
```
(2)
```haskell
fibo = 1 : 1 : zipWith (+) fibo (drop 1 fibo)
```

### 3-2
コードだけ載せておきます。結果の確認は各自で……

```haskell
farey 1 = [(0,1),(1,1)]
farey n = add $ farey (n-1)
    where add (it@((a,b)):tl@((c,d):_))
              | b+d == n = it : (a+c,b+d) : add tl
              | otherwise = it : (add tl)
          add last = last

farey2 0 = [(0,1),(1,1)]
farey2 n = add $ farey2 (n-1)
    where add (it@((a,b)):tl@((c,d):_)) = it : (a+c,b+d) : add tl
          add last = last
stern n = [fst x | x <- farey2 n]
stern' m = (stern 100) !! m

set1 n = [(stern' a, stern' (2*a))  | a <- [1..n] ]
set2 n = [(stern' (2*a+1), stern' a + stern' (a+1)) | a <- [1..n]]
```
