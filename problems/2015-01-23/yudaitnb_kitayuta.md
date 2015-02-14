```haskell
hexa m = length $ filter (\(a,b,c,d,e,f) -> a*c*f == b*d*e) cand
    where
        cand = [(comb p i, comb p j, comb q k, comb q l, comb (q-(k-i)) i, comb (p+(l-j)) l) |
            p<-[1..m-1], q<-[p+2..m], i<-[0..p-1], j<-[i+1..p], k<-[i+1..i+(q-p)-1], l<-[max (k+1) (j+1) .. j+(q-p)-1]]
        npas = pascal m
        comb n k = (npas !! n) !! k

pascal m = reverse $ pascal' m
    where
        pascal' 0 = [[1]]
        pascal' n = let res = pascal' (n-1)
                        bef = head $ res
                    in zipWith (+) (0:bef) (bef++[0]) : res
```

参考までに、たとえば m=30 のとき、`length cand` は 1514520 となり、かなり探索範囲が絞られていることが分かる。