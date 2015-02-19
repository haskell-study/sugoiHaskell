(1)
```haskell
import Data.List
data Formula = Prop String | Formula `And` Formula | Formula `Or` Formula | Formula `Then` Formula | Not Formula
```
(2)
```haskell
isSat :: Formula -> [String] -> Bool
isSat (Prop p) trueList = if p `elem` trueList then True else False
isSat formula trueList = case formula of
	f1 `And` f2  -> (isSat f1 trueList) && (isSat f2 trueList)
	f1 `Or` f2   -> (isSat f1 trueList) || (isSat f2 trueList)
	f1 `Then` f2 -> (not (isSat f1 trueList)) || (isSat f2 trueList)
	Not f1       -> not (isSat f1 trueList)
```
命題P,Qが真のとき、「PならばQ」は真。
```
ghci > isSat (Prop "P" `Then` Prop "Q") ["P","Q"]
True
```
(3)
```haskell
isTauto :: Formula -> Bool
isTauto formula = all (isSat formula) $ subsequences $ nub $ prop' formula
    where
        prop' (Prop formula) = [formula]
        prop' (f1 `And` f2)  = prop' f1 ++ prop' f2
        prop' (f1 `Or` f2)   = prop' f1 ++ prop' f2
        prop' (f1 `Then` f2) = prop' f1 ++ prop' f2
        prop' (Not formula)  = prop' formula
```
以下与命題の真偽判定。
```
ghci > isTauto $ (Prop "P" `And` (Prop "P" `Then` Prop "Q")) `Then` Prop "Q"
True
ghci > isTauto $ (Prop "P" `Then` Prop "Q") `Then` ((Prop "Q" `Then` Prop "R") `Then` (Prop "P" `Then` Prop "R"))
True
ghci > isTauto $ (Prop "P" `Or` Prop "Q") `Then` (Prop "P" `And` Prop "Q")
False
ghci > isTauto $ Not (Prop "P" `And` Prop "Q") `Then` (Not (Prop "P") `Or` Not (Prop "Q"))
True
```

