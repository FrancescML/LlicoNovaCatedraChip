# Arrays: accés

En aquesta llicó, aprendrem com accedir i manipular elements dins d'un array de NumPy utilitzant diferents tècniques d'indexació i slicing.

## Indexació bàsica

L'indexació d'arrays unidimensionals en NumPy funciona igual que amb les llistes de Python: els índexs comencen en 0 i es poden utilitzar índexs negatius per accedir als elements des del final.

```python
import numpy as np

a = np.array([10, 20, 30, 40, 50])
print(a[0])    # 10
print(a[2])    # 30
print(a[-1])   # 50
print(a[-2])   # 40
```

Per accedir als elements d'arrays multidimensionals, s'utilitzen múltiples índexs separats per comes. Cada índex correspon a una dimensió de l'array.

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

print(b[0, 0])    # 1
print(b[1, 2])    # 6
print(b[2, 1])    # 8
print(b[-1, -1])  # 9
```

També s'hi pot accedir progressivament:

```python
print(b[1])       # [4 5 6] (segona fila)
print(b[1][2])    # 6 (equivalent a b[1, 2])
```

## Slicing

El _slicing_ (extracció de segments) permet seleccionar subconjunts d'arrays. Com a les llistes, la sintaxi és `start:stop:step` i es pot aplicar independentment a cada dimensió.

```python
a = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

print(a[2:7])      # [2 3 4 5 6]
print(a[::2])      # [0 2 4 6 8]
print(a[1:8:2])    # [1 3 5 7]
print(a[:5])       # [0 1 2 3 4]
print(a[5:])       # [5 6 7 8 9]
```

En arrays multidimensionals, cada dimensió es pot tallar independentment:

```python
b = np.array([[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12]])

print(b[0:2, 1:3])   # [[2 3]
                     #  [6 7]]

print(b[:, 2])       # [ 3  7 11] (tercera columna)
print(b[1, :])       # [5 6 7 8] (segona fila)
print(b[:2, ::2])    # [[1 3]
                     #  [5 7]]
```

Compte! A diferència de les llistes de Python, el slicing en NumPy **no crea còpies** sinó **vistes** de l'array original. Això significa que modificar la vista també modifica l'array original.

```python
a = np.array([1, 2, 3, 4, 5])
b = a[1:4]         # b és una vista, no una còpia
b[0] = 99
print(a)           # [ 1 99  3  4  5] (l'original ha canviat!)
```

Per obtenir una còpia independent, cal utilitzar el mètode `copy()`:

```python
a = np.array([1, 2, 3, 4, 5])
b = a[1:4].copy()  # b és una còpia
b[0] = 99
print(a)           # [1 2 3 4 5] (l'original no canvia)
```

## Indexació amb booleans (màscares)

Les màscares booleanes permeten seleccionar elements que compleixen una condició. Es crea un array de booleans amb la mateixa forma que l'array original, on `True` indica els elements a seleccionar.

```python
a = np.array([10, 15, 20, 25, 30])

mascara = a > 18
print(mascara)           # [False False  True  True  True]
print(a[mascara])        # [20 25 30]

# Directament:
print(a[a > 18])         # [20 25 30]
print(a[a % 2 == 0])     # [10 20 30]
```

Es poden combinar múltiples condicions amb els operadors `&` (and), `|` (or) i `~` (not):

```python
a = np.array([5, 12, 18, 23, 30, 45])

print(a[(a > 10) & (a < 25)])   # [12 18 23]
print(a[(a < 10) | (a > 40)])   # [ 5 45]
print(a[~(a % 3 == 0)])         # [ 5 23]
```

Les màscares també funcionen amb arrays multidimensionals:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

print(b[b > 5])          # [6 7 8 9] (array unidimensional)
b[b % 2 == 0] = 0        # modifica els elements parells
print(b)                 # [[1 0 3]
                         #  [0 5 0]
                         #  [7 0 9]]
```

## Indexació avançada amb arrays d'enters

Es poden utilitzar arrays d'enters per seleccionar elements en posicions específiques. Això sempre retorna una **còpia**, no una vista.

```python
a = np.array([10, 20, 30, 40, 50])

indexs = np.array([0, 2, 4])
print(a[indexs])         # [10 30 50]

print(a[[1, 3, 1]])      # [20 40 20]
```

En arrays multidimensionals, es pot especificar un array d'indexs per cada dimensió:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

files = np.array([0, 1, 2])
columnes = np.array([2, 1, 0])
print(b[files, columnes])    # [3 5 7]

# Seleccionar files completes:
print(b[[0, 2]])             # [[1 2 3]
                             #  [7 8 9]]
```

## La funció `where()`

La funció `np.where()` té dues utilitats principals:

-   **Trobar índexs** on es compleix una condició:

    ```python
    a = np.array([10, 25, 30, 15, 40])

    indexs = np.where(a > 20)
    print(indexs)            # (array([1, 2, 4]),)
    print(a[indexs])         # [25 30 40]
    ```

-   **Selecció condicional** entre dos valors (equivalent a un operador ternari):

    ```python
    a = np.array([1, 2, 3, 4, 5])

    # on a > 2, retorna a*10, altrament retorna 0
    resultat = np.where(a > 2, a * 10, 0)
    print(resultat)          # [ 0  0 30 40 50]

    # Classificar elements:
    b = np.array([-2, 5, 0, -8, 3])
    classificacio = np.where(b > 0, 'positiu',
                            np.where(b < 0, 'negatiu', 'zero'))
    print(classificacio)     # ['negatiu' 'positiu' 'zero' 'negatiu' 'positiu']
    ```

En arrays multidimensionals, `where()` retorna una tupla d'arrays amb els índexs per cada dimensió:

```python
b = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

files, columnes = np.where(b > 5)
print(files)              # [1 2 2 2]
print(columnes)           # [2 0 1 2]
print(b[files, columnes]) # [6 7 8 9]
```

<Autors autors="jpetit"/>
