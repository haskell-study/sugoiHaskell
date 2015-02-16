```haskell
import Data.List

data Formula = Prop String | Formula `And` Formula | Formula `Or` Formula  | Formula `Naraba` Formula | Not Formula
sSat :: Formula -> [String] -> Bool
isSat (Prop p) s    = if elem p s then True else False
isSat formula s     = case formula of   (f1 `And` f2)     -> isSat f1 s && isSat f2 s
                                        (f1 `Or`  f2)     -> isSat f1 s || isSat f2 s
                                        (f1 `Naraba` f2)  -> not (isSat f1 s) || isSat f2 s
                                        (Not f1)          -> not (isSat f1 s)


isTauto :: Formula -> Bool
isTauto formula = not ( elem False ( map (isSat formula) props ) )
    where   props = subsequences (nub (findProps formula []))
            findProps :: Formula -> [String] -> [String]
            findProps (Prop p) ls = p : ls
            findProps form ls     = case form of    (f1 `And` f2)       -> findProps f1 [] ++ ls ++ findProps f2 []
                                                    (f1 `Or`  f2)       -> findProps f1 [] ++ ls ++ findProps f2 [] 
                                                    (f1 `Naraba` f2)    -> findProps f1 [] ++ ls ++ findProps f2 []
                                                    (Not f1)            -> findProps f1 [] ++ ls
```
それぞれ確かめました
```sh
ghci> isTauto ((Prop "P" `And` (Prop "P" `Naraba` Prop "Q")) `Naraba` Prop "Q")
True
ghci> isTauto ((Prop "P" `Naraba` Prop "Q") `Naraba` ((Prop "Q" `Naraba` Prop "R") `Naraba` (Prop "P" `Naraba` Prop "R")))
True
ghci> isTauto ((Prop "P" `Or` Prop "Q") `Naraba` (Prop "P" `And` Prop "Q"))
False
ghci> isTauto (Not (Prop "P" `And` Prop "Q") `Naraba` (Not (Prop "P") `Or` Not (Prop "Q")))
True
```
