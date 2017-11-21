-- Lazy Evaluation
-- expressions are evaluated only at their use
-- it is a trade-off, allowing the modularity
-- Call-by-value v. call-by-name v. call-by-need
-- Haskell can be force to do call by value
-- Side Effect:
-- a side effect allows the behavior of a function to change the global state of a system
-- if a function's output depends entirely on the input we explicitly provide, we say that the function is pure
-- in Haskell, we can only look at a type signature of a function and see if it is pure or impure.
-- Question: Should you choose to write code in a pure language or an impure one?

data Color = Red | Green | Blue
-- this is what we do not what to implement
colorEq :: Color -> Color -> Bool
colorEq Red   Red   = True
colorEq Green Green = True
colorEq Blue  Blue  = True
colorEq _     _     = False

-- Custom defined typeclass
-- typeclass is just a set of functions, nothing more
class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Color where
    isEqual Red Red = True
    isEqual Green Green = True
    isEqual Blue Blue = True
    isEqual _ _ = False

-- instantiate the build-in type class Eq
-- class Eq a where
--     (==) :: a -> a -> Bool
--     (/=) :: a -> a -> Bool
--     x == y = not (x /= y)
--     x /= y = not (x == y)
-- Clearly, we only need to define either (==) or (/=)
-- We instanitate one of them
instance Eq Color where
    Red == Red = True
    Green == Green = True
    Blue == Blue = True
    _ == _ = False

-- Another example
instance Show Color where
    show Red = "Red light"
    show Green = "Green beam"
    show Blue = "Blue ray"

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id
    -- id function

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

instance YesNo Color where
    yesno Red = False
    yesno _ = True

-- Functor
-- class Functor f where
--     fmap :: (a -> b) -> f a -> f b
--
-- This is the definition of Functor class, with a fmap function
-- It takes a function that
-- It has the following property:
-- fmap id = id
