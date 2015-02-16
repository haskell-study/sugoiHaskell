# 解答
```haskell
import Data.List

data Formula = Atom String | And Formula Formula | Or Formula Formula | Then Formula Formula | Not Formula

isSat :: Formula -> [String] -> Bool
isSat (Atom l) ts = l `elem` ts
isSat (a `And` b) ts = isSat a ts && isSat b ts
isSat (a `Or` b) ts = isSat a ts || isSat b ts
isSat (a `Then` b) ts = (not $ isSat a ts) || isSat b ts
isSat (Not a) ts = not $ isSat a ts

isTauto :: Formula -> Bool
isTauto f = all (isSat f) $ subsequences atoms
    where
        atoms :: [String]
        atoms = nub $ atoms' f
        atoms' (Atom l) = [l]
        atoms' (a `And` b) = atoms' a ++ atoms' b
        atoms' (a `Or` b) = atoms' a ++ atoms' b
        atoms' (a `Then` b) = atoms' a ++ atoms' b
        atoms' (Not a) = atoms' a
```

(3)の結果は以下の通り。
```
ghci> isTauto $ (Atom "P" `And` (Atom "P" `Then` Atom "Q")) `Then` Atom "Q"
True
ghci> isTauto $ (Atom "P" `Then` Atom "Q") `Then` ((Atom "Q" `Then` Atom "R") `Then` (Atom "P" `Then` Atom "R"))
True
ghci> isTauto $ (Atom "P" `Or` Atom "Q") `Then` (Atom "P" `And` Atom "Q")
False
ghci> isTauto $ Not (Atom "P" `And` Atom "Q") `Then` (Not (Atom "P") `Or` Not (Atom "Q"))
True
```