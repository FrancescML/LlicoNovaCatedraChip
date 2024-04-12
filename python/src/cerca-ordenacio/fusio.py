import random
import time
import itertools

from typing import Any


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


def ordena_per_fusio(L: list[Any]) -> None:
    """Ordena la llista L."""

    ordena_per_fusio_rec(L, 0, len(L) - 1)


def ordena_per_fusio_rec(L: list[Any], esq: int, dre: int) -> None:
    """Ordena L[esq..dre]."""

    if esq < dre:
        mig = (esq + dre) // 2
        ordena_per_fusio_rec(L, esq, mig)
        ordena_per_fusio_rec(L, mig + 1, dre)
        fusiona(L, esq, mig, dre)


def fusiona(L: list[Any], esq: int, mig: int, dre: int) -> None:
    """
    Ordena L[esq..dre] sabent que L[esq..mig] està ordenat
    i sabent que L[mig+1..dre] està ordenat.
    """

    R = L[0:0]  # això és el mateix que R = [] però així mypy no plora
    i = esq
    j = mig + 1
    while i <= mig and j <= dre:
        if L[i] <= L[j]:
            R.append(L[i])
            i += 1
        else:
            R.append(L[j])
            j += 1
    R.extend(L[i:mig + 1])
    R.extend(L[j:dre + 1])
    L[esq:dre + 1] = R


def main():
    for n in range(0, 10000+1, 1000):
        llista = random.sample(range(0, n), n)
        t1 = time.perf_counter()
        ordena_per_insercio(llista)
        t2 = time.perf_counter()
        print(n, t2 - t1)


main()
