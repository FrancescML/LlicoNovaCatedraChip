# Bones pràctiques i optimització

A mesura que les dades creixen en volum i complexitat, és fonamental adoptar bones pràctiques per escriure codi eficient i optimitzar l'ús de memòria. Aquesta lliçó presenta tècniques i consells per millorar el rendiment i la llegibilitat del codi amb Pandas.

## Method chaining

El _method chaining_ consisteix a encadenar múltiples operacions en una sola expressió, millorant la llegibilitat i reduint la necessitat de variables intermèdies.

```python
import pandas as pd

df = pd.DataFrame({
    'nom': ['Anna', 'Bernat', 'Carla', 'David', 'Elena'],
    'edat': [25, 30, 22, 35, 28],
    'ciutat': ['Barcelona', 'Madrid', 'Barcelona', 'Madrid', 'Barcelona'],
    'salari': [30000, 45000, 28000, 52000, 38000]
})

# Sense method chaining
df_temp = df[df['edat'] > 25]
df_temp = df_temp.sort_values('salari', ascending=False)
resultat = df_temp[['nom', 'salari']]

print(resultat)
```

Aquest codi utilitza variables intermèdies per a cada operació, ocupant més memòria i reduint la claredat del procés global.

```python
# Amb method chaining
resultat = (df[df['edat'] > 25]
            .sort_values('salari', ascending=False)
            .reset_index(drop=True)
            [['nom', 'salari']])

print(resultat)
```

L'encadenament permet veure totes les transformacions en un sol bloc, facilitant la comprensió del flux de dades. Els parèntesis permeten dividir l'expressió en múltiples línies per millorar la llegibilitat.

```python
# Method chaining amb assign()
resultat = (df
            .assign(salari_anual=lambda x: x['salari'] * 12)
            .assign(categoria=lambda x: pd.cut(x['edat'],
                                                bins=[0, 25, 30, 100],
                                                labels=['jove', 'mitjà', 'senior']))
            .groupby('categoria')['salari_anual']
            .mean())

print(resultat)
```

La funció `assign()` permet crear noves columnes dins de l'encadenament sense modificar el DataFrame original, mantenint l'estil funcional.

## Memòria i eficiència

### Consulta d'ús de memòria

```python
# Comprovar l'ús de memòria
print(df.memory_usage(deep=True))
print(f"Total: {df.memory_usage(deep=True).sum() / 1024**2:.2f} MB")
```

Aquest codi mostra quanta memòria ocupa cada columna i el total del DataFrame. El paràmetre `deep=True` inclou l'ús de memòria dels objectes com strings.

### Optimització de tipus de dades

```python
# Tipus originals
print(df.dtypes)
print(f"Memòria inicial: {df.memory_usage(deep=True).sum()} bytes")

# Optimitzar tipus numèrics
df_optimitzat = df.copy()
df_optimitzat['edat'] = df_optimitzat['edat'].astype('int8')
df_optimitzat['salari'] = df_optimitzat['salari'].astype('int32')

print(f"Memòria optimitzada: {df_optimitzat.memory_usage(deep=True).sum()} bytes")
```

Utilitzar tipus de dades més petits quan sigui possible redueix significativament l'ús de memòria. Per exemple, `int8` pot representar valors de -128 a 127, suficient per a edats.

```python
# Convertir strings a categories
df_optimitzat['ciutat'] = df_optimitzat['ciutat'].astype('category')
print(df_optimitzat['ciutat'].memory_usage(deep=True))
```

Les columnes amb valors repetits es beneficien de la conversió a tipus `category`, que emmagatzema internament codis numèrics en lloc de repetir strings.

### Càrrega selectiva de dades

```python
# Carregar només columnes necessàries
df_parcial = pd.read_csv('dades.csv', usecols=['nom', 'salari'])

# Especificar tipus de dades en la càrrega
df_tipus = pd.read_csv('dades.csv',
                        dtype={'edat': 'int8', 'ciutat': 'category'})
```

Carregar només les columnes necessàries i especificar els tipus de dades des del principi estalvia memòria i temps de processament.

## Evitar bucles: pensament vectorial

Les operacions vectoritzades de Pandas són ordres de magnitud més ràpides que els bucles de Python.

```python
import numpy as np

# Creació de dades de prova
df_gran = pd.DataFrame({
    'valor': np.random.randint(1, 100, 10000)
})

# Forma ineficient: bucle
import time

inici = time.time()
resultats = []
for valor in df_gran['valor']:
    if valor > 50:
        resultats.append(valor * 2)
    else:
        resultats.append(valor)
df_gran['resultat_bucle'] = resultats
print(f"Temps amb bucle: {time.time() - inici:.4f} segons")
```

Els bucles de Python són lents perquè processen cada element individualment i no aprofiten les optimitzacions de les operacions vectoritzades.

```python
# Forma eficient: operacions vectoritzades
inici = time.time()
df_gran['resultat_vectoritzat'] = np.where(df_gran['valor'] > 50,
                                             df_gran['valor'] * 2,
                                             df_gran['valor'])
print(f"Temps vectoritzat: {time.time() - inici:.4f} segons")
```

La funció `np.where()` aplica la condició a tot el vector simultàniament, aprofitant operacions optimitzades en C.

```python
# Múltiples condicions amb np.select()
condicions = [
    df_gran['valor'] < 30,
    df_gran['valor'] < 70,
    df_gran['valor'] >= 70
]
opcions = [
    df_gran['valor'] * 0.5,
    df_gran['valor'] * 1.5,
    df_gran['valor'] * 2
]
df_gran['resultat_complex'] = np.select(condicions, opcions)
```

Per a condicions més complexes, `np.select()` permet definir múltiples casos i els seus resultats corresponents de manera vectoritzada.

```python
# Aplicar funcions amb apply() només quan calgui
# Menys eficient que operacions vectoritzades però millor que bucles
df_gran['resultat_apply'] = df_gran['valor'].apply(lambda x: x**2 if x % 2 == 0 else x**3)
```

La funció `apply()` és un compromís quan no existeix una operació vectoritzada directa, però segueix sent més lenta que les operacions natives de Pandas.

## Consells per a grans volums de dades

### Processament per blocs

```python
# Llegir fitxer gran en fragments
chunks = []
for chunk in pd.read_csv('fitxer_gran.csv', chunksize=10000):
    # Processar cada fragment
    chunk_processat = chunk[chunk['valor'] > 100]
    chunks.append(chunk_processat)

df_final = pd.concat(chunks, ignore_index=True)
```

Processar dades en fragments evita carregar tot el conjunt a memòria, permetent treballar amb fitxers més grans que la RAM disponible.

### Utilitzar índexs adequats

```python
# Establir índex per a consultes freqüents
df_indexat = df.set_index('nom')

# Consulta ràpida per índex
resultat = df_indexat.loc['Anna']
```

Els índexs acceleren les operacions de cerca i combinació de dades, especialment en DataFrames grans.

### Evitar còpies innecessàries

```python
# Ineficient: crea còpies
df_copia = df.copy()
df_copia['nova_columna'] = df_copia['salari'] * 1.1

# Més eficient: modificació directa amb inplace (quan és possible)
df['nova_columna'] = df['salari'] * 1.1

# Utilitzar vistes en lloc de còpies quan sigui possible
vista = df[['nom', 'salari']]  # És una vista, no una còpia
```

Les còpies de DataFrames grans consumeixen molta memòria. És preferible modificar directament o utilitzar vistes quan no calgui preservar l'original.

### Query i eval per a expressions complexes

```python
# Utilitzar query() per a filtres complexos
resultat = df.query('edat > 25 and salari > 35000')

# Utilitzar eval() per a expressions numèriques
df['bonus'] = df.eval('salari * 0.1 + edat * 100')
```

Les funcions `query()` i `eval()` utilitzen motors d'avaluació optimitzats que són més ràpids i eficients en memòria que les operacions tradicionals, especialment amb DataFrames grans.

### Considerar formats alternatius

```python
# Guardar en Parquet (més eficient que CSV)
df.to_parquet('dades.parquet', compression='gzip')

# Carregar des de Parquet
df_carregat = pd.read_parquet('dades.parquet')
```

El format Parquet és columnar i comprimit, oferint millor rendiment de lectura/escriptura i menor ús d'espai que CSV, especialment per a grans volums de dades.

<Autors autors="jpetit"/>
