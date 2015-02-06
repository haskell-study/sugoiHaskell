**(PC)とあるものについてはPCを利用してよい.それ以外はなるべくPCを使わずにとけるとよい.**
# 6章
## 6-1
### (1) (PC)
`Data.Map`モジュールの`size`関数以外を修飾付きインポートする(名前はMapとする)にはどのように記述すれば良いか,その記述を書け.
### (2) (PC)
`'阪'`がUnicodeテーブル上何番目に位置するか`Data.Char`モジュールの`ord`関数を用いて求めよ.
### (3)
`Prelude`モジュールの`foldl`関数と  
`Data.List`モジュールの`foldl'`関数のうち,アキュムレータの評価をすぐに行うのはどちらの関数か答えよ.
### (4) (PC)
`Prelude`モジュールの`mod`関数のソースコードをWEB上で閲覧せよ.  
URL等は本に記載されているので本をみてよい.
## 6-2 (PC)
### (1)
与えられた文字列中に`'M'`がいくつあるか返す関数`countM`を`Data.List`モジュールの`tails`関数を用いて実装せよ。
### (2)
教科書に載っている`Data.List`モジュールの`find`関数を`find'`を実装せよ.
## 6-3 (PC)
以下標準モジュールをインポートして用いても良い.
### (1)
与えられた文字列中に,与えられた文字列がいくつあらわれるかを返す関数`countString`をつくれ.  
たとえば`countString`は下のような動作をする
```sh
ghci> countWords "lecture" "Thank you for your mail and your lectures"
1
ghci> countWords " y" "Thank you for your mail and your lectures"
3
```
### (2)
与えられた文章(単語(連続した半角アルファベット)と空白からなる文字列)中に,与えられた複数の単語が、それぞれいくつあるかを返す関数`countWords`をつくれ.  
たとえば`countWords`は下のような動作をする
```sh
ghci> countWords ["your", "and", "lecture"] "Thank you for your mail and your lectures"
[("and", 1), ("your", 2)]
```
上の例では,含まれていない単語に関して何も返していないが,例えば
```sh
[("and", 1), ("lecture", 0), ("your", 2)]
```
を返してもよい.(僕がこの関数を作ることができなかった(時間がなかった(言い訳)))
## 6-4 (PC)
今回作成した関数をまとめたモジュールをつくれ.  
エクスポートする関数は自由.  
関数名も自由に変更してよい.
