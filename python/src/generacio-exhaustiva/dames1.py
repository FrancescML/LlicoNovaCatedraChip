
def genera_dames(n: int) -> None:
    dames = [-1 for _ in range(n)]
    genera_dames_rec(n, dames, 0)


def legal(n: int, dames: list[int], i: int, j: int) -> bool:
    for k in range(i):
        if dames[k] == j or j - i == dames[k] - k or j + i == dames[k] + k:
            return False
    return True


def genera_dames_rec(n: int, dames: list[int], i: int) -> None:
    if i == n:
        escriure_dames(dames)
    else:
        for j in range(n):
            if legal(n, dames, i, j):
                dames[i] = j
                genera_dames_rec(n, dames, i+1)


def escriure_dames(dames: list[int]) -> None:
    for p in dames:
        print('· ' * p, '♕ ', '· ' * (len(dames)-p-1), sep='')
    print()


genera_dames(4)
