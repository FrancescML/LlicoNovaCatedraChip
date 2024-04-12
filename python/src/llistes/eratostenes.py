
def es_primer(n: int) -> bool:
    """Indica si el natural n és primer o no."""

    if n <= 1:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d = d + 1
    return True


def primers1(m: int) -> list[int]:
    """Donat un natural m, retorna la llista de tots els nombres primers de 0 a m."""

    if m <= 1:
        return []
    ps = [2]
    for n in range(3, m + 1, 2):
        if es_primer(n):
            ps.append(n)
    return ps


def eratostenes(m: int) -> list[bool]:
    """Retorna una llista de m+1 booleans tal que el valor a la posició i indica si i és o no és primer. Prec: n >= 2."""
    assert m >= 2
    garbell = [False, False] + [True] * (m - 1)
    i = 2
    while i * i <= m:
        if garbell[i]:
            for j in range(2 * i, m + 1, i):
                garbell[j] = False
        i += 1
    return garbell


def primers2(m: int) -> list[int]:
    """retorna una llista amb tots els nombres primers <= n amb n >= 2."""

    garbell = eratostenes(m)
    return [i for i in range(m + 1) if garbell[i]]


print(eratostenes(26))
print(len(primers2(10000000)))
