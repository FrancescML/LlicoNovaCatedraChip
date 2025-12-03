# Bones pràctiques i optimització

Tot i la seva facilitat d'ús de NumPy, és important conèixer certes bones pràctiques per aprofitar al màxim el seu rendiment i escriure codi eficient i llegible.

## Vectorització: la clau del rendiment

La vectorització consisteix a aplicar operacions sobre arrays sencers en lloc d'utilitzar bucles explícits. Aquesta és la diferència principal entre codi ràpid i codi lent amb NumPy.

```python
import numpy as np

# Malament: ús de bucles
a = np.arange(1000000)
result = np.zeros(1000000)
for i in range(len(a)):
    result[i] = a[i] ** 2

# Bé: vectorització
result = a ** 2
```

La versió vectoritzada és desenes de vegades més ràpida perquè les operacions s'executen en codi C optimitzat en lloc d'interpretar Python per a cada iteració.

## Evitar còpies innecessàries

NumPy permet treballar amb vistes dels arrays originals, cosa que estalvia memòria i temps de còpia.

```python
# Creació d'una vista (no còpia)
a = np.arange(10)
b = a[2:7]  # b és una vista de a
b[0] = 999  # modifica també a

# Còpia explícita quan cal
c = a[2:7].copy()
c[0] = 111  # no modifica a
```

És important saber quan s'està treballant amb vistes per evitar modificacions no desitjades de l'array original.

## Ús correcte de broadcasting

El broadcasting permet operar amb arrays de diferents dimensions sense necessitat de replicar dades explícitament.

```python
# Broadcasting automàtic
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])
vector = np.array([10, 20, 30])

# Suma per columnes sense bucles
result = matrix + vector  # vector s'aplica a cada fila
```

El broadcasting estalvia memòria i millora el rendiment perquè no cal crear còpies temporals de les dades.

## Selecció del tipus de dades adequat

Utilitzar el tipus de dades mínim necessari redueix l'ús de memòria i pot accelerar les operacions.

```python
# Per defecte: float64 i int64 (8 bytes)
a = np.array([1, 2, 3])  # int64

# Optimització: utilitzar tipus més petits quan sigui possible
b = np.array([1, 2, 3], dtype=np.int8)  # 1 byte
c = np.linspace(0, 1, 100, dtype=np.float32)  # 4 bytes
```

Això és especialment rellevant quan es treballa amb grans volums de dades.

## Preal·locació d'arrays

Quan es coneix la mida final d'un array, és millor preal·locar-lo que anar afegint elements.

```python
# Malament: anar afegint elements
result = np.array([])
for i in range(1000):
    result = np.append(result, i ** 2)  # molt ineficient

# Bé: preal·locació
result = np.empty(1000)
for i in range(1000):
    result[i] = i ** 2

# Millor: vectorització completa
result = np.arange(1000) ** 2
```

Cada crida a `np.append` crea una nova còpia de l'array, cosa que resulta en un rendiment quadràtic.

## Funcions universals (ufuncs)

Les funcions universals de NumPy estan optimitzades i són preferibles a les funcions equivalents de Python.

```python
import math

a = np.random.rand(1000000)

# Lent: funció de Python
result = np.array([math.sqrt(x) for x in a])

# Ràpid: ufunc de NumPy
result = np.sqrt(a)
```

Les ufuncs també suporten operacions element a element de manera transparent.

## Operacions _in-situ_

Quan no cal preservar l'array original, les operacions _in-situ_ estalvien memòria.

```python
a = np.random.rand(1000000)

# Crea un nou array
b = a * 2

# Operació *in-situ* (modifica a directament)
a *= 2
```

Les operacions _in-situ_ són especialment útils amb arrays grans.

## Ús de funcions agregades amb axis

Les funcions agregades permeten especificar l'eix sobre el qual operar, evitant bucles manuals.

```python
matrix = np.random.rand(1000, 1000)

# Suma per columnes
col_sums = np.sum(matrix, axis=0)

# Suma per files
row_sums = np.sum(matrix, axis=1)

# Mitjana global
mean = np.mean(matrix)
```

L'ús correcte del paràmetre `axis` fa el codi més clar i eficient.

## Càlcul amb màscares booleanes

Les màscares booleanes permeten seleccionar i operar sobre subconjunts d'arrays de manera eficient.

```python
a = np.array([1, -2, 3, -4, 5, -6])

# Selecció amb màscara
positives = a[a > 0]

# Modificació condicional
a[a < 0] = 0  # estableix els negatius a zero

# Comptatge d'elements
num_positives = np.sum(a > 0)
```

Això és molt més eficient que iterar amb bucles i condicionals.

## Mesura del rendiment

És important mesurar el rendiment per identificar colls d'ampolla.

```python
import time

a = np.random.rand(10000000)

inici = time.time()
resultat = np.sqrt(a)
final = time.time()
print(f"Temps: {final - inici:.4f} segons")
```

La mesura sistemàtica del temps d'execució ajuda a validar les optimitzacions.

## Consideracions finals

Aquestes són algunes recomanacions generals per escriure codi amb NumPy:

-   Prioritzar la vectorització sobre els bucles explícits
-   Conèixer la diferència entre vistes i còpies
-   Utilitzar tipus de dades adequats a les necessitats
-   Aprofitar el broadcasting per simplificar el codi
-   Preal·locar arrays quan sigui possible
-   Utilitzar funcions universals de NumPy

Seguir aquestes pràctiques permet escriure codi NumPy que és alhora eficient i mantenible.

<Autors autors="jpetit"/>
