### 4-1  
・`elem'` 存在する  
`| a == x = True`  
が基底部の処理をしている。  
・`maximum'` 存在する  
maximum' [x] = xが基底部の処理をしている。  
・repeat' 存在しない！！！！  
無限数列を構成するだけなので基底部は存在しない。  
・replicate' 存在する  
| n <= 0 = []が基底部の処理をしている。  
・reverse' 存在する  
reverse' [] = []が基底部の処理をしている。  
・take' 存在する  
| n<= 0 = []が基底部の処理をしている。  
・zip' 存在する  
zip' _ [] = []
zip' [] _ = []  
が基底部の処理をしている。  
  
### 4-2  
(1)  
````
mcount :: Num a => [Char] -> a
mcount st = case st of
	[] -> 0
	'm':xs -> 1 + mcount xs
	x:xs -> 0 + mcount xs
````
(2)  
````
memph :: [Char] -> [Char]
memph st = case st of
	[] -> []
	'm':xs -> "**M**" ++ memph xs
	'M':xs -> "**M**" ++ memph xs
	x:xs -> x:memph xs
````
### 5-1  
(1)  
````
rules :: Char -> [Char]
rules x = case x of
	'A' -> "AB"
	'B' -> "A"
	otherwise -> "x"

start :: [Char]
start = "A"

lsystem :: (Num a, Eq a) => (t -> [t]) -> [t] -> a -> [t]
lsystem rules start n
	| n == 0 = start
	| otherwise = replace rules (lsystem rules start (n-1))
	where
		replace _ [] = []
		replace rule (x:xs) = (rule x) ++ replace rule xs
````
こっちの方が自然だと思う。
````
ls 0 = "A"
ls n = rule (ls (n-1))
	where
		rule st = case st of
			[] -> []
			'A':xs -> "AB" ++ rule xs
			'B':xs -> "A" ++ rule xs  
````
(2)
````
rules' :: Char -> [Char]
rules' x = case x of
	'M' -> "O++{.P.----N.[-O.----M.}]++"
	'N' -> "+{.O.--P.[---M.--N.}]+"
	'O' -> "-{.M.++N.[+++O.++P.}]-"
	'P' -> "--{.O.++++M.[+P.++++N.}]--N"
	otherwise -> "x"

start' :: [Char]
start' = "[N]++[N]++[N]++[N]++[N]"

lsystem' :: (Num a, Eq a) => (t -> [t]) -> [t] -> a -> [t]
lsystem' rules' start' n
	| n == 0 = start'
	| otherwise = replace' rules' (lsystem' rules' start' (n-1))
	where
		replace' _ [] = []
		replace' rule' (x:xs) = (rule' x) ++ replace' rule' xs  
````
````
ghci > lsystem' rules' start' 3
"xxxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--Nxxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxxxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--NxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxxxxxxxxxxxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--Nxxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxxxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--NxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxxxxxxxxxxxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--Nxxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxxxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--NxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxxxxxxxxxxxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--Nxxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxxxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--NxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxxxxxxxxxxxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--Nxxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxxxx+{.O.--P.[---M.--N.}]+xxxxx-{.M.++N.[+++O.++P.}]-xxxx--{.O.++++M.[+P.++++N.}]--Nxxxxx+{.O.--P.[---M.--N.}]+xxx-{.M.++N.[+++O.++P.}]-xxxxxO++{.P.----N.[-O.----M.}]++xxxxxxxxxxx-{.M.++N.[+++O.++P.}]-xxx--{.O.++++M.[+P.++++N.}]--NxxxxxO++{.P.----N.[-O.----M.}]++xxx+{.O.--P.[---M.--N.}]+xxxxxxxxx"
````
