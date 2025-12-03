# Exploració de dades

Aquesta lliçó explica com explorar i inspeccionar dades en un DataFrame de Pandas. S'hi presenten mètodes per obtenir informació estructural, estadístiques descriptives i tècniques per seleccionar i filtrar dades.

## Mètodes d'inspecció bàsica

Els mètodes `head()`, `tail()` i `sample()` permeten visualitzar subconjunts de dades d'un DataFrame.

```python
import pandas as pd

df = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla', 'David', 'Eva'],
    'edat': [25, 30, 22, 35, 28],
    'ciutat': ['Barcelona', 'Girona', 'Lleida', 'Tarragona', 'Barcelona']
})

print(df.head(3))   # Mostra les primeres files (per defecte 5)
print(df.tail(2))   # Mostra les últimes files
print(df.sample(2)) # Mostra files aleatòries
```

El mètode `head()` retorna les primeres n files, `tail()` les últimes i `sample()` una mostra aleatòria. Són útils per fer una inspecció ràpida del contingut.

Els mètodes `info()` i `describe()` proporcionen resums del DataFrame.

```python
df.info()               # Informació sobre l'estructura del DataFrame
print(df.describe())    # Estadístiques descriptives de les columnes numèriques
```

El mètode `info()` mostra el nombre de files, columnes, tipus de dades i memòria utilitzada. El mètode `describe()` calcula estadístiques com la mitjana, desviació estàndard, mínim i màxim per a columnes numèriques.

## Accés a informació estructural

Les dimensions i forma d'un DataFrame es poden consultar amb els atributs `shape`, `size`, `ndim` i `columns`.

```python
print(df.shape)              # Dimensions (files, columnes)
print(df.size)               # Nombre total d'elements
print(df.ndim)               # Nombre de dimensions
print(df.columns)            # Noms de les columnes
print(df.index)              # Índex de files
```

L'atribut `shape` retorna una tupla amb el nombre de files i columnes. L'atribut `size` indica el nombre total d'elements i `ndim` sempre és 2 per a DataFrames.

Els tipus de dades de cada columna es poden consultar amb `dtypes`.

```python
print(df.dtypes)              # Tipus de dades de cada columna
print(df['edat'].dtype)       # Tipus de dades d'una columna específica
```

Els tipus més comuns són `int64`, `float64`, `object` (per a text) i `bool`.

Per obtenir valors únics i recomptes s'utilitzen els mètodes `unique()`, `nunique()` i `value_counts()`.

```python
print(df['ciutat'].unique())      # Valors únics d'una columna
print(df['ciutat'].nunique())     # Nombre de valors únics
print(df['ciutat'].value_counts())# Recompte de cada valor únic
```

El mètode `unique()` retorna un array amb els valors sense repetir, `nunique()` el nombre de valors diferents i `value_counts()` compta les aparicions de cada valor.

## Estadístiques descriptives ràpides

Pandas ofereix mètodes per calcular estadístiques bàsiques de manera directa.

```python
print(df['edat'].mean())        # Mitjana de les edats
print(df['edat'].median())      # Mediana
print(df['edat'].std())         # Desviació estàndard
print(df['edat'].min())         # Mínim
print(df['edat'].max())         # Màxim
print(df['edat'].sum())         # Suma total
```

Aquests mètodes s'apliquen sobre columnes numèriques i retornen un valor escalar amb el resultat del càlcul estadístic.

## Selecció de dades

L'operador `[]` permet seleccionar columnes o files d'un DataFrame.

```python
df = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla'],
    'edat': [25, 30, 22],
    'ciutat': ['Barcelona', 'Girona', 'Lleida']
})

print(df['nom'])            # Seleccionar una columna (retorna una Series)
print(df[['nom', 'edat']])  # Seleccionar múltiples columnes
print(df[0:2])              # Seleccionar files per posició amb slicing
```

Amb una sola etiqueta entre `[]` es selecciona una columna. Amb una llista d'etiquetes es seleccionen múltiples columnes. Amb slicing es seleccionen files per posició.

## Selecció amb loc

L'indexador `loc` selecciona dades utilitzant etiquetes de files i columnes.

```python
print(df.loc[0])                 # Seleccionar una fila per etiqueta
print(df.loc[0:1, 'nom':'edat']) # Seleccionar files i columnes específiques
print(df.loc[[0, 2]])            # Seleccionar files amb una llista d'índexs
print(df.loc[:, 'ciutat'])       # Seleccionar totes les files d'una columna
```

L'operador `loc` utilitza `[files, columnes]`. Els rangs amb `:` inclouen el valor final, a diferència del slicing habitual de Python.

## Selecció amb loc

De forma similar, l'indexador `iloc` selecciona dades utilitzant posicions enteres.

```python
print(df.iloc[0])               # Seleccionar una fila per posició
print(df.iloc[0:2, 0:2])        # Seleccionar files i columnes per posició
print(df.iloc[[0, 2], [0, 2]])  # Seleccionar files i columnes amb llistes
print(df.iloc[:, 1])            # Seleccionar totes les files d'una columna
```

Els rangs no inclouen el valor final!

## Filtratge amb condicions booleanes

Les condicions booleanes permeten filtrar files que compleixen certs criteris.

```python
# Filtrar files on l'edat és major de 24
print(df[df['edat'] > 24])

# Múltiples condicions amb & (and) i | (or)
print(df[(df['edat'] > 24) & (df['ciutat'] == 'Barcelona')])

# Condició de pertinença
print(df[df['ciutat'].isin(['Barcelona', 'Girona'])])

# Negació amb ~
print(df[~(df['edat'] > 24)])
```

Les condicions retornen una Series booleana que s'utilitza per filtrar el DataFrame. Cal utilitzar parèntesis amb operadors lògics `&`, `|` i `~`.

## Query i seleccions avançades

El mètode `query()` permet filtrar amb expressions més llegibles.

```python
# Filtratge amb query
print(df.query('edat > 24'))

# Múltiples condicions
print(df.query('edat > 24 and ciutat == "Barcelona"'))

# Utilitzar variables externes amb @
llindar = 24
print(df.query('edat > @llindar'))
```

El mètode `query()` accepta expressions en format text i és especialment útil per a condicions complexes.

## Selecció de múltiples columnes i files

Pandas ofereix diverses maneres de seleccionar subconjunts de dades.

```python
# Seleccionar columnes amb select_dtypes
print(df.select_dtypes(include=['int64']))

# Filtrar columnes per nom amb filter
print(df.filter(items=['nom', 'edat']))

# Filtrar columnes per patró
df_extended = df.copy()
df_extended['edat_anys'] = df_extended['edat']
print(df_extended.filter(like='edat'))
```

El mètode `select_dtypes()` filtra columnes per tipus de dades, `filter()` per noms exactes o patrons.

<Autors autors="jpetit"/>
