# Anàlisi de l'eficiència d'algorismes recursius

En aquesta lliçó, explorarem com analitzar l'eficiència dels algorismes recursius utilitzant relacions de recurrència. Aquest enfocament ens permet expressar el temps d'execució d'un algorisme en funció del temps d'execució de les seves crides recursives, facilitant així la comprensió del seu comportament asimptòtic.


## Exemple 1

Els algorismes recursius sovint es poden analitzar mitjançant relacions de recurrència. Aquestes relacions expressen el temps d'execució d'un algorisme en funció del temps d'execució de les seves crides recursives.

Considereu aquest algorisme recursiu on el cost de la funció `g` és constant:

```python
def f(n: int) -> None:
    if n > 0:
        g()             # cost O(1)
        f(n - 1)
```

Per trobar el temps d'execució d'aquest algorisme, definim primer
que $T(n)$ com el temps que pren executar `f(n)`.

Per tant, podem establir la següent relació de recurrència:

$$
T(n) =
\begin{cases}
O(1) & \text{si } n = 0 \\
O(1) + T(n - 1) & \text{si } n > 0
\end{cases}
$$

El cas base és quan $n = 0$, on l'algorisme triga un temps constant $O(1)$. El cost en aquest cas no és zero, perquè encara es realitza la comprovació de la condició `if n > 0`, es passen els paràmetres i es realitzen altres operacions.

Per al cas recursiu, quan $n > 0$, el temps d'execució és el temps de l'operació `g()` (que és $O(1)$) més el temps d'execució de la crida recursiva `f(n - 1)` que, pel què hem definit és $T(n - 1)$.

Substituïm la relació de manera iterativa:

$$
\begin{align*}
T(n) &= O(1) + T(n - 1) \\
    &= O(1) + O(1) + T(n - 2) \\
    &= O(1) + O(1) + O(1) + T(n - 3) \\
    &= \underbrace{O(1) + \dots + O(1)}_{n-1} + T(0) \\
    &= n \cdot O(1)\\
    &= O(n)
\end{align*}
$$

Per tant, el temps d'execució d'aquest algorisme recursiu és $O(n)$.


## Exemple 2

Considereu ara aquest algorisme recursiu on el cost de la funció `g(n)` és lineal i cada cop es crida amb una entrada de mida reduïda per la meitat:

```python
def f(n: int) -> None:
    if n > 0:
        g(n)           # cost O(n)
        f(n // 2)
```

De nou, definim que $T(n)$ és el temps que pren executar `f(n)` i extraiem la relació de recurrència:

$$
T(n) =
\begin{cases}
O(1) & \text{si } n = 0 \\
O(n) + T(n/2) & \text{si } n > 0
\end{cases}
$$

De fet, com que per a qualsevol valor constant, el temps d'execució és contant, molts cops ni tan sols es fa explícit el cas base en les relacions de recurrència:

$$
T(n) = O(n) + T(n/2).
$$

Fixeu-vos que els arrondiments es poden eliminar per simplicitat, ja que no tenen efecte en la notació asimptòtica.

Aquest cop, per trobar una fórmula tancada per a $T(n)$, podem utilitzar aquesta tècnica:

Per una banda,
$$
T(n) = n + T(n/2) = n +\frac{n}{2} + \frac{n}{4} + \frac{n}{8} + \dots +2 + 1.
$$

Per altra banda,
$$
2T(n) = 2n + n + \frac{n}{2} + \frac{n}{4} + \frac{n}{8} + \dots    +4 + 2.
$$

Fent la difenència entre les dues expressions, obtenim:
$$
2T(n) - T(n) = T(n) = 2n - 1 = O(n).
$$


## Exemple 3

Considereu ara aquest algorisme recursiu on el cost de la funció `g(n)` és lineal i cada cop es fan dues crides recursives amb entrades de mida reduïda per la meitat:

```python
def f(n: int) -> None:
    if n > 0:
        g(n)           # cost O(n)
        f(n // 2)
        f(n // 2)
```

De nou, definim que $T(n)$ és el temps que pren executar `f(n)` i extraiem la relació de recurrència:

$$
T(n) = O(n) + 2T(n/2).
$$

Aquest cop, per trobar una fórmula tancada per a $T(n)$, ens podem adonar que el nombre de cops que es pot dividir $n$ per 2 és $\log n$. Per tant, podem escriure:

$$
\begin{align*}
T(n) &= n + 2T(n/2) \\
    &= n + 2\frac{n}{2} + 4\frac{n}{4} + 8\frac{n}{8} + \dots \\
    &= \underbrace{n + n + n + n + \dots}_{\log n} \\
    &= O(n \log n).
\end{align*}
$$

## Exercicis

- Calculeu el temps d'execució de l'algorisme recursiu següent:

```python
def f(n: int) -> None:
    if n > 0:
        g(n)           # cost O(n)
        f(n - 1)
```

- Calculeu el temps d'execució de l'algorisme recursiu següent:

```python
def f(n: int) -> None:
    if n > 0:
        g(n)           # cost O(n)
        f(n - 1)
        f(n - 1)
```


## Teorema mestre

Hi ha una eina molt útil per resoldre relacions de recurrència anomenada Teorema Mestre. De moment no l'explico, que es veu a AP2.


<Autors autors="jpetit"/>