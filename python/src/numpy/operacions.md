# Operacions amb arrays

En aquesta llicó, explorarem com realitzar operacions aritmètiques i matemàtiques amb arrays de NumPy. Veurem com utilitzar operadors bàsics, funcions universals i el concepte de broadcasting per treballar eficientment amb dades numèriques.

## Operacions aritmètiques element a element

NumPy permet realitzar operacions aritmètiques directament sobre arrays. Aquestes operacions s'apliquen **element a element** (component a component).

Els operadors aritmètics habituals funcionen amb arrays:

```python
import numpy as np

a = np.array([1, 2, 3, 4])
b = np.array([10, 20, 30, 40])

print(a + b)  # [11 22 33 44]
print(a - b)  # [-9 -18 -27 -36]
print(a * b)  # [10 40 90 160]
print(a / b)  # [0.1 0.1 0.1 0.1]
print(a ** 2) # [1 4 9 16]
print(a % 3)  # [1 2 0 1]
```

Quan operem un array amb un escalar, l'operació s'aplica a tots els elements:

```python
a = np.array([1, 2, 3, 4])

print(a + 10)  # [11 12 13 14]
print(a * 2)   # [2 4 6 8]
print(a / 2)   # [0.5 1.  1.5 2. ]
print(a ** 2)  # [1 4 9 16]
```

## Broadcasting

El **broadcasting** és un mecanisme que permet a NumPy operar amb arrays de formes diferents. Automàticament "expandeix" els arrays més petits perquè tinguin formes compatibles amb els més grans, sense necessitat de copiar dades. Aquestes són les regles del broadcasting:

NumPy compara les dimensions dels arrays d'esquerra a dreta:

1. Si els arrays no tenen el mateix nombre de dimensions, s'afegeixen dimensions de mida 1 a l'esquerra de l'array més petit.
2. Les dimensions són compatibles si són iguals o si una d'elles és 1.
3. Si alguna dimensió és incompatible, es produeix un error.

Aquests són alguns exemples pràctics:

-   Broadcasting amb un escalar:

    ```python
    a = np.array([[1, 2, 3],
                  [4, 5, 6]])
    print(a + 10)
    # [[11 12 13]
    #  [14 15 16]]
    ```

-   Broadcasting amb un vector:

    ```python
    a = np.array([[1, 2, 3],
                  [4, 5, 6]])
    b = np.array([10, 20, 30])

    print(a + b)
    # [[11 22 33]
    #  [14 25 36]]
    ```

-   Broadcasting amb arrays de dimensions diferents:

    ```python
    a = np.array([[1],
                  [2],
                  [3]])  # forma (3, 1)
    b = np.array([10, 20, 30])  # forma (3,)

    print(a + b)
    # [[11 21 31]
    #  [12 22 32]
    #  [13 23 33]]
    ```

## Funcions matemàtiques universals

Les **funcions universals** són funcions que operen element a element sobre arrays, de manera vectoritzada i eficient.

Aquest és un exemple de funcions universals trigonomètriques:

```python
angles = np.array([0, np.pi/6, np.pi/4, np.pi/3, np.pi/2])

print(np.sin(angles))  # [0.   0.5  0.707... 0.866... 1.]
print(np.cos(angles))  # [1.   0.866... 0.707... 0.5  0.]
print(np.tan(angles))  # [0.   0.577... 1.   1.732... 1.633e+16]
```

Altres funcions matemàtiques comunes inclouen:

-   Funcions trigonomètriques inverses: `np.arcsin()`, `np.arccos()`, `np.arctan()`.

-   Exponencials i logaritmes: `np.exp()`, `np.log()`, `np.log10()`, `np.log2()`.

-   Arrodoniments i valor absolut: `np.abs()`, `np.floor()`, `np.ceil()`, `np.round()`.
-   Altres funcions útils: `np.sqrt()`, `np.square()`, `np.power()`, `np.sign()`.

## Operacions de comparació

Els operadors de comparació retornen arrays de booleans i funcionen element a element:

```python
a = np.array([1, 2, 3, 4, 5])
b = np.array([5, 4, 3, 2, 1])

print(a == b)  # [False False  True False False]
print(a < b)   # [ True  True False False False]
print(a >= 3)  # [False False  True  True  True]
```

Aquests arrays de booleans es poden utilitzar per indexar:

```python
a = np.array([1, 2, 3, 4, 5])
print(a[a > 3])  # [4 5]
```

Fes funcions `all()` i `any()` permeten comprovar si tots o algun dels elements compleixen una condició:

```python
a = np.array([1, 2, 3, 4, 5])

print(np.all(a > 0))   # True (tots són positius)
print(np.all(a > 3))   # False (no tots són > 3)
print(np.any(a > 3))   # True (algun és > 3)
print(np.any(a > 10))  # False (cap és > 10)
```

Aquestes funcions també es poden aplicar per eixos:

```python
a = np.array([[1, 2, 3],
              [0, 5, 6]])

print(np.all(a > 0, axis=0))  # [False  True  True]
print(np.any(a > 5, axis=1))  # [False  True]
```

<Autors autors="jpetit"/>
