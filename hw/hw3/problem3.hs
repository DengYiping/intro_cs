-- Yiping Deng
-- Problem 3.3

isCoprime :: Integer -> Integer -> Bool

isCoprime x y  
    | valid == False = error "illegal input" -- Make sure the input is valid
    | com_factor == 1 = True
    | otherwise = False
    where valid = and (x >= 1, y >= 1) 
          com_factor = gcd x y
