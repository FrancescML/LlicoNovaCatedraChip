import turtle
import yogi


def arbre(n: int, d: float, a: float) -> None:
    """Dibuixa un arbre fractal de n nivell, mida d i angle a."""
    if n > 0:
        turtle.forward(d)
        turtle.right(a)
        arbre(n - 1, d * 3 / 4, a)
        turtle.left(2*a)
        arbre(n - 1, d * 3 / 4, a)
        turtle.right(a)
        turtle.backward(d)


def main():
    turtle.left(90)  # perquè l'arbre creixi cap amunt
    arbre(yogi.read(int), yogi.read(float), yogi.read(float))


main()
