import turtle
import yogi


def corba_koch(mida: float, nivells: int) -> None:
    """Dibuixa la corba de Koch per una determinada mida m i nombre de nivells n."""

    if nivells == 0:
        turtle.forward(mida)
    else:
        corba_koch(mida / 3, nivells - 1)
        turtle.left(60)
        corba_koch(mida / 3, nivells - 1)
        turtle.right(120)
        corba_koch(mida / 3, nivells - 1)
        turtle.left(60)
        corba_koch(mida / 3, nivells - 1)


def floc_koch(mida: float, nivells: int) -> None:
    """Dibuixa el floc de neu de Koch per una determinada mida m i nombre de nivells n."""

    for _ in range(3):
        corba_koch(mida, nivells)
        turtle.right(120)


def main() -> None:
    m, n = yogi.read(float), yogi.read(int)
    turtle.speed(0)     # accelera la tortuga
    floc_koch(m, n)
    turtle.done()


main()
