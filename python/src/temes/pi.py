import yogi 
import random

def aprox_pi(n: int) -> float:
    d = 0
    for _ in range(n):
        x, y = random.random(), random.random()
        if x * x + y * y <= 1:
            d += 1
    return d / n * 4

n = 10
while n < 1000000000:
    print(n, aprox_pi(n))
    n *= 10