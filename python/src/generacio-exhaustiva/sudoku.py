"""Resolució de Sudokus"""

from dataclasses import dataclass
from typing import TypeAlias
from yogi import read


Usats: TypeAlias = list[list[bool]]


@dataclass
class Sudoku:
    graella: list[list[int]]
    files: Usats
    columnes: Usats
    caixes: Usats


def buit() -> Sudoku:
    """Retorn un sudoku buit."""

    graella = [[0 for _ in range(9)] for _ in range(9)]
    files = [[False for _ in range(10)] for _ in range(9)]
    columnes = [[False for _ in range(10)] for _ in range(9)]
    caixes = [[False for _ in range(10)] for _ in range(9)]
    return Sudoku(graella, files, columnes, caixes)


def escriure(s: Sudoku) -> None:
    """Escriu el sudoku s en el format establert."""

    for i in range(9):
        print(*s.graella[i])


def llegir() -> Sudoku:
    """Llegeix un sudoku i el retorna."""

    s = buit()
    for i in range(9):
        for j in range(9):
            v = read(str)
            if v != ".":
                marcar_casella(s, i, j, int(v))
    return s


def marcar_casella(s: Sudoku, i: int, j: int, v: int):
    """Marca la casella i,j del sudoku s amb el valor v."""

    s.graella[i][j] = v
    s.files[i][v] = True
    s.columnes[j][v] = True
    s.caixes[regio(i, j)][v] = True


def desmarcar_casella(s: Sudoku, i: int, j: int, v: int):
    """Desmarca la casella i,j del sudoku s."""

    s.graella[i][j] = 0
    s.files[i][v] = False
    s.columnes[j][v] = False
    s.caixes[regio(i, j)][v] = False


def regio(i: int, j: int) -> int:
    """Retorna l'índex de la regió on pertany la casella i,j."""

    return 3 * (i // 3) + j // 3


def seguent(i: int, j: int) -> tuple[int, int]:
    """Retorna la següent casella de la casel·la i,j."""

    if j == 8:
        return i + 1, 0
    else:
        return i, j + 1


def legal(s: Sudoku, i: int, j: int, v: int) -> bool:
    """Indica si és legal posar el valor v a la casella i,j de s."""

    return not s.files[i][v] and not s.columnes[j][v] and not s.caixes[regio(i, j)][v]


def resol_rec(s: Sudoku, i: int, j: int) -> bool:
    """
    Resol el sudoku s recursivament sabent que és legal fins a la posició i,j
    (no inclosa). Indica si s'ha trobat o no solució.
    """

    if i == 9:
        return True

    si, sj = seguent(i, j)

    if s.graella[i][j] != 0:
        return resol_rec(s, si, sj)
    else:
        for v in range(1, 10):
            if legal(s, i, j, v):
                marcar_casella(s, i, j, v)
                if resol_rec(s, si, sj):
                    return True
                desmarcar_casella(s, i, j, v)
        return False


def resol(s: Sudoku) -> bool:
    """
    Resol el sudoku s i indica si s'ha trobat o no solució.
    """

    return resol_rec(s, 0, 0)


def main() -> None:
    """Programa principal."""

    s: Sudoku = llegir()
    if resol(s):
        escriure(s)
    else:
        print("Sense solució")


if __name__ == "__main__":
    main()
