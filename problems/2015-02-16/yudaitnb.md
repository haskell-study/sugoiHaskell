複数の正方形を辺でつなげた多角形をpolyominoという。  
本問ではあるルールに基づいて様々なpolyominoを概念的に作ってみよう。  
```haskell
data Polyomino a = EB |  -- EBはEmptyBlockの略。
	Block a (Polyomino a) (Polyomino a) (Polyomino a) (Polyomino a) deriving (Eq,Show,Read,Ord)
```
```haskell
singleblock :: a -> Polyomino a
singleblock x = Block x EB EB EB EB
```
```haskell
blockInsert :: (Ord a) => a -> Polyomino a -> Polyomino a
blockInsert x EB = singleblock x
blockInsert x (Block a top left bottom right)
	| x < a                    = Block a top (blockInsert x left) bottom right
	| (x == a)&&(mod x 2 == 0) = Block a (blockInsert x top) left bottom right
	| (x == a)&&(mod x 2 == 1) = Block a top left (blockInsert x bottom) right
	| x > a                    = Block a top left bottom (blockInsert x right)
```
これらの関数に基づいて、ブロック(単位正方形のこと)をつなげていこう。  
```
polyominoB b = foldr blockInsert EB b
```
とし、この集合xによってpolyominoXが決定する。
ブロックは同一平面上に配置するものとし、上下左右は関数内の順番に従う。  
出来たブロック群のEBを無視すれば、出来た図形がpolyominoXである。  
(1)上下4マスの長さのpolyominoBを出力するBの例を一つ挙げよ。  
(2)左右5マスの長さのpolyominoBを出力するBの例を一つ挙げよ。  
(3)Hの形(大きさは何でもよい)のpolyominoBを出力するBの例を一つ挙げよ。  
