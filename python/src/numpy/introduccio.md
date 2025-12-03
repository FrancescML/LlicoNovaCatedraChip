# Introducció a NumPy

<img src='./numpy.svg' style='height: 8em; float: right; margin: 2em 0em 0em 2em;'/>

NumPy (Numerical Python) és una biblioteca fonamental per a la computació científica en Python. El gran avantatge de NumPy és que permet realitzar operacions matemàtiques sobre arrays multidimensionals de manera extremadament ràpida gràcies a la seva implementació en C i l'eliminació de bucles explícits.

NumPy és essencial per a qualsevol programador que treballi amb dades numèriques, ja que ofereix:

-   Estructures de dades eficients per emmagatzemar i manipular dades numèriques.
-   Funcions matemàtiques optimitzades per a operacions vectorials.
-   Eines per a àlgebra lineal, transformades de Fourier i generació de números aleatoris.
-   Interoperabilitat amb altres biblioteques científiques com Pandas, SciPy, Matplotlib i scikit-learn.

NumPy s'utilitza àmpliament en camps com l'aprenentatge automàtic, la ciència de dades, el processament de senyals i la simulació científica. Aquesta llicó introdueix els conceptes bàsics de NumPy.

## Instal·lació i importació

Per instal·lar NumPy, utilitzem el gestor de paquets pip:

```bash
python3 -m pip install numpy
```

Una vegada instal·lat, podem importar NumPy en els nostres programes. La convenció estàndard és importar-lo amb l'àlies `np`:

```python
>>> import numpy as np
>>> np.__version__
'2.3.5'
```

## Diferències entre llistes de Python i arrays de NumPy

Tot i que les llistes de Python són molt versàtils, els arrays de NumPy ofereixen avantatges significatius per a operacions numèriques. Un **array** de NumPy és una estructura de dades multidimensional que emmagatzema elements del mateix tipus de manera eficient.

**Tipus de dades homogenis:** En general, les llistes de Python poden contenir elements de diferents tipus, mentre que els arrays de NumPy emmagatzemen sempre elements del mateix tipus:

```python
# Llista de Python: tipus heterogenis
llista_python = [1, 2.5, "text", True]

# Array de NumPy: tipus homogeni
array_numpy = np.array([1, 2, 3, 4])
print(array_numpy.dtype)  # dtype('int64')
```

**Operacions element a element:**
Les operacions amb llistes de Python requereixen bucles explícits, mentre que NumPy permet operacions vectoritzades:

```python
# Llistes de Python
llista1 = [1, 2, 3, 4]
llista2 = [5, 6, 7, 8]
resultat_llista = [llista1[i] + llista2[i] for i in range(len(llista1))]

# Arrays de NumPy
array1 = np.array([1, 2, 3, 4])
array2 = np.array([5, 6, 7, 8])
resultat_array = array1 + array2
print(resultat_array)  # [6 8 10 12]
```

**Dimensions i forma:** Els arrays de NumPy tenen propietats com `shape` i `ndim` que faciliten el treball amb dades multidimensionals:

```python
matriu = np.array([[1, 2, 3], [4, 5, 6]])
print(matriu.shape)  # (2, 3)
print(matriu.ndim)   # 2
```

## Avantatges de rendiment

La vectorització és una de les característiques més poderoses de NumPy. Permet aplicar operacions a arrays sencers sense necessitat de bucles explícits, cosa que resulta en un codi més net i significativament més ràpid.

Vegem un exemple que compara el temps d'execució entre llistes de Python i arrays de NumPy:

```python
import numpy as np
import time

# Crear dades
mida = 10_000_000
llista1 = list(range(mida))
llista2 = list(range(mida))
array1 = np.arange(mida)        # com range però retorna un array de NumPy
array2 = np.arange(mida)

# Suma amb llistes
inici = time.time()
resultat_llista = [llista1[i] + llista2[i] for i in range(mida)]
temps_llista = time.time() - inici

# Suma amb NumPy
inici = time.time()
resultat_array = array1 + array2
temps_numpy = time.time() - inici

print(f"Temps llistes: {temps_llista:.4f} segons")
print(f"Temps NumPy:   {temps_numpy:.4f} segons")
print(f"NumPy és {temps_llista/temps_numpy:.1f}x més ràpid")
```

Al meu ordinador, l'execució d'aquest codi produeix resultats similars a aquests:

```text
Temps llistes: 0.3046 segons
Temps NumPy:   0.0077 segons
NumPy és 39.4x més ràpid
```

Un increment de rendiment de 40 vegades és prou impressionant!

NumPy aconsegueix aquest rendiment superior gràcies a diversos factors:

-   Les operacions estan implementades en C enlloc de Python, cosa que redueix la sobrecàrrega d'execució.
-   Utilitza vectorització per aprofitar instruccions SIMD del processador.
-   Emmagatzema les dades de manera contigua en memòria.
-   Evita la sobrecàrrega dels bucles de Python.

Per extreure rendiment màxim, és important aprofitar les operacions vectoritzades i evitar bucles explícits sempre que sigui possible.

## Operacions vectoritzades

NumPy permet escriure operacions matemàtiques complexes de manera elegant i compacta utilitzant **operacions vectoritzades**:

```python
# Operacions aritmètiques
x = np.array([1, 2, 3, 4, 5])
print(x * 2)          # [2 4 6 8 10]
print(x ** 2)         # [1 4 9 16 25]
print(np.sqrt(x))     # [1. 1.41421356 1.73205081 2. 2.23606798]

# Operacions condicionals
temperatures = np.array([15, 22, 18, 30, 25])
dies_calorosos = temperatures > 20
print(dies_calorosos)  # [False True False True True]
```

Com veiem, les operacions vectoritzades permeten aplicar funcions i operacions a tot l'array d'una sola vegada, fent el codi més llegible i eficient.

## Broadcasting

NumPy també implementa _broadcasting_, una característica que permet operar amb arrays de diferents formes:

```python
# Suma d'un escalar a un array
array = np.array([1, 2, 3, 4])
print(array + 10)  # [11 12 13 14]

# Operació entre arrays de diferents dimensions
matriu = np.array([[1, 2, 3], [4, 5, 6]])
vector = np.array([10, 20, 30])
print(matriu + vector)
# [[11 22 33]
#  [14 25 36]]
```

La combinació de vectorització, operacions optimitzades i broadcasting fa que NumPy sigui imprescindible per a qualsevol treball amb dades numèriques en Python.

Les següents llicons aprofundeixen en les funcionalitats de NumPy, incloent la creació i manipulació d'arrays, operacions avançades, àlgebra lineal i molt més.

<Autors autors="jpetit"/>
