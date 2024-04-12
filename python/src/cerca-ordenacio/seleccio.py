import random
import time
import itertools


def posicio_minim(L: list[int], i: int) -> int:
    """Retorna la posició de l'element més petit de L[i:] amb 0 ≤ i < len(L)."""

    n = len(L)
    p = i
    for j in range(i + 1, n):
        if L[j] < L[p]:
            p = j
    return p


def ordena_per_seleccio(L: list[int]) -> None:
    """Ordena la llista L en ordre creixent."""

    n = len(L)
    for i in range(n - 1):
        p = posicio_minim(L, i)
        L[i], L[p] = L[p], L[i]


def main2():
    for n in range(1000, 20001, 1000):
        llista = random.sample(range(0, n), n)
        t1 = time.perf_counter()
        ordena_per_seleccio(llista)
        t2 = time.perf_counter()
        print(n, t2 - t1)


def main():
    for n in range(11):
        llista = range(n)
        for permutacio in itertools.permutations(llista):
            permutacio = list(permutacio)
            ordena_per_seleccio(permutacio)
            assert permutacio == list(range(n))


main()
