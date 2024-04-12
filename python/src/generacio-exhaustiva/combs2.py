
def generar_combinacions(n: int, mots: list[str]) -> None:
    """Escriu totes les combinacions d'n elements triats en mots, per n ≥ 0."""

    generar_combinacions_rec(n, mots, ['' for _ in range(n)], 0)


def generar_combinacions_rec(n: int, mots: list[str], L: list[str], i: int) -> None:
    """Escriu totes les combinacions d'n elements triats en mots, que comencin amb L[:i], amb |L| = n ≥ i ≥ 0."""

    if i == n:
        print(' '.join(L))
    else:
        for L[i] in mots:
            generar_combinacions_rec(n, mots, L, i + 1)


if __name__ == '__main__':
    generar_combinacions(2, 'anna berta carla'.split())
