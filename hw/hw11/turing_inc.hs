import Prelude hiding (head)

-- give enough states to Turing machine
data State = S0 | S1 | S2 | S3 deriving (Show)

-- the tape is a string with index of current head
data Tape = Tape String Int deriving (Show)

-- Tape S
-- return the raw String under the Tape
tapes :: Tape -> String
tapes (Tape s _) = s
-- read from turing machine
head :: Tape -> Char -> Bool
head (Tape xs i) c = xs !! i == c

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
-- initial state S0, move to skipping state
-- directly move
accepts S0 
    | head tape '$' = accepts S1 (right tape)

-- skipping state, move to the least signficant digit
accepts S1 tape
    | head tape '$' = accepts S2 (left tape)
    | head tape '0' = accepts S1 (right tape)
    | head tape '1' = accepts S1 (right tape)

-- carried add state, write down 1 if 0 on tape
-- write down 0 if 1 on tape
-- carry of 1 on tape
-- moving to the left
accepts S2 tape
    | head tape '0' = accepts S3 (left (write tape '1'))
    | head tape '1' = accepts S2 (left (write tape '0'))

-- none carried state, simply do nothing, just move until the end
accepts S3 tape
    | head tape '0' = accepts S3 (left tape)
    | head tape '1' = accepts S3 (left tape)

-- if no instruction, halt
-- in this case, it will be S2 or S3 hit $ symbol, which is not defined
-- it will hit the halt and return the tape
accepts _ tape = tape

-- increment function
-- takes a string like $010102$ in binary
-- increase the binary int by 1
-- return $01010$ like binary string
increment :: String -> String
increment x = tapes $accepts S0 (Tape x 0)
