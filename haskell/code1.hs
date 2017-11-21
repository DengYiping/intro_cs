whoAmI :: Int -> String

whoAmI 1 = "One"
whoAmI 2 = "Two"
whoAmI x = "Random"

myFirst :: (a, b, c) -> a
myFirst (x, _, _) = x
mySecond(_, x, _) = x
myThird(_, _ , x) = x

whereAmI :: Int -> String
whereAmI age
	| age <= 4 = "You are at home"
	| age <= 15 = "You are at middle school"
	| otherwise = "HHHHHH"

addFourNumbers :: Int -> Int -> Int -> Int -> Int

addFourNumbers x y z k = a + b
	where a = x + y
	      b = z + k

tail' :: [a] -> [a]
tail' xs = case xs of [] -> error "No tail"
	(x:xs) -> xs

let add1 = \x -> x + 1
