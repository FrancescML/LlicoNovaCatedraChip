# Anàlisi de l'eficiència dels algorismes

Com hem dit, l'anàlisi dels algorismes té com a objectiu caracteritzar l'eficiència dels algorismes per predir els recursos que usen i per comparar solucions alternatives.

Per fer-ho, utilitzarem la notació assimptòtica per expressar com els algorismes utilitzen recursos en funció de la mida de l'entrada, sense preocupar-nos pels detalls tecnològics.

## Un primer exemple

Anem a provar de caracteritzar l'eficiència d'un algorisme senzill en tot detall, per acabar veient que no val la pena.

Considerem el problema de calcular el mínim d'una llista (no buida) d'enters. Podem resoldre aquest problema amb l'algorisme següent, que recorre tots els elements de la llista comparant cada element amb el mínim actual i actualitzant-lo si troba un element més petit:

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

Fixeu-vos que aquest algorisme utilitza un petit repertori d'operacions elementals:

- assignacions entre enters (a `n = len(llista)`, `minim = llista[0]`, `i = 1`, `minim = llista[i]` i `i = i + 1`),
- operacions d'increment (a `i += 1`),
- operacions de comparació (a `i < n` i `llista[i] < minim`),
- operacions d'accés a elements de la llista (a `llista[0]` i `llista[i]`),
- operació de retorn de valors (a `return minim`).

Anem a assignar un cert temps a cadascuna d'aquestes operacions bàsiques:

- $t_a$: temps per a una assignació entre enters,
- $t_i$: temps per a una operació d'increment,
- $t_c$: temps per a una operació de comparació,
- $t_l$: temps per a un accés a un element de la llista,
- $t_r$: temps per a un retorn de valor.

El valor concret d'aquestes constants dependria del computador, el llenguatge de programació, l'estat del sistema operatiu, i altres factors tecnològics.

Llavors, el temps total $T(n)$ que triga l'algorisme per a una llista de mida $n$ es pot expressar com la suma del temps que triga cadascuna de les operacions bàsiques que realitza:

- Abans del bucle `while`, es realitzen 3 assignacions i 1 accés a la llista, per un total de temps de $3t_a + t_l$.
- Després del bucle `while`, es realitza 1 retorn de valor, per un total de temps de $t_r$.
- Dins del bucle `while`, s'executen $n-1$ iteracions, i en cada iteració es realitzen 2 comparacions, 1 accés a la llista, 1 increment i, potser, una assignació a la variable `minim`.
- A més, cal tenir en compte que l'última iteració del bucle `while` realitza una comparació addicional (la que comprova que cal sortir del bucle).

Per tant, el temps total $T(n)$ es pot afitar així:

$$
T(n) \ge (3t_a + t_l) + (n-1)(2t_c + t_l + t_i) + t_c + t_r
$$

i

$$
T(n) \le (3t_a + t_l) + (n-1)(2t_c + t_l + t_i + t_a) + t_c + t_r.
$$

De les dues fites, segurament la més important és la segona, ja que ens dóna un límit superior al temps que triga l'algorisme en funció de la mida de l'entrada $n$. Per tant, triant els valors adequats de les constants $a$ i $b$ en funció de $t_a$, $t_i$, $t_c$, $t_l$ i $t_r$, podem reescriure el temps així:

$$
T(n) \le an + b.
$$

El temps que triga l'algorisme per a valors petits de $n$ no és gaire rellevant, ja que en aquests casos l'algorisme s'executa molt ràpidament. Per tant, el que realment ens interessa és com es comporta l'algorisme quan $n$ és gran. En aquest cas, el terme $b$ és insignificant en comparació amb el terme $an$, de manera que podem simplificar encara més la fita anterior i escriure:

$$
T(n) \le (a+1)n.
$$

Per tant, podem dir que el temps que triga l'algorisme creix linealment amb la mida de l'entrada. Usant la notació assimptòtica, podem expressar aquest resultat com:

$$
T(n) = O(n).
$$


<Autors autors="jpetit"/>
