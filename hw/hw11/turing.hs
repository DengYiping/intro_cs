import Prelude hiding (head)

-- give enough states to Turing machine
data State = S0 | S1 | S2 | S3 | S4 | S5 | S6 |
             S7 | S8 | S9 | S10 deriving (Show)

-- the tape is a string with index of current head
data Tape = Tape String Int deriving (Show)

-- read from turing machine
head :: Tape -> Char
head (Tape xs i) = xs !! i

-- move the tape left
left :: Tape -> Tape
left (Tape xs i)
    | i == 0 = Tape ("_" ++ xs) 0
    | otherwise = Tape xs (i - 1)

-- move the tape right
right :: Tape -> Tape
right (Tape xs i)
    | i + 1 >= length xs = Tape (xs ++ "_") (i + 1)
    | otherwise = Tape xs (i + 1)

-- write to the tape
write :: Tape -> Char -> Tape
write (Tape xs i) c = Tape (replaceAt i c xs) i
    where replaceAt 0 nc (y:ys) = nc:ys
          replaceAt n nc (y:ys) = y:replaceAt (n - 1) nc ys

accepts :: State -> Tape -> Tape

