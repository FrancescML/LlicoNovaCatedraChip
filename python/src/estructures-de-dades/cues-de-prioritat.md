
# Cues de prioritat

<img src='./cues-de-prioritat.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>


Una **cua de prioritats** és una estructura de dades que emmagatzema una
col·lecció d'elements amb les operacions principals següents:

- afegir un nou element,
- consultar si hi ha algun element,
- consultar l'element mínim de la col·lecció que encara no s'hagi eliminat, i
- eliminar aquest element.

Una cua de prioritats pot emmagatzemar elements repetits, cadascun d'ells
sortirà de la cua quan li arribi el torn.


## Il·lustració

Podem veure una cua de prioritats com un contenidor on es col·loquen elements. En
tot moment, l'únic element accessible és el més petit del contenidor. Aquest es
pot consultar i/o eliminar de la cua de prioritats. Accedir a l'element mínim
de la cua de prioritats quan aquesta és buida és un error.

A l'animació interactiva següent, feu clic damunt dels elements per ficar-los
a la cua de prioritats. Feu clic a la cua de prioritats per treure'n l'element
més petit.

<MySnap src="./priority-queue.ts"/>

## Aplicacions

Les cues de prioritat s'utilitzen quan es vol extendre les
cues amb una noció de prioritat: Per exemple, a la vida
real, les dones embarrassades o amb nens, els discapacitats o la gent gran
tenen prioritat a l'hora de seure al transport públic. També, una impressora
pot tenir una cua de treballs pendents d'imprimir, però pot caler tractar-los
segons el càrrec de l'empleat que ha enviat el treball. En aplicacions de
simulació d'esdeveniments discrets és molt freqüent tenir esdeveniments
associats a instants de temps que desencadenen nous esdeveniments; el
simulador pot guardar els esdeveniments pendents en una cua de prioritats i, a
cada iteració, treure el següent esdeveniment (el de temps mínim) de la cua i
posar-n'hi de nous per ser tractats més endavant. Molts algorismes utilitzen
cues de prioritats com una estructura de dades que permet desar informació
pendent de tractar en un ordre concret.


## Heapq

Per treballar amb cues de prioritat en Python cal utilitzar el mòdul estàndard `heapq`. El nom ve de *heap queue* perquè els *heaps* són una manera eficient d'implementar les cues de prioritat. En Python, les cues de prioritat no són directament un tipus de dades, sinó que es manipulen a través de llistes fent ús de les operacions de `heapq`.

Per utilitzar cues de prioritat hem d'importar doncs el mòdul `heapq`:

```python
import heapq
```

Podem començar fent que la llista `cuap` representi una cua de prioritats buida: N'hi ha prou amb crear-la com una llista buida:

```python
cuap = []
```

Si volem inserir els elements 5, 3, 5 i 7 (en aquest ordre) a la cua de prioritats `cuap`, ho haurem de fer amb l'operació `heappush`:

```python
heapq.heappush(cuap, 5)
heapq.heappush(cuap, 3)
heapq.heappush(cuap, 5)
heapq.heappush(cuap, 7)
```

En aquest punt, podem saber quin és l'element més petit a la cua de prioritats preguntant pel primer element de la llista:

```python
>>> cuap[0]
3
```

Igualment, podem treure l'element més petit amn l'operació `heappop`:

```python
>>> heapq.heappop(cuap)
3
```

Si ho repetim, obtindrem el següent element més petit:

```python
>>> heapq.heappop(cuap)
5
```

Evidentment, `heappop` té com a precondició que la cua de prioritats no sigui buida.

És important que, un cop que decidiu tractar una llista com a cua de prioritats, no manipuleu més la llista si no és a través de les operacions `heappush` i `heappop`.


## Resum de les operacions bàsiques

|operació|significat|
|---|----|
|`cp = []`|crea una cua de prioritats buida.|
|`len(cp)`|retorna el nombre de claus a la cua de prioritats `cp`. |
|`heappush(cp, x)`| insereix l'element `x` a la cua de prioritats `cp`. |
|`heappop(cp)`| elimina i retorna l'element més petit de la cua de prioritats `cp` (s'enfada si és buida).|
|`cp[0]`| retorna l'element més petit de la cua de prioritats `cp` (s'enfada si és buida).|

El cost d'inserir o esborrar un element en/d'una cua de prioritats amb $n$ elements és $\O(\log n)$. La resta d'operacions tenn¡en cost constant.


## Exemple: ordenació amb cues de prioritat

Considerem que volem llegir una seqüència de paraules i escriure-la en ordre creixent.

És clar que aquest problema es podria resoldre utilitzant la funció predefinida `sorted()`, però ara ho volem fer d'una altra manera mitjantçant una cua de prioritats:

1. Primer, es crea una cua de prioritats de paraules.
2. Després, es llegeix cada element de l'entrada i es guarda dins la cua de prioritats.
3. Finalment, mentre la cua de prioritats no és buida, s'escriu i es descarta l'element mínim de la cua de prioritats.

Donat que els elements de la cua de prioritats es treuen del més petit al més gran perquè cada cop s'extreu el mínim, és evident que els valors que s'han llegit apareixeran en ordre creixent.

Implementem ara els passos anteriors:

1. Creació de la cua de prioritats:

    Per crear una cua de prioritats buida senzillament creem una llista de paraules buida:

    ```python
    paraules: list[str] = []
    ```

2. Ompliment de la cua de prioritats:

    Per poder llegir l'entrada, utilitzarem un bucle `for paraula in yogi.tokens(str)`, on `paraula`
    és una variable que anirà prenent seqüèncialment totes les paraules de
    l'entrada fins que s'acabin. Per a cada element `paraula` llegit, caldrà
    afegir-lo a la cua de prioritats `paraules` mitjantçant la instrucció `heappush`. Així:

    ```python
    for paraula in yogi.tokens():
        heapq.heappush(paraules, paraula)
    ```

3. Buidat de la cua de prioritats:

    Un cop llegides totes les paraules, aquestes es trobaran a la cua de prioritats `paraules`.
    Per escriure-les tots en ordre creixent, cal anar trient i escrivint l'element mínim
    de la cua de prioritats (amb `heappop`), fins que la cua de prioritats
    quedi buida:

    ```python
    while paraules:
        print(heapq.heappop(paraules))
    ```

Aquest és el programa complet:

```python
import heapq
import yogi

paraules: list[str] = []

for paraula in yogi.tokens():
    heapq.heappush(paraules, paraula)

while paraules:
    print(heapq.heappop(paraules))
```

⚡ Fixeu-vos que per accedir al mínim d'una cua de prioritats o per eliminar-
lo,  és necessari que la cua de prioritats no estigui buida. Justament aquest
és el cas en el programa anterior: la condició del bucle ho assegura.

Per a una entrada amb $n$ elements, aquest algorisme aplica $n$ operacions
`heappush()` i $n$ operacions `heappop()` en una cua de
prioritats que no té mai més de $n$ elements. En conseqüència, el seu cost és
$\O(n\log n)$. Aquest seria el mateix cost que desant les dades en una llista i
ordenant-lo amb la funció predefinida `sorted()`. A la
pràctica, però, el darrer mètodes és més eficient.

Les cues de prioritat de Python també tenen una operació `heapify` per convertir una llista en una cua de prioritats. Amb aquesta operació el programa quedaria així:

```python
import heapq
import yogi

paraules = list(yogi.tokens())
heapq.heapify(paraules)
while paraules:
    print(heapq.heappop(paraules))
```

`heapify` no només estalvia codi sinó que és més eficient: amb `heapify`, una llista d'$n$ elements es converteix a cua de prioritats en temps $\O(n)$ , mentre que amb $n$ insercions successives triga $\O(n\log n)$.


## Cues de prioritat per màxim

També es podrien considerar cues de prioritats on l'element que es consulta o elimina és el màxim de la col·lecció (enlloc del mínim). Aquí, els de Python s'hi han lluït perquè no hi ha cap solució disponible directament 🤔. Si us cal i les vostres claus són numèriques, les podeu inserir i treure girant el seu signe. Altrament, haureu de redefinir el comportament de les operacions de comparació (no ho explico).


<Autors autors="jpetit"/>
