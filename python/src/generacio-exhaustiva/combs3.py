
def generar_combinacions(n: int, mots: list[str]) -> None:
    """
    Escriu totes les combinacions d'n elements triats en mots, 
    sense dos mots consecutius repetits, amb n ≥ 0.
    """

    generar_combinacions_rec(n, mots, ['' for _ in range(n)], 0)


def generar_combinacions_rec(n: int, mots: list[str], L: list[str], i: int) -> None:
    """
    Escriu totes les combinacions d'n elements triats en mots, sense dos mots 
    consecutius repetits, i que comencin amb L[:i], amb |L| = n ≥ i ≥ 0.
    """

    if i == n:
        print(' '.join(L))
    else:
        for mot in mots:
            if i == 0 or mot != L[i - 1]:
                L[i] = mot
                generar_combinacions_rec(n, mots, L, i + 1)


if __name__ == '__main__':
    generar_combinacions(3, 'pep quim pau'.split())
