## 解答
[問題ページ](../problems/2015-01-15_monman53.md)

二通りに書いてみましたが、どっちも特に簡潔にはなってなかった(完)

```haskell
mcount :: Num a => [Char] -> a
mcount s = fromIntegral $ length $ filter (=='m') s

mcount' :: Num a => [Char] -> a
mcount' s = sum $ [if c=='m' then 1 else 0 | c<-s]
```