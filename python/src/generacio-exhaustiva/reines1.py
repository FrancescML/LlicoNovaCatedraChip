from typing import TypeAlias
from yogi import read


SolParcial: TypeAlias = list[int]


def escriure_reines(s: SolParcial) -> None:
    """Escriu en format tauler la solució emmagatzemada en s."""

    for p in s:
        print("· " * p, "♕ ", "· " * (len(s) - p - 1), sep="")
    print("")


def legal(s: SolParcial, i: int, j: int) -> bool:
    """Indica si és legal col·locar una reina a la fila i i columna j per a a solució parcial s."""

    for k in range(j):
        if s[k] == i or abs(s[k] - i) == abs(k - j):
            return False
    return True


def generar_reines_rec(n: int, s: SolParcial, j: int) -> None:
    """
    Escriu totes les maneres de col·locar n reines en un tauler n⨉n
    de forma que les j primeres reines es col·loquen a les primeres j
    posicions de s. Aquestes primeres j posicions són una solució parcial legal.
    """

    if j == n:
        escriure_reines(s)
    else:
        for i in range(n):
            if legal(s, i, j):
                s[j] = i
                generar_reines_rec(n, s, j + 1)


def generar_reines(n: int) -> None:
    """Escriu totes les maneres de col·locar n reines en un tauler n⨉n."""

    s: SolParcial = [-1 for _ in range(n)]  # els valors són irrellevants, la llargada no.
    generar_reines_rec(n, s, 0)


if __name__ == "__main__":
    generar_reines(read(int))
