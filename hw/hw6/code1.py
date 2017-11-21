import time
def hanoiHelper(source, destination, auxillary, move):
    if move == 1:
        return 1
    if move == 0:
        return 0
    return hanoiHelper(source, auxillary, destination, move -1) + hanoiHelper(source, destination, auxillary, 1) + hanoiHelper(auxillary, destination, source, move -1)

def MemHanoiHelper(source, destination, auxillary, move, memo):
    args = (source, destination, auxillary, move)
    if args not in memo:
        if move == 0:
            memo[args] = 0
        elif move == 1:
            memo[args] = 1
        else:
            memo[args] = MemHanoiHelper(source, auxillary, destination, move -1, memo) + MemHanoiHelper(source, destination, auxillary, 1, memo) + MemHanoiHelper(auxillary, destination, source, move -1, memo)
    return memo[args]

def memTest(x):
    time1 = time.time()
    MemHanoiHelper(1, 3, 2, x, {})
    time2 = time.time()
    return (time2 - time1) * 1000.0

def memTime(x):
    t = []
    t.append(memTest(x))
    t.append(memTest(x))
    t.append(memTest(x))
    t.append(memTest(x))
    t.append(memTest(x))
    sum = 0.0
    for i in t:
        sum = sum + i
    return sum / len(t)


