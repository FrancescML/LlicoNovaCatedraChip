# Entrada i sortida

Aquesta lliçó presenta les funcions bàsiques de NumPy per a desar i carregar arrays des de i cap a fitxers.

## Desar i carregar arrays binaris

NumPy ofereix un format de fitxer binari anomenat **NPY** que és l'estàndard per a desar arrays de NumPy de manera eficient.

-   La funció `numpy.save(file, arr)` desa un array a un fitxer binari amb l'extensió **.npy**. Aquí, `file` és el nom del fitxer (o un objecte fitxer) on es desarà l'array i `arr` és l'array que es vol desar.

-   La funció `numpy.load(file)` carrega les dades d'un fitxer **.npy** (o un altre format binari de NumPy) i retorna l'array que conté. Aquí, `file` és el nom del fitxer (o un objecte fitxer) del qual es vol carregar l'array.

Aquest és un exemple d'ús bàsic:

```python
import numpy as np

# Crear un array
arr = np.arange(5)

# Desar l'array en un fitxer binari
np.save('el_meu_array.npy', arr)

# Carregar l'array
arr_carregat = np.load('el_meu_array.npy')
print(arr_carregat) # [0 1 2 3 4]
```

## Format comprimit

Quan es necessita desar **múltiples arrays** en un sol fitxer, NumPy proporciona un format basat en un arxiu ZIP que conté diversos fitxers **.npy**, un per a cada array.

-   La funció `numpy.savez(file, *args, **kwds)` desa múltiples arrays en un **fitxer d'arxiu no comprimit** amb l'extensió **.npz**. Els arrays es poden passar com a arguments posicionals (sense nom) o com a arguments de paraula clau (amb un nom). Si no es proporciona un nom, se'ls assignen noms per defecte com 'arr_0', 'arr_1', etc.

-   La funció `numpy.savez_compressed(file, *args, **kwds)` és similar a `savez()`, però **comprimeix** els arrays dins de l'arxiu, la qual cosa és útil per a dades grans o arrays dispersos.

Per carregar fitxers **.npz**, també s'utilitza la funció `numpy.load(file)`. Aquesta funció retorna un objecte `NpzFile` que actua com un diccionari, on les claus són els noms dels arrays.

```python
# Crear dos arrays
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# Desar els dos arrays en un fitxer .npz
np.savez('dos_arrays.npz', array_a=a, array_b=b)

# Carregar l'arxiu .npz
dades = np.load('dos_arrays.npz')

# Accedir als arrays pel seu nom
print(dades['array_a'])  # Sortida: [1 2 3]
print(dades['array_b'])  # Sortida: [4 5 6]
```

## Formats de text

NumPy també permet intercanviar dades amb fitxers de text pla (com ara CSV o TSV), tot i que és menys eficient que els formats binaris. En aquest cas sóon útils les funcions següents:

-   `numpy.savetxt(fname, X, fmt='%.18e', delimiter=' ')` desa un array (o una seqüència d'arrays 1D) a un fitxer de text.

    -   `fname`: Nom del fitxer.
    -   `X`: Array 1D o 2D que es vol desar.
    -   `fmt`: Format del nombre a escriure (per defecte notació científica).
    -   `delimiter`: Caràcter que separa les columnes (per defecte un espai).

-   `numpy.loadtxt(fname, dtype=float, delimiter=None)` carrega dades des d'un fitxer de text.

    -   `fname`: Nom del fitxer.
    -   `dtype`: Tipus de dades dels elements de l'array resultant.
    -   `delimiter`: Caràcter separador de columnes.

-   `numpy.genfromtxt(fname, dtype=float, delimiter=None, missing_values=None)` és una funció més robusta per carregar dades des de fitxers de text.

La principal avantatge de `genfromtxt()` respecte a `loadtxt()` és la seva capacitat per gestionar **dades que falten (missing data)**, permetent especificar com s'han de representar aquests valors (per defecte, es converteixen a NaN). També pot inferir el tipus de dades per a cada columna de manera independent.

## Resum de formats

| Format                      | Funció                                   | Ús                                            | Avantatges                                                                      | Inconvenients                                                                                 |
| :-------------------------- | :--------------------------------------- | :-------------------------------------------- | :------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------- |
| **Binari (.npy)**           | `save()`, `load()`                       | Desar un sol array                            | Ràpid, eficient en espai, preserva exactament el `dtype` i la forma de l'array. | No és llegible per humans, requereix NumPy per a la càrrega.                                  |
| **Binari comprimit (.npz)** | `savez()`, `savez_compressed()`          | Desar múltiples arrays                        | Ràpid, permet agrupar arrays, compressió disponible.                            | No és llegible per humans.                                                                    |
| **Text (.csv, .txt)**       | `savetxt()`, `loadtxt()`, `genfromtxt()` | Interoperabilitat amb altres eines/programes. | Llegible per humans, fàcil d'inspeccionar.                                      | Més lent, menys eficient en espai, la conversió de tipus de dades pot ser ambigua o inexacta. |

<Autors autors="jpetit"/>
