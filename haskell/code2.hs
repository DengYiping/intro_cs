data PersonInfo = Person Int Double String [String] deriving (Show)
-- PersonInfo is the type, and Person is the constructor function

type Age = Int
type Height = Double
type Name = String
type Children = [String]

data PersonInfo2 = Person2 Age Height Name Children deriving (Show)

-- Parameterized Type
data Maybe a = Just a | Nothing

-- Recursion
sumTo :: Int -> Int
sumTo 0 = 0
sumTo x = x + sumTo (x - 1)

-- Tail Recursion
sum2 :: Int -> Int
sum2 x = 
    tailSum x 0
    where tailSum 0 a = a
          tailSum n a = tailSum(n - 1)(a + n)

-- Note: A tailrec function should have the result at the last call





-- Mutual Recursion
--  Two or more functions that call each other
oddFunc :: Int -> Bool
oddFunc 0 = False
oddFunc n = evenFunc (n - 1)

evenFunc :: Int -> Bool
evenFunc 0 = True
evenFunc n = odd (n - 1)

