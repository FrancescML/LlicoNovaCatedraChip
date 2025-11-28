# Arrays: creació i propietats

Un **array** de NumPy és una estructura de dades multidimensional que emmagatzema elements del mateix tipus de manera eficient. En aquesta llicó, explorarem com crear arrays i les seves propietats bàsiques.

## Creació d'arrays

**A partir de llistes i tuples:** La forma més directa de crear un array és convertir una llista o tupla amb la funció `array()`:

```python
import numpy as np

# Array unidimensional
a = np.array([1, 2, 3, 4, 5])
print(a)  # [1 2 3 4 5]

# Array bidimensional (matriu)
m = np.array([[1, 2, 3], [4, 5, 6]])
print(m)
# [[1 2 3]
#  [4 5 6]]

# A partir d'una tupla
t = np.array((10, 20, 30))
print(t)  # [10 20 30]
```

NumPy infereix automàticament el tipus de dades (`dtype`), però es pot especificar explícitament:

```python
# Array d'enters
a = np.array([1, 2, 3], dtype=int)

# Array de reals
b = np.array([1, 2, 3], dtype=float)
print(b)  # [1. 2. 3.]
```

**Funcions de creació: `zeros()`, `ones()`, `empty()`, `full()`:** NumPy proporciona funcions per crear arrays amb valors predefinits:

```python
# Array de zeros
z = np.zeros(5)
print(z)  # [0. 0. 0. 0. 0.]

# Matriu de zeros
m = np.zeros((3, 4))  # 3 files, 4 columnes
print(m.shape)  # (3, 4)

# Array d'uns
u = np.ones((2, 3))
print(u)
# [[1. 1. 1.]
#  [1. 1. 1.]]

# Array buit (sense inicialitzar, més ràpid)
e = np.empty(4)  # Conté valors arbitraris

# Array amb un valor constant
f = np.full((2, 2), 7)
print(f)
# [[7 7]
#  [7 7]]

# Array amb un valor i tipus específic
g = np.full(3, 3.14, dtype=float)
print(g)  # [3.14 3.14 3.14]
```

**Generació de seqüències amb `arange` i `linspace`:** Per crear seqüències de nombres, NumPy ofereix alternatives més potents que `range`:

```python
# arange(inici, final, pas) - similar a range()
a = np.arange(0, 10, 2)
print(a)  # [0 2 4 6 8]

# Funciona amb floats
b = np.arange(0, 1, 0.1)
print(b)  # [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]

# linspace(inici, final, num) - num punts equiespaiats
c = np.linspace(0, 10, 5)
print(c)  # [0.0 2.5  5.0 7.5 10.0]

# linspace inclou el valor final per defecte
d = np.linspace(0, 1, 11)  # Útil per dividir en intervals
```

**Arrays aleatoris:** El mòdul `numpy.random` permet generar arrays amb valors aleatoris:

```python
# Nombres aleatoris uniformes entre 0 i 1
a = np.random.random(5)
print(a)  # Exemple: [0.234 0.891 0.456 0.123 0.789]

# Matriu aleatòria
m = np.random.random((3, 3))

# Enters aleatoris en un rang
b = np.random.randint(0, 10, size=5)
print(b)  # Exemple: [3 7 1 9 2]

# Distribució normal (mitjana=0, desviació=1)
c = np.random.randn(5)
print(c)  # Exemple: [-0.234 1.456 -0.891 0.123 0.567]

# Distribució normal amb paràmetres personalitzats
d = np.random.normal(loc=10, scale=2, size=5)  # mitjana=10, desv=2

# Mostra aleatòria d'una llista
e = np.random.choice([10, 20, 30, 40], size=3)
print(e)  # Exemple: [30 10 30]

# Barrejar un array
arr = np.arange(10)
np.random.shuffle(arr)
print(arr)  # Exemple: [3 7 1 9 4 0 2 8 5 6]
```

## Propietats bàsiques dels arrays

Un cop creat un array de NumPy, podem consultar diverses propietats que descriuen la seva estructura i contingut. Considerem l'array següent:

```python
a = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
```

Llavors, aquestes són les propietats més importants:

-   **`shape`**: Una tupla que indica les dimensions de l'array. Per a una matriu, especifica el nombre de files i columnes.

    ```python
    a.shape 👉 (2, 4)
    ```

-   **`ndim`**: El nombre de dimensions (eixos) de l'array. Un vector té 1 dimensió, una matriu en té 2, etc.

    ```python
    a.ndim 👉 2
    ```

-   **`size`**: El nombre total d'elements de l'array, equivalent al producte de les dimensions.

    ```python
    a.size 👉 8
    ```

-   **`dtype`**: El tipus de dades dels elements de l'array. Tots els elements tenen el mateix tipus.

    ```python
    a.dtype 👉 dtype('int64')
    ```

Aquestes propietats són de només lectura (excepte `shape` en alguns casos) i permeten entendre l'estructura i característiques dels arrays amb què treballem.

<Autors autors="jpetit"/>
