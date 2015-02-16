```haskell
import Data.List

data Formula = Prop String | Formula `And` Formula | Formula `Or` Formula  | Formula `Naraba` Formula | Not Formula

isSat :: [String] -> Formula -> Bool
isSat s (Prop p) = if elem p s then True else False
isSat s formula = case formula of   (f1 `And` f2)     -> isSat s f1 && isSat s f2
                                    (f1 `Or`  f2)     -> isSat s f1 || isSat s f2
                                    (f1 `Naraba` f2)  -> not (isSat s f1) || isSat s f2
                                    (Not f1)          -> not (isSat s f1)

isTauto :: Formula -> Bool
isTauto formula = foldl (\acc x -> acc && isSat x formula) True (subsequences ["P","Q","R"])
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
