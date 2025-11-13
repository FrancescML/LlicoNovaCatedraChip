
# Eficiència dels algorismes

Per executar un algorisme calen certs recursos, com ara:

* *processadors* per executar les instruccions,
* *temps* per esperar que s'executin les instruccions,
* *memòria* per emmagatzemar dades,
* *energia* per alimentar el sistema,
* *ample de banda* per transferir dades,
* etc.

Com ens ensenya l'economia, els recursos són limitats i tenen un cost (*time is money!*). Per això és important dissenyar algorismes que utilitzin els recursos de manera eficient.

Diem que un algorisme és eficient si resol correctament el problema per al qual ha estat dissenyat utilitzant la menor quantitat possible de recursos (o d'algun tipus de recurs en particular). En el cas que no puguem saber si un algorisme és el més eficient possible, almenys volem poder comparar l'eficiència de diferents algorismes que resolen el mateix problema, per tal de triar el més eficient.

## Mesures empíriques

Es podria pensar que les mesures empíriques són la millor manera d'avaluar l'eficiència d'un algorisme. En efecte, és fàcil mesurar el temps (en segons) que triga a executar-se un algorisme per a una entrada concreta en un computador concret.

Però aquesta mesura depèn molt del computador utilitzat, del llenguatge de programació emprat, de la qualitat de l'intèrpret o del compilador, de l'estat del sistema operatiu, de la càrrega de treball del sistema i d'altres factors externs.

Tots aquests detalls són tecnològics, canvien al llarg del temps (els fabricants fan ordinadors cada cop més ràpids) i no tenen res a veure amb l'algorisme en si mateix. A més a més, aquesta mesura només és vàlida per a una entrada concreta, i caldrà realitzar-ne moltes per extrapolar com es comportarà l'algorisme amb altres entrades.

Pitjor encara, aquesta aproximació empírica pressuposa que l'algorisme ja està implementat i es pot executar, malgrat que sovint volem analitzar-ne l'eficiència abans de posar-nos a implementar-lo, potser perquè acaba sent molt ineficient!

## Anàlisi matemàtica

L'anàlisi matemàtica dels algorismes és una alternativa a les mesures empíriques que aplica tècniques matemàtiques per estudiar rigorosament l'eficiència dels algorismes. En el fons, els algorismes són mètodes abstractes per resoldre problemes, de manera que la seva eficiència és una propietat independent dels factors tecnològics que s'utilitzen per executar-los. Per això, l'anàlisi matemàtica permet estudiar l'eficiència dels algorismes de manera independent dels factors tecnològics i obtenir resultats més generals i duradors.

Donat un algorisme $A$ amb un conjunt d'entrades $A$, la seva eficiència o cost (en temps, en espai, en nombre d'operacions d'E/S, etc.) és una funció $T$ d'A en $\mathbb{N}$:

$$T : A \rightarrow \mathbb{N}$$

Caracteritzar el cost de l'algorisme $A$ per a cada entrada possible pot ser extramadament complicat i no gaire pràctic. Per això, sovint ens centrem en caracteritzar el cost de l'algorisme en funció de la mida de l'entrada. Però com que per a un mateix valor de mida d'entrada poden haver-hi moltes entrades diferents, cal definir diferents funcions de cost segons el cas que ens interessi. Sigui $A_n \subseteq A$ el conjunt d'entrades de mida $n$. Podem definir les següents funcions de cost:

- Cost en el cas pitjor:

  $$T_{pitjor}(n) = \max \{ T(x) \mid x \in A_n \}$$

- Cost en el cas millor:

  $$T_{millor}(n) = \min \{ T(x) \mid x \in A_n \}$$

- Cost en el cas mitjà:

  $$T_{mitja}(n) = \sum_{x \in A_n} Pr(x) T(x) = \sum_{k=0}^{\infty} k \cdot Pr(T_n = k)$$


En general, ens fixarem preferentment en el cost en cas pitjor dels algorismes per dues raons:

- proporciona garanties sobre la eficiència del algorisme ja que el cost mai excedirà el cost en cas pitjor,

- és més fàcil de calcular que el cost mitjà que, a més, presuposa conèixer la distribució de probabilitat de les entrades, cosa que no sempre és fàcil d'obtenir.

En tot cas, fixeu-vos que sempre es compleixen les desigualtats següents:

$$
\forall x \in A_n, \quad T_{millor}(n) \le T(x) \le T_{pitjor}(n)
$$

i

$$
T_{millor}(n) \le T_{mitja}(n) \le T_{pitjor}(n).
$$


## Exemple d'anàlisi d'un algorisme

Com a primer pas, provem de caracteritzar l'eficiència d'un algorisme senzill.

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

* assignacions entre enters (`n = len(llista)`, `minim = llista[0]`, `i = 1`, `minim = llista[i]` i `i = i + 1`),
* operacions d'increment (`i += 1`),
* operacions de comparació (`i < n` i `llista[i] < minim`),
* operacions d'accés a elements de la llista (`llista[0]` i `llista[i]`),
* operació de retorn de valors (`return minim`).

Assignem un cert temps a cadascuna d'aquestes operacions elementals:

* $T_a$: temps per a una assignació entre enters,
* $T_i$: temps per a una operació d'increment,
* $T_c$: temps per a una operació de comparació,
* $T_l$: temps per a un accés a un element de la llista,
* $T_r$: temps per a un retorn de valor.

El valor concret d'aquestes constants dependrà del computador, del llenguatge de programació, de l'estat del sistema operatiu i d'altres factors tecnològics.

El temps total $T(n)$ que triga l'algorisme `trobar_minim` aplicat a una llista de mida $n$ es pot expressar com la suma del temps que triga cadascuna de les operacions elementals que realitza:

* Abans del bucle `while`, es realitzen 3 assignacions i 1 accés a la llista, per un total $3T_a + T_l$ unitats de temps.
* Després del bucle `while`, es realitza 1 retorn de valor, per un total de temps de $T_r$.
* Dins del bucle `while`, s'executen $n - 1$ iteracions, i a cada iteració es realitzen 2 comparacions, 1 accés a la llista, 1 increment i, potser, una assignació a la variable `minim`.
* A més, cal tenir en compte que l'última iteració del bucle `while` realitza una comparació addicional (la que comprova que cal sortir del bucle).

Per tant, el temps total $T(n)$ es pot afitar així:

$$
T(n) \ge (3T_a + T_l) + (n - 1)(2T_c + T_l + T_i) + T_c + T_r
$$

i

$$
T(n) \le (3T_a + T_l) + (n - 1)(2T_c + T_l + T_i + T_a) + T_c + T_r.
$$

De les dues fites, la més important és la segona, ja que ens dóna un límit superior al temps que triga l'algorisme en funció de la mida de l'entrada $n$. Per simplificar-ho, triant els valors adequats de les constants $a$ i $b$ en funció de $T_a$, $T_i$, $T_c$, $T_l$ i $T_r$, podem reescriure el temps així:

$$
T(n) \le an + b.
$$

El temps que triga l'algorisme per a valors petits de $n$ no és gaire rellevant, ja que en aquests casos s'executa molt ràpidament. El que realment ens interessa és com es comporta l'algorisme quan $n$ és gran. En aquest cas, el terme $b$ és menyspreable en comparació amb el terme $an$, de manera que podem simplificar encara més la fita anterior i escriure:

$$
T(n) \le c n
$$

per a alguna constant $c > a$.

Aquesta expressió ens diu que el temps que triga l'algorisme per a una llista de mida $n$ creix, com a molt, de manera lineal amb $n$. El factor d'aquest creixement és la constant $c$, que depèn dels detalls tecnològics esmentats abans. Amb un ordinador el doble de ràpid, el valor de $c$ es reduiria a la meitat; amb un ordinador el doble de lent, el valor de $c$ es duplicaria. Però el fet que el temps creixi linealment amb $n$ és una propietat intrínseca de l'algorisme.

Per expressar-ho, utilitzarem la notació:

$$
T(n) = O(n)
$$

que es llegeix "*T d'ena és O gran de ena*" i significa que el temps que triga l'algorisme creix, com a molt, de manera lineal amb la mida de l'entrada $n$ per a valors grans de $n$.

Les lliçons següents presenten aquesta notació de manera més formal i estudien altres tipus de creixement comuns en l'anàlisi d'algorismes.

<Autors autors="jpetit"/>
