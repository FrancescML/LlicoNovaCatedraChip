from yogi import read


def hanoi(n: int,  ori: str,  aux: str,  dst: str) -> None:
    """escriu com moure n discos del piu aux al piu dst utilitzant el piu aux."""

    if n > 0:
        hanoi(n - 1, ori, dst, aux)
        print(f'{ori} -> {dst}')
        hanoi(n - 1, aux, ori, dst)


hanoi(read(int), 'a', 'b', 'c')
