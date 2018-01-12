import Prelude hiding (head)

-- give enough states to Turing machine
data State = S0 | S1 | S2 | S3 | S4 deriving (Show)

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
-- initial state S0, move to flip state
-- directly move
accepts S0 tape 
    | head tape '$' = accepts S1 (right tape)


-- flip state, move to the least signficant digit
-- flip 0 to 1, 1 to 0
accepts S1 tape
    | head tape '$' = accepts S2 (left tape)
    | head tape '0' = accepts S1 (right (write tape '1'))
    | head tape '1' = accepts S1 (right (write tape '0'))

-- carried add state, write down 1 if 0 on tape
-- write down 0 if 1 on tape
-- carry of 1 on tape
-- moving to the left
-- hit the end, move to flip state again
accepts S2 tape
    | head tape '0' = accepts S3 (left (write tape '1'))
    | head tape '1' = accepts S2 (left (write tape '0'))
    | head tape '$' = accepts S4 (right tape)

-- none carried state, simply do nothing, just move until the end
-- hit the end, then move to flip state
accepts S3 tape
    | head tape '0' = accepts S3 (left tape)
    | head tape '1' = accepts S3 (left tape)
    | head tape '$' = accepts S4 (right tape)

-- flip the state, 1 to 0 , 0 map to 1
accepts S4 tape
    | head tape '0' = accepts S4 (right (write tape '1'))
    | head tape '1' = accepts S4 (right (write tape '0'))

-- if no transition defined, halt
-- in this case, it will be S4  hit $ symbol, which is not defined
-- it will hit the halt and return the tape, which is decreased value
accepts _ tape = tape

-- decrement function
-- takes a string like $010102$ in binary
-- decrease the binary int by 1
-- return $01010$ like binary string
decrement :: String -> String
decrement x = tapes $accepts S0 (Tape x 0)
