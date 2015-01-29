###4. kitayutaくんは魔法使い  
ある日魔法使いのkitayutaくんが目を覚ますと、見知らぬ暗い場所であった。  
辺りを調べてみると、そこは沢山の道で出来ている大きな迷路のようで、以下のことが調査により判明した。   ・迷路には、目覚めた場所を含め正三角形格子状に小部屋がある  
・各小部屋から最短距離の小部屋まで道が通じており、全体はkitayutaくんが目覚めた場所を頂点とする全体が無限の大きさの正三角形状  
・各小部屋には魔力があり、目覚めた場所から各小部屋に至るまでの最短経路の数と同じ値  
であることがわかった。  

  
kitayutaくんはこの洞窟から脱出するために大きな魔法陣を書くことにした。魔方陣にはいくつかの条件がある。  
・魔法陣は凸六角形で、各頂点と辺はこの迷路の小部屋、道と一致し、各内頂角は2pi/3でなければならない。  
・この魔方陣の各頂点にある魔力について、一つ飛ばしの3頂点ずつの魔力の和と、残りの3頂点の魔力の和が同じでなければ魔方陣として成立しない。  
  
さて、単位格子の辺の長さは1であるとしよう。  
kitayutaくんは運動不足なので、初めの位置(正三角形格子全体の頂点)から距離mのところまでしか移動することが出来ない。  
kitayutaくんは一体m*mの正三角格子に最大何個の魔方陣を書くことが出来るだろうか？  

### 問題
1 <= m <= 30とする。  
入力としてmが与えられたときに、kitayutaくんが書ける魔方陣の個数を出力せよ。
  
### 例  
ここで条件を満たす6点を集めた集合の集合をhexaとしてます。  
```
length (hexa 1) = 0  
length (hexa 2) = 0
length (hexa 3) = 1
length (hexa 4) = 5
length (hexa 5) = 15
```