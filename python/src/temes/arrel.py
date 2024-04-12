from typing import Callable, TypeAlias
from math import acos, sqrt, cos

Func: TypeAlias = Callable[[float], float]



def arrel(f: Func, a: float, b: float, epsilon: float = 1e-12) -> float:
    """
    Retorna un valor c ∈ [a,b] tal que f té una arrel en [c, c + epsilon].
    Prec: f és una funció continua sobre $[a,b]$ tal que f(a)·f(b) < 0.
    """
    while b - a > epsilon:
        c = (a + b) / 2
        if f(a) * f(c) <= 0:
            b = c
        else:
            a = c
    return a


def p(x: float) -> float:
    return (x + 1) * (x - 2) * (x + 3) * (x - 4)


def arrel_quadrada(a: float, epsilon: float = 1e-12) -> float:
    """
    Retorna un valor x tal que |x²-a| < epsilon. 
    Precondició: a ≥ 0.
    """

    x = 1.0  # primer intent
    while abs(x*x - a) >= epsilon:
        print(x)
        x = (x + a/x) / 2
    return x

def newton_raphson(f: Func, df: Func, a: float, epsilon: float = 1e-12) -> float:
    """
    Retorna un valor x tal que |f(x) - a| < epsilon. 
    Precondició: a ≥ 0 i df = f'.
    """

    x = 0.8  # primer intent
    while abs(f(x) - a) >= epsilon:
        print(x)
        x = x - (f(x) - a) / df(x)
    return x

#print(arrel(p, -2, 5))

def sqr(x: float) -> float:
    return x * x 


def dsqr(x: float) -> float:
    """derivada de sqr"""
    return 2 * x


def dacos(x: float) -> float:
    """derivada d'acos"""
    return -1 / sqrt(1 - x * x)


x = 2
print(sqrt(x))
print(newton_raphson(sqr, dsqr, x))
print()

print(cos(x))
print(newton_raphson(acos, dacos, x))
