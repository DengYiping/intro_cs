-- Yiping Deng
-- Problem 3.4

fib :: Integer -> Integer
fib n = tailFib n 1 1
    where tailFib 1 a b = n
          tailFib 2 a b = a
          tailFib n a b = tailFib (n - 1) (a + b) a

-- a) the purpose of the first line is to provide a 
--    type signature for compiler.
--    the purpose of the second line is the function call to
--    our helper function tailFib.
--
-- b) the first argument n is to tell the number of iteration.
--    the second argument a is the accumulator, when the helper
--    function tailFib hit the base case, it will return
--    the value of a.
--    the second argument also stores the value of current 
--    Fibonacci number value.
--    the third argument stores the previous Fibonacci value.
--
-- c) fib function is a function wrapper on top of tailFib to
--    provide a high level interface for the user.
--    To analyze a recursive function or loops, we should break into
--    three cases:
--      - Initialization: 
--         When n == 1 or n == 2, it directly falls into the 
--         base case and return 1.
--         When n > 2, starting the recursive call with a = 1,
--         and b = 2, denoting the first and second Fibonacci
--         number
--      - Maintenence:
--        In every recursive function call, we can find the
--        current Fibonacci number by add the previous two 
--        Fibonacci number.
--        We reduce n by one(the remaining time of function call)
--        because we have made a function call already.
--        We change a to a + b, denoting the previous Fibonacci
--        number, and we change b = a, denoting the second previous
--        Fibonacci number.
--        Finally, make the function call.
--      - Termination:
--        Clearly, after making the function call and repeatly
--        reduce n by 1, it will fall into the catagory of n == 2.
--        In this case, we simply return the a, the current Fibonacci
--        number. 
