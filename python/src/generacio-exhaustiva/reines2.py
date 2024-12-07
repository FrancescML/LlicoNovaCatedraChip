from typing import TypeAlias
from yogi import read


SolParcial: TypeAlias = list[int]
Marques: TypeAlias = list[bool]


def escriure_reines(s: SolParcial) -> None:
    """Escriu en format tauler la solució emmagatzemada en s."""

    for p in s:
        print("· " * p, "♕ ", "· " * (len(s) - p - 1), sep="")
    print()


def generar_reines_rec(
    n: int, s: SolParcial, j: int, files: Marques, descendents: Marques, ascendents: Marques
) -> None:
    """
    Escriu totes les maneres de col·locar n reines en un tauler n⨉n
    de forma que les j primeres reines es col·loquen a les primeres j
    posicions de s. Aquestes primeres j posicions són una solució parcial legal
    i les marques indiquen les posicions ocupades.
    """

    if j == n:
        escriure_reines(s)
    else:
        for i in range(n):
            if not files[i] and not descendents[j - i + n - 1] and not ascendents[j + i]:
                s[j] = i
                files[i] = descendents[j - i + n - 1] = ascendents[j + i] = True
                generar_reines_rec(n, s, j + 1, files, descendents, ascendents)
                files[i] = descendents[j - i + n - 1] = ascendents[j + i] = False


def generar_reines(n: int) -> None:
    """Escriu totes les maneres de col·locar n reines en un tauler n⨉n."""

    s: SolParcial = [-1 for _ in range(n)]  # els valors són irrellevants, la llargada no.
    files = [False for _ in range(n)]  # marques de les files ocupades
    descendents = [False for _ in range(2 * n - 1)]  # marques de les diagonals descendents ocupades
    ascendents = [False for _ in range(2 * n - 1)]  # marques de les diagonals ascendents ocupades
    generar_reines_rec(n, s, 0, files, descendents, ascendents)


if __name__ == "__main__":
    generar_reines(read(int))
