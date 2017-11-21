factorial :: Integer -> Integer
factorial x
	| x == 0 = 1
	| otherwise = x * factorial (x - 1)

factorial_guarded :: Integer -> Integer
factorial_guarded x
	| x < 0 = error "invalid input, the factorial of negative number is undefined"
	| otherwise = factorial x
