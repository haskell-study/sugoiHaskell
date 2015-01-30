mの小文字と大文字が含まれているもののみをfilterし、そのリストの長さを出力すればよい。
```
mcount :: Num b => [Char] -> b
mcount xs = foldl (\x _ -> x + 1) 0 (filter (`elem` ['m','M']) xs)
```
````
ghci> mcount "ndxmkkeM"
2
````
