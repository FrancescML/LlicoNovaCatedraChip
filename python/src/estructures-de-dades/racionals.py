
from collections import deque
from dataclasses import dataclass
from typing import TypeAlias
import math
import yogi

Queue: TypeAlias = deque


@dataclass
class Racional:
    num: int
    den: int


def crea_racional(num: int, den: int) -> Racional:
    d = math.gcd(num, den)
    return Racional(num//d, den//d)


def escriure_racional(r: Racional) -> None:
    print(f'{r.num}/{r.den}')


def main() -> None:
    n = yogi.read(int)

    q: Queue[Racional] = Queue()
    q.append(crea_racional(1, 1))

    for _ in range(n):
        r = q.popleft()
        escriure_racional(r)
        r1 = crea_racional(r.num, r.num + r.den)
        q.append(r1)
        r2 = crea_racional(r.num + r.den, r.den)
        q.append(r2)


main()
