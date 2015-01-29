`mcount st = fromIntegral $ length [c | c <- st, c == 'm']`
とすれば
````
ghci > mcount "kitayutamonman53yudaitnb"
ghci > :t mcount
mcount :: Num b => [Char] -> b
````
