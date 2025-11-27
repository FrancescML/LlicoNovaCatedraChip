# Manipulació de formes i dimensions

NumPy proporciona diverses funcions per manipular la forma i les dimensions dels arrays sense modificar-ne les dades subjacents.

## Canvis de forma

La funció `reshape()` permet canviar la forma d'un array mantenint el mateix nombre d'elements:

```python
import numpy as np

a = np.arange(12)
print(a)  # [ 0  1  2  3  4  5  6  7  8  9 10 11]

b = a.reshape(3, 4)
print(b)
# [[ 0  1  2  3]
#  [ 4  5  6  7]
#  [ 8  9 10 11]]

c = a.reshape(2, 2, 3)
print(c.shape)  # (2, 2, 3)
```

Podem usar `-1` per indicar que NumPy calculi automàticament una dimensió:

```python
d = a.reshape(3, -1)  # 3 files, columnes automàtiques
print(d.shape)  # (3, 4)
```

Les funcions `ravel()` i `flatten()` converteixen un array multidimensional en unidimensional. El primer retorna una vista, mentre que el segon retorna una còpia:

```python
e = b.ravel()    # retorna una vista
f = b.flatten()  # retorna una còpia

print(e)  # [ 0  1  2  3  4  5  6  7  8  9 10 11]
```

## Transposició d'arrays

La transposició intercanvia files per columnes:

```python
a = np.array([[1, 2, 3], [4, 5, 6]])
print(a.T)
# [[1 4]
#  [2 5]
#  [3 6]]

```

`a.transpose()` és equivalent a `a.T` i permet especificar l'ordre dels eixos:

```python
c = np.arange(24).reshape(2, 3, 4)
d = c.transpose(1, 0, 2)  # intercanvia els dos primers eixos
print(d.shape)  # (3, 2, 4)
```

## Addició i eliminació de dimensions

`np.newaxis` afegeix una nova dimensió de mida 1:

```python
a = np.array([1, 2, 3, 4])
print(a.shape)  # (4,)

b = a[np.newaxis, :]  # afegeix dimensió al principi
print(b.shape)  # (1, 4)

c = a[:, np.newaxis]  # afegeix dimensió al final
print(c.shape)  # (4, 1)
```

`expand_dims()` és una alternativa més explícita:

```python
d = np.expand_dims(a, axis=0)  # (1, 4)
e = np.expand_dims(a, axis=1)  # (4, 1)
```

`squeeze()` elimina dimensions de mida 1:

```python
f = np.array([[[1], [2], [3]]])
print(f.shape)  # (1, 3, 1)

g = f.squeeze()
print(g.shape)  # (3,)
```

## Concatenació i apilament

`concatenate()` uneix arrays al llarg d'un eix existent:

```python
a = np.array([[1, 2], [3, 4]])
b = np.array([[5, 6]])

c = np.concatenate([a, b], axis=0)
print(c)
# [[1 2]
#  [3 4]
#  [5 6]]
```

`vstack()` i `hstack()` són dreceres per apilar verticalment i horitzontalment:

```python
d = np.vstack([a, b])  # equivalent a concatenate amb axis=0
e = np.hstack([a, a])  # apila horitzontalment
print(e)
# [[1 2 1 2]
#  [3 4 3 4]]
```

`stack()` crea una nova dimensió:

```python
f = np.stack([a, a], axis=0)
print(f.shape)  # (2, 2, 2)

g = np.stack([a, a], axis=2)
print(g.shape)  # (2, 2, 2)
```

## Divisió d'arrays

`split()` divideix un array en múltiples subconjunts:

```python
a = np.arange(12).reshape(3, 4)

# Divideix en 3 parts iguals al llarg de l'eix 0
parts = np.split(a, 3, axis=0)
print(len(parts))  # 3
print(parts[0])    # [[0 1 2 3]]

# Divideix en posicions específiques
parts2 = np.split(a, [1, 3], axis=1)
print(parts2[0].shape)  # (3, 1)
print(parts2[1].shape)  # (3, 2)
```

`hsplit()` i `vsplit()` són dreceres per dividir horitzontalment i verticalment:

```python
h1, h2 = np.hsplit(a, 2)  # divideix en 2 parts horitzontalment
print(h1.shape)  # (3, 2)

v1, v2, v3 = np.vsplit(a, 3)  # divideix en 3 parts verticalment
print(v1.shape)  # (1, 4)
```

<Autors autors="jpetit"/>
