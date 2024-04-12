from typing import Callable, TypeAlias
from math import acos, sqrt, cos

Func: TypeAlias = Callable[[float], float]


def newton_raphson(f: Func, df: Func, a: float, epsilon: float = 1e-12) -> float:
    """
    Retorna un valor x tal que |f(x) - a| < epsilon. 
    Precondició: a ≥ 0 i df = f'.
    """

    x = 0.8  # primer intent
    fx = f(x)  # per no calcular f(x) dos cops per iteració
    while abs(fx - a) >= epsilon:
        x = x - (fx - a) / df(x)
        fx = f(x)
    return x


def sqr(x: float) -> float:
    return x * x 


def d_sqr(x: float) -> float:
    """derivada de sqr"""
    return 2 * x


def d_acos(x: float) -> float:
    """derivada d'acos"""
    return -1 / sqrt(1 - x * x)



x = 2
print(sqrt(x))
print(newton_raphson(sqr, d_sqr, x))
print()

print(cos(x))
print(newton_raphson(acos, d_acos, x))
