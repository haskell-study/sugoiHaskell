maryoku _ 0 = 1
maryoku i j = if (i==j) then 1 else maryoku (i-1) (j-1) + maryoku (i-1) (j)

maryokusum ia ja ib jb ic jc = maryoku ia ja + maryoku ib jb + maryoku ic jc

--mcount 2 = 0
--mcount m = mcount (m-1) + now
--    where now = sum [ 1 | j1 <- [1 .. (m-1)], j2 <- [(j1+1) .. (m-1)], i3 <- [(m-j1) .. (m-1)], i4 <- [j2 .. (m-1)], i5 <- [(i3-(m-j1)) .. (i3-1)], i6 <- [(m-j2) .. (i4-1)],i5 == i6,i3-(m-j1) < i6-(m-j2), maryokusum m j1 i4 j2 i5 (i3 - (m-j1)) == maryokusum m j2 i3 (i3 - (m - j1)) i6 (i6-(m-j2))]



listA = [[1,2,3,4],[5,6,7],[7,8,9]]

sanbai = map (map (*3))

nijugoika xs = [filter (<=25) ls | ls <- [x | x <- xs]]

kirisute xs = [takeWhile (\y -> if (mod y 3) == 0 then True else False) ls | ls <- [x | x <- xs]]
