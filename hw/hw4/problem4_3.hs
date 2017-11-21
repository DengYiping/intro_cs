import Data.List
checkAnagram :: [Char] -> [Char] -> Bool
-- First sort the two char list, then compare the two to see if it is the same
checkAnagram x y = s_x == s_y
    where s_x = sort x
          s_y = sort y
-- I write this function because it is in the suggestion, but implementing groupByKey in Haskell
-- is more efficient way. So just ignore this function. I wrote it for safety reason.

getKey :: String -> String
getKey x = sort x
-- Function that return the key of a String, which is a sorted char sequence
-- using this function, we can form a imaginary key-value pair, the key is the sorted String
-- In theory, I could do memoization on top of getKey function to speed up the algorithm, but this version
-- is fast enough. Doing memoization is kinda hard since everything is immutable.


groupByKeyFunc f = groupBy (\x y -> (f x) == (f y)) . sortBy (\x y -> compare (f x) (f y))
-- Group up the result by the key function result.
-- It is generic, and I use lambda expression to simplify the code
-- the genKey should return a value that is comparable
-- Details:
-- First sort the result
-- Then group the result
-- Inspired by groupBy function in Scala

anagrams :: [String] -> [[String]]
anagrams x = groupByKeyFunc getKey x
-- Simply call groupByKey
