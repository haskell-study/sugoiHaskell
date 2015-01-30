## 魔法使い
結局解けなかったので、途中ですが載せるだけ載せておきます。  
実は`maryoku`関数も良くなくて、改良版があるのですが、この`tcount`で動かないので載せないでおきます。
```haskell
maryoku (-1) _  = 0
maryoku _ (-1)  = 0
maryoku 0 0   = 1
maryoku i j   = maryoku (i-1) (j-1) + maryoku (i-1) (j)

tcount m = sum [ 1 | i1 <- [0 .. m], j1 <- [0 .. i1], j2 <- [0 .. (j1-1)], i3 <- [(i1+1) .. m], i4 <- [(i3+1) .. m], j5 <- [(j2+i4-i3+1) .. (j1 + i4 - i1 -1)], (maryoku i1 j1) + (maryoku i3 j2) + (maryoku i4 j5) == (maryoku i1 j2) + (maryoku i4 (j2+i4-i3))+ (maryoku (i1 + j5 - j1) j5)]
```
