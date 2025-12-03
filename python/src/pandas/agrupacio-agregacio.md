# Agrupació i agregació

Aquesta lliçó explica com agrupar i agregar dades en DataFrames de Pandas. Cobreix l'ús de l'operació `groupby()`, funcions d'agregació estàndard i personalitzades, així com tècniques per transformar i filtrar grups de dades.

## Conceptes bàsics de groupby

L'operació `groupby()` permet dividir un DataFrame en grups segons els valors d'una o més columnes, aplicar una funció a cada grup i combinar els resultats.

```python
import pandas as pd

df = pd.DataFrame({
    'ciutat': ['Barcelona', 'Madrid', 'Barcelona', 'Madrid', 'Barcelona'],
    'producte': ['A', 'A', 'B', 'B', 'A'],
    'vendes': [100, 150, 200, 180, 120],
    'quantitat': [10, 15, 20, 18, 12]
})

# Agrupar per ciutat
grups = df.groupby('ciutat')
print(grups.size())
```

Aquest codi agrupa les files per ciutat i mostra quantes files hi ha a cada grup. El resultat és una Series amb l'índex format pels valors únics de la columna `ciutat`.

```python
# Agrupar per múltiples columnes
grups = df.groupby(['ciutat', 'producte'])
print(grups.size())
```

Es poden utilitzar múltiples columnes per crear grups més específics. En aquest cas, es crea un grup per cada combinació única de ciutat i producte.

## Funcions d'agregació

### Agregacions estàndard

Les funcions d'agregació combinen múltiples valors d'un grup en un únic valor.

```python
# Suma de vendes per ciutat
print(df.groupby('ciutat')['vendes'].sum())

# Mitjana de vendes per ciutat
print(df.groupby('ciutat')['vendes'].mean())

# Recompte de files per ciutat
print(df.groupby('ciutat')['vendes'].count())

# Mínim i màxim
print(df.groupby('ciutat')['vendes'].min())
print(df.groupby('ciutat')['vendes'].max())
```

Cada funció retorna una Series amb l'índex format pels grups i els valors agregats corresponents.

```python
# Aplicar agregació a múltiples columnes
print(df.groupby('ciutat')[['vendes', 'quantitat']].sum())
```

Es pot especificar una llista de columnes per aplicar l'agregació a totes elles simultàniament, obtenint un DataFrame com a resultat.

### Agregacions personalitzades

```python
# Funció personalitzada: rang (màxim - mínim)
def rang(x):
    return x.max() - x.min()

print(df.groupby('ciutat')['vendes'].agg(rang))
```

La funció `agg()` permet utilitzar funcions personalitzades. La funció rep una Series amb els valors del grup i retorna un valor únic.

```python
# Utilitzar funcions lambda
print(df.groupby('ciutat')['vendes'].agg(lambda x: x.max() - x.min()))
```

Les funcions lambda ofereixen una manera concisa de definir funcions personalitzades directament dins de `agg()`.

## Múltiples agregacions amb agg()

```python
# Aplicar múltiples funcions a una columna
print(df.groupby('ciutat')['vendes'].agg(['sum', 'mean', 'count']))
```

Aquest codi aplica tres funcions diferents a la columna `vendes` de cada grup, retornant un DataFrame amb una columna per cada funció.

```python
# Diferents funcions per a diferents columnes
agregacions = {
    'vendes': ['sum', 'mean'],
    'quantitat': ['sum', 'max']
}
print(df.groupby('ciutat').agg(agregacions))
```

Es pot especificar un diccionari per aplicar diferents conjunts de funcions a diferents columnes, creant un DataFrame amb columnes multinivell.

```python
# Renombrar les columnes resultants
print(df.groupby('ciutat').agg(
    vendes_total=('vendes', 'sum'),
    vendes_mitjana=('vendes', 'mean'),
    quantitat_total=('quantitat', 'sum')
))
```

Aquesta sintaxi permet assignar noms personalitzats a les columnes resultants, millorant la llegibilitat.

## Transformacions amb transform()

La funció `transform()` retorna un objecte amb la mateixa forma que l'original, repetint el valor agregat per a cada fila del grup.

```python
# Afegir la mitjana del grup a cada fila
df['vendes_mitjana_ciutat'] = df.groupby('ciutat')['vendes'].transform('mean')
print(df)
```

Aquest codi crea una nova columna amb la mitjana de vendes de la ciutat corresponent a cada fila, mantenint la longitud original del DataFrame.

```python
# Normalitzar valors respecte al grup
df['vendes_normalitzades'] = df.groupby('ciutat')['vendes'].transform(
    lambda x: (x - x.mean()) / x.std()
)
print(df)
```

Les transformacions personalitzades permeten operacions com la normalització dins de cada grup, útil per comparar valors dins del mateix context.

```python
# Calcular percentatge sobre el total del grup
df['percentatge_ciutat'] = df.groupby('ciutat')['vendes'].transform(
    lambda x: x / x.sum() * 100
)
print(df)
```

Aquest exemple calcula el percentatge que representa cada venda sobre el total de la seva ciutat.

## Filtratge de grups

La funció `filter()` permet seleccionar grups complets segons una condició.

```python
# Mantenir només grups amb més de 2 files
df_filtrat = df.groupby('ciutat').filter(lambda x: len(x) > 2)
print(df_filtrat)
```

Aquest codi elimina tots els grups que tenen 2 o menys files, retornant un DataFrame amb només els grups que compleixen la condició.

```python
# Mantenir grups on la suma de vendes supera un llindar
df_filtrat = df.groupby('ciutat').filter(lambda x: x['vendes'].sum() > 300)
print(df_filtrat)
```

Es poden utilitzar condicions basades en agregacions per filtrar grups. En aquest cas, es mantenen només les ciutats amb vendes totals superiors a 300.

```python
# Condicions més complexes
df_filtrat = df.groupby('ciutat').filter(
    lambda x: x['vendes'].mean() > 100 and len(x) >= 2
)
print(df_filtrat)
```

Es poden combinar múltiples condicions per crear filtres més sofisticats que avaluïn diferents aspectes de cada grup.

<Autors autors="jpetit"/>
