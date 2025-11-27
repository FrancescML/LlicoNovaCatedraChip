# Manipulació de dades

Aquesta lliçó explica com modificar i transformar dades en DataFrames de Pandas. Cobreix operacions com afegir i eliminar columnes i files, modificar valors, reordenar dades i altres tècniques per manipular informació tabular.

## Afegir i eliminar columnes

Es poden afegir columnes noves assignant valors directament o eliminant-les amb `drop()`.

```python
df = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla'],
    'edat': [25, 30, 22]
})

# Afegir una columna nova
df['ciutat'] = ['Barcelona', 'Girona', 'Lleida']

# Afegir una columna calculada
df['edat_duplicada'] = df['edat'] * 2

# Eliminar una columna
df = df.drop('edat_duplicada', axis=1)

# Eliminar múltiples columnes
df = df.drop(['ciutat'], axis=1)
```

L'assignació directa crea noves columnes. El mètode `drop()` amb `axis=1` elimina columnes. Per defecte, `drop()` retorna una còpia i cal reassignar el resultat o utilitzar `inplace=True`.

## Afegir i eliminar files

Les files es poden afegir amb `concat()` o `loc`, i eliminar amb `drop()`.

```python
# Afegir una fila amb loc
df.loc[3] = ['David', 35]

# Afegir múltiples files amb concat
noves_files = pd.DataFrame({
    'nom': ['Eva', 'Francesc'],
    'edat': [28, 33]
})
df = pd.concat([df, noves_files], ignore_index=True)

# Eliminar una fila per índex
df = df.drop(0)

# Eliminar múltiples files
df = df.drop([1, 2])
```

El mètode `concat()` uneix DataFrames verticalment. L'argument `ignore_index=True` reinicia la numeració de l'índex.

## Modificació de valors

Els valors es poden modificar utilitzant indexació o mètodes específics.

```python
# Modificar un valor específic amb loc
df.loc[3, 'edat'] = 36

# Modificar múltiples valors
df.loc[df['nom'] == 'Eva', 'edat'] = 29

# Modificar amb at (més ràpid per valors únics)
df.at[3, 'nom'] = 'Daniel'

# Reemplaçar valors amb replace
df['nom'] = df['nom'].replace('Daniel', 'David')
```

Els mètodes `loc` i `at` permeten assignar nous valors. El mètode `replace()` substitueix valors específics a tota la columna.

## Reanomenament de columnes i índexs

El mètode `rename()` permet canviar noms de columnes i índexs.

```python
# Reanomenar columnes
df = df.rename(columns={'nom': 'nombre', 'edat': 'edad'})

# Reanomenar índexs
df = df.rename(index={3: 'tres', 4: 'quatre'})

# Reanomenar múltiples elements
df = df.rename(columns={'nombre': 'nom'}, index={'tres': 3})
```

El paràmetre `columns` accepta un diccionari que mapeja noms antics a noms nous. El mateix per a `index`.

## Reordenació de columnes i files

Les columnes i files es poden reordenar modificant l'ordre o ordenant els valors.

```python
df = pd.DataFrame({
    'edat': [25, 30, 22],
    'nom': ['Anna', 'Bernat', 'Carla'],
    'ciutat': ['Barcelona', 'Girona', 'Lleida']
})

# Reordenar columnes manualment
df = df[['nom', 'edat', 'ciutat']]

# Ordenar files per una columna
df = df.sort_values('edat')

# Ordenar de forma descendent
df = df.sort_values('edat', ascending=False)

# Ordenar per múltiples columnes
df = df.sort_values(['ciutat', 'edat'])

# Ordenar per índex
df = df.sort_index()
```

El mètode `sort_values()` ordena files segons els valors d'una o més columnes. El mètode `sort_index()` ordena per l'índex de files.

<Autors autors="jpetit"/>
