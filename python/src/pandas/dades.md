# Series i DataFrames

Aquesta lliçó presenta les estructures de dades fonamentals de Pandas, explicant què són les Series i els DataFrames i com crear-los, indexar-los i realitzar operacions bàsiques. També ofereix exemples de codi i detalla atributs, conversions entre Series i DataFrame i tècniques per manipular i analitzar dades tabulars.

## Series

Una **Series** és una estructura de dades unidimensional similar a un array o una llista, però amb etiquetes associades a cada element. És l'estructura bàsica de Pandas i pot contenir qualsevol tipus de dades.

Es pot crear una Series de diverses maneres:

```python
import pandas as pd

# A partir d'una llista
s1 = pd.Series([10, 20, 30, 40])

# A partir d'un diccionari
s2 = pd.Series({'a': 10, 'b': 20, 'c': 30})

# Especificant l'índex explícitament
s3 = pd.Series([10, 20, 30], index=['x', 'y', 'z'])

# Amb un valor constant
s4 = pd.Series(5, index=[0, 1, 2, 3])
```

Si no s'especifica un índex, Pandas assigna automàticament enters consecutius començant per 0.

L'índex d'una Series proporciona etiquetes que permeten accedir als elements de diverses formes:

```python
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])

# Accés per etiqueta
print(s['b'])  # 20

# Accés per posició
print(s[1])  # 20

# Accés múltiple
print(s[['a', 'c']])  # Series amb els elements 'a' i 'c'

# Slicing per etiquetes (inclusiu)
print(s['a':'c'])  # Elements de 'a' a 'c' inclosos

# Slicing per posicions (exclusiu)
print(s[0:2])  # Elements de posició 0 a 1
```

Les etiquetes permeten un accés més llegible i menys propens a errors que els índexs numèrics.

Les Series suporten operacions aritmètiques, estadístiques i de filtratge:

```python
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])

# Operacions aritmètiques (element a element)
print(s + 5)      # Suma 5 a cada element
print(s * 2)      # Multiplica cada element per 2
print(s ** 2)     # Eleva cada element al quadrat

# Operacions entre Series (alineació per índex)
s2 = pd.Series([1, 2, 3], index=['a', 'b', 'e'])
print(s + s2)     # Suma només on coincideixen les etiquetes

# Funcions estadístiques
print(s.sum())    # Suma de tots els elements
print(s.mean())   # Mitjana
print(s.max())    # Valor màxim
print(s.min())    # Valor mínim
print(s.std())    # Desviació estàndard

# Filtratge
print(s[s > 20])  # Elements majors que 20
```

## DataFrames

Un **DataFrame** és una estructura de dades bidimensional similar a una taula o full de càlcul, amb files i columnes etiquetades. És l'estructura més utilitzada en Pandas per treballar amb dades tabulars.

Els DataFrames es poden crear de diverses maneres:

```python
import pandas as pd

# A partir d'un diccionari de llistes
df1 = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla'],
    'edat': [25, 30, 22],
    'ciutat': ['Barcelona', 'Girona', 'Tarragona']
})

# A partir d'una llista de diccionaris
df2 = pd.DataFrame([
    {'nom': 'Anna', 'edat': 25},
    {'nom': 'Bernat', 'edat': 30},
    {'nom': 'Carla', 'edat': 22}
])

# A partir d'un array bidimensional
import numpy as np
df3 = pd.DataFrame(
    np.array([[1, 2], [3, 4], [5, 6]]),
    columns=['A', 'B'],
    index=['x', 'y', 'z']
)

# A partir d'un fitxer CSV
df4 = pd.read_csv('dades.csv')
```

Un DataFrame té tres components principals:

-   **Índex (index)**: etiquetes de les files
-   **Columnes (columns)**: etiquetes de les columnes
-   **Valors (values)**: dades en forma de matriu bidimensional

```python
df = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla'],
    'edat': [25, 30, 22]
}, index=['x', 'y', 'z'])

print(df.index)     # Index(['x', 'y', 'z'])
print(df.columns)   # Index(['nom', 'edat'])
print(df.values)    # Array numpy bidimensional
```

Els atributs més utilitzats proporcionen informació sobre l'estructura del DataFrame:

```python
df = pd.DataFrame({
    'A': [1, 2, 3],
    'B': [4.5, 5.5, 6.5],
    'C': ['x', 'y', 'z']
})

# Dimensions del DataFrame (files, columnes)
print(df.shape)  # (3, 3)

# Tipus de dades de cada columna
print(df.dtypes)
# A     int64
# B   float64
# C    object

# Noms de les columnes
print(df.columns)  # Index(['A', 'B', 'C'])

# Índex de les files
print(df.index)  # RangeIndex(start=0, stop=3, step=1)

# Nombre de files
print(len(df))  # 3

# Informació general
df.info()  # Resum amb tipus i memòria utilitzada
```

## Diferències i conversions entre Series i DataFrames

Les Series i els DataFrames estan relacionats però tenen diferències clau:

| Característica | Series               | DataFrame                  |
| -------------- | -------------------- | -------------------------- |
| Dimensions     | 1D                   | 2D                         |
| Estructura     | Vector etiquetat     | Taula amb files i columnes |
| Columnes       | No té                | Múltiples columnes         |
| Ús típic       | Dades d'una variable | Conjunt de dades complet   |

Es pot convertir fàcilment entre ambdues estructures:

```python
# Series a DataFrame
s = pd.Series([10, 20, 30], index=['a', 'b', 'c'], name='valors')
df = s.to_frame()  # DataFrame amb una columna
# o
df = pd.DataFrame(s)

# DataFrame a Series (seleccionant una columna)
df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
s = df['A']  # Retorna una Series

# DataFrame a Series (si només té una columna)
df_una_columna = pd.DataFrame({'A': [1, 2, 3]})
s = df_una_columna.squeeze()  # Converteix a Series
```

Cada columna d'un DataFrame és internament una Series, compartint moltes operacions i mètodes comuns.

<Autors autors="jpetit"/>
