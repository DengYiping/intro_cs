import time

def timing(f):
    def wrap(*args):
        time1 = time.time()
        ret = f(*args)
        time2 = time.time()
        print '%s function took %0.3f ms' % (f.func_name, (time2-time1)*1000.0)
        return ret
    return wrap

def hanoiHelper(source, destination, auxillary, move):
    if move == 1:
        return [(source, destination)]
    if move == 0:
        return []
    return hanoiHelper(source, auxillary, destination, move -1) + hanoiHelper(source, destination, auxillary, 1) + hanoiHelper(auxillary, destination, source, move -1)

memo = {}
def MemHanoiHelper(source, destination, auxillary, move):
    args = (source, destination, auxillary, move)
    if args not in memo:
        if move == 0:
            memo[args] = []
        elif move == 1:
            memo[args] = [(source, destination)]
        else:
            memo[args] = MemHanoiHelper(source, auxillary, destination, move -1) + MemHanoiHelper(source, destination, auxillary, 1) + MemHanoiHelper(auxillary, destination, source, move -1)
    return memo[args]

@timing
def hanoi1(x):
    return hanoiHelper(1, 3, 2, x)

@timing
def hanoi2(x):
    memo = {}
    return MemHanoiHelper(1, 3, 2, x)

