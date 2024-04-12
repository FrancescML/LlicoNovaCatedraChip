import random
import time
import itertools
from typing import Any


def ordena_per_insercio(L: list[Any]) -> None:
    """Ordena la llista L en ordre creixent."""

    n = len(L)
    for i in range(1, n):
        insereix_ordenadament(L, i)


def insereix_ordenadament(L: list[Any], i: int) -> None:
    """Insereix l'element i de L en L[:i], sabent que L[:i] està ordenat."""

    x = L[i]
    j = i
    while j > 0 and L[j - 1] > x:
        L[j] = L[j - 1]
        j -= 1
    L[j] = x


def main2():
    for n in range(1000, 20001, 1000):
        # llista = random.sample(range(0, n), n)
        llista = list(range(n))
        t1 = time.perf_counter()
        ordena_per_insercio(llista)
        t2 = time.perf_counter()
        print(n, t2 - t1)


def main():
    for n in range(11):
        llista = range(n)
        for permutacio in itertools.permutations(llista):
            permutacio = list(permutacio)
            ordena_per_insercio(permutacio)
            assert permutacio == list(range(n))


main2()
