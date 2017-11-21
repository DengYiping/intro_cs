bin :: Integer -> [Integer]
bin x = binHelper [] x
    where  binHelper x 0 = x
           binHelper x y = binHelper ([(mod y 2)] ++ x) (div y 2)
