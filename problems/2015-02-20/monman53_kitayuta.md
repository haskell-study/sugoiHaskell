```haskell
import Control.Monad

main = forever $ do
    n <- readLn
    putStr $ unlines $ genPat n

genPat :: Int -> [String]
genPat 0 = []
genPat n = let bPat = genPat (n-1)
           in bPat ++ replicate n '#' : bPat
```
