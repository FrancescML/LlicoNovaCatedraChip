# Anàlisi de l'eficiència d'algorismes iteratius

Com hem dit, l'anàlisi dels algorismes té com a objectiu caracteritzar l'eficiència dels algorismes per predir els recursos que usen i per comparar solucions alternatives. Per fer-ho, utilitzarem la notació assimptòtica per expressar com els algorismes utilitzen recursos en funció de la mida de l'entrada, sense preocupar-nos pels detalls tecnològics.

## Temps per trobar el mínim d'una llista

Recordeu l'algorisme per trobar el mínim d'una llista d'enters que hem vist anteriorment:

```python
def trobar_minim(llista: list[int]) -> int:
    n = len(llista)
    minim = llista[0]
    i = 1
    while i < n:
        if llista[i] < minim:
            minim = llista[i]
        i += 1
    return minim
```

El nostre primer intent d'anàlisi passava per atribuir un temps a cada operació elemental i sumar-los per obtenir el temps total.

Ara, utilitzarem la notació assimptòtica per expressar el temps d'execució de manera més senzilla i clara.

La clau és adonar-se que el cost de cada instrucció elemental és independent de la mida de l'entrada $n$. Per tant, podem considerar que cadascuna d'aquestes operacions triga un temps constant, que anomenarem $O(1)$.

Així doncs, el temps total d'execució de l'algorisme es pot expressar com el temps de les operacions fora del bucle més el temps de les operacions dins del bucle multiplicat pel nombre d'iteracions del bucle:

$$
T(n) = O(1) + (n - 1) · O(1) + O(1) = O(n)
$$

Molt més senzill! Hem obtingut que el temps d'execució de l'algorisme `trobar_minim` és de l'ordre de $n$, és a dir, creix linealment amb la mida de la llista utilitzant notació asimptòtica.

## Temps de bucles habituals

Els bucles són estructures de control molt habituals en els algorismes, i el seu temps d'execució depèn del nombre d'iteracions i del temps que triga el cos del bucle.

Considereu que `f` és una funció que representa la tasca feta dins d'un bucle i que el seu cost és constant, és a dir, $O(1)$. Els següents exemples mostren com calcular el temps d'execució de bucles habituals:

-   ```python
    for i in range(n):
        f()
    ```

    Llavors, $T(n) = n · O(1) = O(n)$.

-   ```python
    for i in range(n):
        f()
    for i in range(n):
        f()
    ```

    Llavors, $T(n) = O(n) + O(n) = O(n)$.


-   ```python
    for i in range(n):
        for j in range(n):
            f()
    ```

    Llavors, $T(n) = n · (n · O(1)) = O(n) · O(n) = O(n^2)$.


-   ```python
    for i in range(n):
        for j in range(n):
            for k in range(n):
                f()
    ```

    Llavors, $T(n) = n · (n · (n · O(1))) = O(n) · O(n) · O(n) = O(n^3)$.


-   ```python
    for i in range(n):
        for j in range(i):
            f()
    ```

    Llavors, $T(n) = \sum_{i=0}^{n-1} i \cdot O(1) = O(1)\sum_{i=0}^{n-1} i
    = O(1) \cdot \frac{(n-1)n}{2} = O(n^2)$.


-   ```python
    for i in range(m):
        for j in range(n):
            for k in range(p):
                f()
    ```

    Malgrat que la notació asimptòtica és definida per a una sola variable, sovint hom la generalitza (arriscadament) per a múltiples variables. En aquest cas, podem considerar que el temps d'execució depèn de les tres variables $m$, $n$ i $p$ i expressar-lo com el producte dels tres ordres de magnitud: $T(n) = O(mnp)$.


## Regla del més fort

És habitual que un algorisme estigui format per diverses parts amb diferents ordres de magnitud. En aquests casos, el temps total d'execució es pot expressar com la suma dels temps de cada part:

```python
f1(n)       # cost O(n)
f2(n)       # cost O(n^2)
```

Llavors, el temps total d'execució es pot expressar com:

$$
T(n) = O(n) + O(n^2) = O(n^2)
$$

Així doncs, quan s'analitza l'eficiència d'un algorisme, cal tenir en compte el terme dominant, que és el que creix més ràpidament amb la mida de l'entrada.

Això té una gran importància pràctica, ja que ens mostra que per accelerar l'algorisme, cal centrar-se en millorar el terme dominant (`f2` en aquest cas). Millorar els termes de menor ordre (`f1` en aquest cas) no tindrà gaire impacte en el rendiment global de l'algorisme per a valors grans de $n$.

Aquesta "regla del més fort" també val en condicionals:

```python
f1(n)       # cost O(n)
if condició:
    f2(n)   # cost O(n^2)
else:
    f3(n)   # cost O(n^3)
```

Llavors, el temps total d'execució es pot expressar com:

$$
T(n) = O(n) + \max(O(n^2), O(n^3)) = O(n^3)
$$



<Autors autors="jpetit"/>