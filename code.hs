isPal :: String -> Bool
isPal [] = True
isPal [_] = True
isPal (x:xs) = (x == (last xs)) && (isPal (init xs))

rmv :: String -> Int -> String
rmv [] _ = []
rmv (x:xs) 0 = xs
rmv (x:xs) n = x:(rmv xs (n - 1))
