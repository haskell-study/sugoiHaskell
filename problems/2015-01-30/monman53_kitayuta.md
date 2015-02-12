```haskell
mcount :: String -> Integer
mcount = foldr (\x ac -> if x =='m' then ac + 1 else ac) 0
```
