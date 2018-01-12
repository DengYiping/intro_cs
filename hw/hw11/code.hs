-- the states of FSM
data State = S | S0 | S1 | S2

-- executing the delta function
-- takes a State, retrives the top Char from String, execute
-- the finite state machine
-- until it ends
accepts :: State -> String -> Bool

-- initial state
accepts S ('a':xs) = accepts S1 xs
accepts S ('b':xs) = accepts S0 xs
-- move out of initial state to S0

-- S0 state movement
accepts S0 ('a':xs) = accepts S1 xs
accepts S0 ('b':xs) = accepts S0 xs
accepts S0 [] = True
-- this is a accepting state

-- S1 state movement
-- failing case
accepts S1 ('b':xs) = accepts S0 xs
accepts S2 ('a':xs) = accepts S2 xs

-- S2 and others
accepts _ _ = False
-- covering up all the failure case, including S2
-- this also covers non-accepting state case
-- also covers the case the string is not in 
-- the char set1

-- use this function to test
decide :: String -> Bool
decide = accepts S
