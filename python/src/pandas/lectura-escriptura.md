# Lectura i escriptura de dades amb Pandas

Aquesta lliçó explica com llegir i escriure dades en diferents formats utilitzant la biblioteca Pandas de Python. Pandas proporciona funcions senzilles per carregar dades des de fitxers CSV, Excel, JSON i bases de dades SQL, així com per exportar dades a aquests formats.

Recordeu que per utilitzar Pandas cal importar-la habitualment amb l'alias `pd`:

```python
import pandas as pd
```

## Lectura de fitxers

Pandas proporciona funcions per carregar dades des de diversos formats. Totes retornen un DataFrame.

### CSV

La funció `read_csv` llegeix fitxers de valors separats per comes:

```python
df = pd.read_csv('dades.csv')
```

Alguns paràmetres útils:

-   `sep`: caràcter separador (per defecte `,`)
-   `header`: número de fila amb els noms de les columnes (per defecte `0`)
-   `index_col`: columna a utilitzar com a índex
-   `usecols`: llista de columnes a llegir
-   `dtype`: diccionari amb els tipus de dades de les columnes
-   `na_values`: valors a interpretar com a NaN

```python
df = pd.read_csv('dades.csv', sep=';', index_col=0, usecols=['nom', 'edat'])
```

### Excel

La funció `read_excel` llegeix fitxers d'Excel:

```python
df = pd.read_excel('dades.xlsx')
```

Paràmetres rellevants:

-   `sheet_name`: nom o índex del full a llegir (per defecte el primer)
-   `header`, `index_col`, `usecols`: igual que en CSV

```python
df = pd.read_excel('dades.xlsx', sheet_name='Fulls1')
```

### JSON

La funció `read_json` llegeix fitxers JSON:

```python
df = pd.read_json('dades.json')
```

El paràmetre `orient` especifica l'estructura del JSON:

-   `'split'`: diccionari amb claus `index`, `columns` i `data`
-   `'records'`: llista de diccionaris (un per fila)
-   `'index'`: diccionari de diccionaris indexat per files
-   `'columns'`: diccionari de diccionaris indexat per columnes
-   `'values'`: només els valors com a array 2D

```python
df = pd.read_json('dades.json', orient='records')
```

### SQL

La funció `read_sql` llegeix dades d'una base de dades SQL (sqlite3 per exemple):

```python
import sqlite3

conn = sqlite3.connect('basedades.db')
df = pd.read_sql('SELECT * FROM taula', conn)
conn.close()
```

Es pot passar una consulta SQL o el nom d'una taula. Cal una connexió prèvia a la base de dades.

## Escriptura de fitxers

Els DataFrames es poden exportar a diferents formats mitjançant mètodes específics.

### Exportació a CSV

El mètode `to_csv` escriu un DataFrame en format CSV:

```python
df.to_csv('sortida.csv')
```

Paràmetres comuns:

-   `sep`: caràcter separador
-   `index`: si s'ha d'incloure l'índex (per defecte `True`)
-   `header`: si s'han d'incloure els noms de les columnes (per defecte `True`)
-   `columns`: llista de columnes a exportar
-   `na_rep`: cadena per representar valors NaN

```python
df.to_csv('sortida.csv', sep=';', index=False)
```

### Exportació a Excel

El mètode `to_excel` escriu un DataFrame en format Excel:

```python
df.to_excel('sortida.xlsx')
```

Paràmetres rellevants:

-   `sheet_name`: nom del full (per defecte `'Sheet1'`)
-   `index`: si s'ha d'incloure l'índex
-   `columns`: llista de columnes a exportar

```python
df.to_excel('sortida.xlsx', sheet_name='Resultats', index=False)
```

### Exportació a JSON

El mètode `to_json` escriu un DataFrame en format JSON:

```python
df.to_json('sortida.json')
```

El paràmetre `orient` controla l'estructura (igual que en `read_json`):

```python
df.to_json('sortida.json', orient='records', indent=2)
```

El paràmetre `indent` afegeix indentació per millorar la llegibilitat.

### Consideracions generals

Tots els mètodes d'exportació accepten el paràmetre `index` per controlar si s'escriu l'índex del DataFrame (l'índex és l'etiqueta que identifica cada fila del DataFrame i permet accedir-hi directament). Per defecte és `True`, però sovint és convenient desactivar-lo amb `index=False`.

```python
df.to_csv('dades.csv', index=False)
df.to_excel('dades.xlsx', index=False)
df.to_json('dades.json', orient='records')
```

<Autors autors="jpetit"/>
