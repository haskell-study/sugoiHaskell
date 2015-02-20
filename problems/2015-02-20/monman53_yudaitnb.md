```haskell
pSharp t = do 
	forM_ [1..t] $ \n -> do
		putStr "#"
	putStrLn ""

pSharp' n
	| n == 1 = pSharp 1
	| n >= 2 = do
		pSharp' (n-1)
		pSharp n
		pSharp' (n-1)

main = do
	t <- readLn
	pSharp' t
```
コンパイルして実行すると
```
5
#
##
#
###
#
##
#
####
#
##
#
###
#
##
#
#####
#
##
#
###
#
##
#
####
#
##
#
###
#
##
#
```
