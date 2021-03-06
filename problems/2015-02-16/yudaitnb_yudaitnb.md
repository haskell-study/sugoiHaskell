#### こたえ
捜査ブロックの数字に対して挿入ブロックの数字が  
・小さければ次の捜査ブロックを左へ  
・大きければ次の捜査ブロックを右へ  
・同じ数字でそれらが偶数ならば次の捜査ブロックを上へ  
・同じ数字でそれらが奇数ならば次の捜査ブロックを下へ  
そうして捜査ブロックが`EB`になった時、挿入ブロックをその場所に配置する。  
この操作を集合`b`内の全ての数に対して行う。  
  
(1)  
単純に同じ数字のみでbが構成されていれば、縦一列に`polyominoB`が生成される。  
```
b = [1,1,1,1]
b = [2,2,2,2]
```
などとすればよい。  
(2)  
`b`の各項を右または左から順番にbnとしたとき、bnが狭義単調性を持っていれば`polyominoB`は横一列に生成される。  
```
b = [1,2,3,4,5]
b = [9,8,7,6,5]
```
などとすればよい。  
(3)  
縦方向に延びるブロックの数字の偶奇が一致しており、それ以外の数字は全て一つずつ`b`に含まれるようにする。  
あとは適当な形になるように対称性を持つような数字で`b`を構成すればよい。  
```
b = [0,1,1,1,2,3,3,3,4]  
b = [4,3,3,3,2,1,1,1,0]  
b = [2,1,1,1,0,3,3,3,4]  
```
などとすればよい。
