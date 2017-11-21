# Problem 1.1
### a)


```
       |A|B|A|A|B|C|A|B|B|A|B|A|B|B|C|A|B|A|B|A|
STEP 1 |A|B|A|B|
STEP 2   |A|b|a|b|
STEP 3     |A|B|a|b|
STEP 4       |A|B|A|b|
STEP 5         |A|b|a|b|
STEP 6           |A|b|a|b|
STEP 7             |A|B|A|b|
STEP 8               |A|b|a|b|
STEP 9                 |A|b|a|b|
STEP 10                  |A|B|A|B|    <-- correctly find "ABAB"

```
There are 10 aligments and 21 comparisons.
### b)
```

       |A|B|A|A|B|C|A|B|B|A|B|A|B|B|C|A|B|A|B|A|
STEP 1 |a|b|a|B|                           - skip 0
STEP 2   |a|B|A|B|                         - skip 0
STEP 3     |a|b|a|B|                       - skip 3
STEP 4             |a|b|a|B|               - skip 0
STEP 5               |A|B|A|B|             - skip 0
STEP 6                 |a|b|a|B|           - skip 0
STEP 7                   |A|B|A|B|         - first match
```

There are 7 aligments and 15 comparisons.
### c)

This is the skip table for string `ABAB`
 |    Char\ Index    | 0 | 1 | 2 | 3 |
 | ----- | - | - | - | - |
 | **A** | \ | 0 | \ | 0 |
 | **B** | 0 | \ | 0 | \ |
 | **C** | 0 | 1 | 2 | 3 |
 | **D** | 0 | 1 | 2 | 3 |

 ### d)
 Last Occurance Table:
 | Char | Last Occurance Index |
 | ---- | -------------------- |
 | A | 2 |
 | B | 3 |
 | C | -1 |
 | D | -1 |

Execution of one-dimentional algorithm

 ```
        |A|B|A|A|B|C|A|B|B|A|B|A|B|B|C|A|B|A|B|A|
STEP 1 |a|b|a|B|                              - skip 0
STEP 2   |a|B|A|B|                            - skip 0
STEP 3     |a|b|a|B|                          - skip 0
STEP 4             |a|b|a|B|                  - skip 3
STEP 5               |A|B|A|B|                - skip 0
STEP 6                 |a|b|a|B|              - skip 0
STEP 7                   |A|B|A|B|            - skip 0
```

#Problem 2
## a)
```
factorial :: Integer -> Integer
factorial x
	| x == 0 = 1
	| otherwise = x * factorial (x - 1)
```
## b)
```
factorial :: Integer -> Integer
factorial x
        | x == 0 = 1
        | otherwise = x * factorial (x - 1)

factorial_guarded :: Integer -> Integer
factorial_guarded x
	| x < 0 = error "invalid input, the factorial of negative number is undefined"
	| otherwise = factorial x
```
