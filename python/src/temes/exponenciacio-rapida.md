# Exponenciació ràpida

<img src='./exponenciacio-rapida.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó presenta el mètode de l'exponenciació ràpida. Amb aquest mètode, potències del tipus $x^n$ es poden calcular utilitzant uns $\log n$ productes, enlloc dels $n$ que caldrien amb un mètode més ingenu. Per explicar la tècnica es presenta primer el cas de l'exponenciació de reals. Després aquesta idea s'aplica a l'exponenciació modular, a l'exponenciació de matrius quadrades, i al càlcul de nombres de Fibonacci.


## Exponenciació bàsica

Si volem elevar un valor $x$ a un nombre natural $n$ per obtenir $x^n$, la solució més natural és fer un bucle que multipliqui $x$ per ella mateixa $n$ cops:

```python
def exp(x: float, n: int) -> float:
    """Retorna x^n, amb n ≥ 0."""

    r = 1.0
    for _ in range(n):
        r *= x
    return r
```

Alguns direu que no calia aquest algorisme, que calcular l'expressió `x ** n` era suficient... Per reals, teniu raó. Però d'aquí un moment elevarem objectes que són números. Paciència.

En tot cas, és clar que el temps d'aquest algorisme és $O(n)$, és a dir, lineal amb el valor de l'exponent. Es podria fer millor?


## Exponenciació ràpida

Per poder calcular exponenciacions més ràpidament, podem intentar formular una solució recursiva al problema. Comencem per aquí:

- Quan $n=0$, tenim $x^n=x^0=1$. Això pot constituir el nostre cas base.

- Quan $n>0$, tenim $x^n=x · x^{n-1}$. Això pot constituir el nostre cas recursiu.

Amb aquest idea, ens surt la funció recursiva següent:

```python
def exp(x: float, n: int) -> float:
    """Retorna x^n, amb n ≥ 0."""

    if n == 0:
        return 1.0
    else:
        return x * exp(x, n - 1)
```

Però aquest algorisme també és lineal, ja que farà $n$ productes igual que l'iteratiu. 

Ara bé, podem afinar una mica millor la recurrència tenint en compte la paritat de l'exponent en el cas recursiu:

- Quan $n=0$, tenim $x^n=x^0=1$, igual que abans. 

- Quan $n>0$ i $n$ és parell, tenim $x^n=x^{n/2}·x^{n/2}=\left(x^{n/2}\right)^2$.

- Quan $n>0$ i $n$ és senar, tenim $x^n=x^{n/2}·x^{n-n/2}=x^{n/2}·x^{n/2}·x=\left(x^{n/2}\right)^2·x$. Aquí, $n/2$ denota la divisió entera de $n$ entre $2$.

La traducció d'aquesta idea a Python és directa:

```python
def exp(x: float, n: int) -> float:
    """Retorna x^n, amb n ≥ 0."""

    if n == 0:
        return 1.0
    else:
        y = exp(x, n // 2)
        if n % 2 == 0:
            return y * y
        else:
            return y * y * x
```

Ara, com que a cada crida recursiva l'exponent es divideix per dos, l'algorisme resultant té cost $O(\log n)$, és a dir, logarítmic respecte l'exponent. Una millora espectacular! Aquest algorisme s'anomena l'**algorisme d'exponenciació ràpida**.

Fixeu-vos que a la funció anterior és capital cridar recursivament només un cop i desar el resultat en una variable auxiliar (`y`). Si s'hagués cridat dos cops, el cost continuaria sent lineal ja que es repetirien un munt de càlculs.

**Exercici:** Implementeu iterativament l'algorisme d'exponenciació ràpida.


## Exponenciació modular ràpida

En l'àrea de la criptografia, en moltes ocasions és necessari calcular el resultat de $x^n \pmod m$ per a $x, n, m$ naturals. Es podria resoldre aquest problema per força bruta calculant $x^n$ primer i després fent-ne el mòdul, però com que els nombres que apareixen en aplicacions criptogràfiques solen ser molt grans, $x^n$ seria enorme. Cal tenir en compte que la velocitat dels càlculs amb enters depenen de la seva grandària. Per tant, és convenient buscar un mètode més eficient. 

Per fer-ho, és clau adonar-se d'aquest fet: La multiplicació manté les congruències. És a dir, si $a = b \pmod n$, llavors  $a·k = b \pmod n$.

Així, es pot usar la idea de l'exponenciació ràpida, fent que cada resultat temporal s'empetiteixi fent-ne el mòdul immediatament (enlloc de deixar-lo pel final). Aquesta en podria ser la implementació resultant:


```python
def expmod(x: int, n: int, m: int) -> int:
    """Retorna (x^n) mod n. Prec: x, n ≥ 0 i m > 0."""

    if x == 0:
        return 1
    else:
        y = expmod(x, n // 2, m)
        if n % 2 == 0:
            return (y * y) % m
        else:
            return (((y * y) % m) * x) % m
```

Fixeu-vos que la darrera branca aplica el mòdul després de cada producte. `(y * y * x) % n` també seria correcte, però crearia valors temporals més grans, reduint la velocitat d'execució.

**Nota:** La funció predefinida `pow` pot rebre un tercer paràmetre, de forma que `pow(x, n, m)` justament calcula `(x ** n) % p`. Probablement usa un algorisme com el que hem descrit. 


## Potències de matrius quadrades

Considerem ara el problema de calcular $A^n$, on $n$ és un natural i $A$ és una matriu quadrada.

En una [lliçó anterior](/matrius/mates.html) ja vam desenvolupar una funció per multiplicar matrius quadrades:

```python
from typing import TypeAlias

Matriu: TypeAlias = list[list[Fila]]


def producte(A: Matriu, B: Matriu) -> Matriu:
    """Retorna el producte de A i B, sabent que les dues són quadrades."""

    n = len(A)
    return [
        [
            sum([A[i][k] * B[k][j] for k in range(n)]) 
            for j in range(n) 
        ] 
        for i in range(n)
    ]
```

Suposem que tenim creada la funció producte que hem definit abans. Clarament, per elevar al quadrat una matriu no cal més que fer el producte per ella mateixa, com

```python
M_quadrat = producte(M, M)
```

Si el que volem ara és calcular potències més grans de la matriu `A`, podem, de nou, utilitzar la tècnica de l'exponenciació ràpida: 

- Quan $n$ és zero, cal retornar la matriu unitària, és a dir, la matriu on tot són zeros menys la diagonal, que és plena de uns.

- Quan $n$ és parell, la potència n-èsima es pot descompondre com el producte $A^n = A^{n/2} * A^{n/2}$.

- I quan `n` és senar, podem descompondre el producte com $A^n = A * \left(A^{n/2}\right)^2$. 

Un altre cop, la gràcia d'aquesta descomposició és que, com que les dues matrius que multipliquem són iguals, no cal que la calculem dos cops, i així cada cop que ens trobem amb un $n$ parell ens estarem estalviant la meitat dels productes que ens queden. Tot això funciona perquè el producte de matrius quadrades és associatiu.

```python
def potencia(A: Matriu, n: int) -> Matriu:
    """Retorna A^n per una matriu quadrada A i un natural n."""

    if n == 0:
        m = len(A)
        # retorna matriu unitària
        return [[1 if i == j else 0 for j in range(m)] for i in range(m)]
    else:
        B = potencia(A, n // 2)
        if n % 2 == 0:
            return producte(B, B)
        else:
            return producte(A, producte(B, B))
```

Així, el nombre de productes de matrius que estem fent ara serà de l'ordre de $\log(n)$. Com que el producte de dues matrius $n\times n$ és $O(n^3)$, l'algorisme resultant és $O(n^3\log n)$.


## Nombres de Fibonacci

Recordeu que la seqüència de Fibonacci es defineix de la forma següent:

$$F(n) = \begin{cases} n & \text{si}\ n\le 1, \\\ F(n-1)+F(n-2) & \text{altrament.}\end{cases}$$

Els seus primers elements són 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377.

Considerem la matriu
$$
M =
\left(\begin{array}{cc}
0 & 1 \\\
1 & 1
\end{array}\right) =
\left(\begin{array}{cc}
F_0 & F_1 \\\
F_1 & F_2
\end{array}\right).
$$

Definirem també les matrius $M_n$ com
$$
M_n =
\left(\begin{array}{cc}
F\_n & F\_{n+1} \\\
F\_{n+1} & F\_{n+2}
\end{array}\right).
$$
Es pot veure clarament que $M = M_0$. 

Vegem què passa quam fem el producte de la matriu $M$ per la matriu $M_n$:

!!! Merda, falta arreglar totes aquestes mates.

$$
\left(\begin{array}{cc}
0 & 1 \\\
1 & 1
\end{array}\right)
\left(\begin{array}{cc}
F\_{n} & F\_{n+1} \\\
F\_{n+1} & F\_{n+2}
\end{array}\right) =
\left(\begin{array}{cc}
F\_{n+1} & F\_{n+2} \\\
F\_{n}+F\_{n+1} & F\_{n+1}+F\_{n+2}
\end{array}\right) =
\left(\begin{array}{cc}
F\_{n+1} & F\_{n+2} \\\
F\_{n+2} & F\_{n+3}
\end{array}\right)
$$

És a dir, $M\cdot M_n = M_{n+1}$ per qualsevol $n$! En particular tenim que
$M^2 = M\cdot M_0 = M_1$, $M^3 = M\cdot M_1 = M_2$, i així successivament.
Per tant, $M^n = M_{n-1}$ per qualsevol $n$. I ara ve la millor part:
nosaltres sabem calcular la potència
d'una matriu quadrada fent només uns $\log(n)$ productes 😃. Així, per trobar
el terme $F_n$ de la successió de Fibonacci, només hem de calcular la potència
$n+1$-èsima de $M$ (que és $M_n) i mirar el primer element, i ho podem fer en un nombre d'operacions
logarítmic. 

Amb tots els deures fets, la implementació és doncs ben senzilla:

```python
def fibonacci(n: int) -> int:
    """Retorna l'n-èsim nombre de Fibonacci."""

    M = [[0, 1], 
         [1, 1]]
    Mn = potencia(M, n) 
    return Mn[1][0]
```

Tenint en compte que les matrius que ens aparèixen en aquesta aplicació són totes de mida $2\times2$, potser val la pena optimitzar el seu producte substituint els bucles pels valors finals:

```python
def producte2x2(A, B):
    """Retorna A*B on A i B són matrius 2×2"""

    [[a, b],
     [c, d]] = A        
    [[p, q],            
     [r, s]] = B
    return [[a*p + b*r, a*q + b*s],
            [c*p + d*r, c*q + d*s]]
```

Fixeu-vos com es poden desempaquetar els valors individuals continguts a les matrius.


**Observació:** Potser trobareu alguna font que us explicarà que els nombres de Fibonacci es poden calcular amb la fórmula tancada següent:

$$
F_n = \dfrac{\varphi^n}{\sqrt5}+\frac12
$$
on $\varphi$ és el nombre auri
$$
\varphi = \dfrac{1 + \sqrt5}{2}.
$$

Això dóna lloc a la següent implementació que funciona en temps constant:

```python
def fibonacci(n: int) -> int:
    """Retorna l'n-èsim nombre de Fibonacci"""
       
    ϕ = (1 + math.sqrt(5)) / 2
    return int(ϕ**n / math.sqrt(5) + 1/2)
```

Malauradament, degut als problemes de precisió dels nombres de coma flotant, aquesta funció falla a partir de $n=71$.


<Autors autors="jpetit"/> 

