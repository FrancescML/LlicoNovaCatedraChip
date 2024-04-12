# Aplicació: Torres de Hanoi

<img src='./hanoi.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

En aquesta lliçó es mostra com obtenir una solució recursiva per al trencaclosques de les Torres de Hanoi.


## Les Torres de Hanoi

Les **Torres de Hanoi** són un trencaclosques inventat pel matemàtic Édouard Lucas el 1883. Segons la llegenda (inventada pel mateix Lucas), en un temple remot, hi ha tres agulles. A la primera d'aquestes agulles, un déu va col·locar seixanta-quatre discos d'or, el més gran sota de tots i els altres, cada vegada més petits, sobre seu. Cada dia, els monjos mouen un disc d'or d'una agulla en una altra, sempre respectant el dictat diví de mai posar un disc gran sobre un de més petit. Quan els monjos hagin aconseguit traslladar tots els discos a la tercera agulla, la fi del món arribarà.

!!! Foto

Es pot jugar a les Torres de Hanoi amb joguines com la de la foto, que em va regalar una antiga estudiant que la va comprar al [Museu de Matemàtiques de Catalunya](https://mmaca.cat/) a Cornellà i sempre utilitzo per presentar aquesta a lliçó a classe. Gràcies Mireia! Hi ha tres pius, es col·loquen `n` discos de gran a petit en el primer, i cal trobar com moure'ls tots (amb el mínim nombre possible de moviments) fins al tercer piu. Cada moviment ha d'agafar un disc del cim d'un dels pius i dipositar-lo al cim d'un altre piu, sempre sobre un disc més gran.

Proveu de jugar-hi! Amb tres discos tothom se'n surt, però amb cinc discos el trencaclosques comença a fer-se complicat.


## Solució recursiva

Podem resoldre el trencaclosques de les Torres de Hanoi amb una senzilla solució recursiva. Per a fer-ho, suposem que ens cal moure `n` discs d'un piu d'origen a un piu de destí passant, potser, per un piu auxiliar.

- Si el nombre de discos a moure és zero, no cal fer res! Aquest és el nostre cas base (i més fàcil no podia ser).

- Si el nombre de discos a moure no és zero, aquesta és la manera de transferir els `n` discos del piu d'origen al piu de destí:

    1. Primer, es transfereixen `n - 1` discos del piu d'origen al piu auxiliar.

    2. Després, es transfereix el disc al cim del piu d'origen al piu de destí.

    3. Finalment, es transfereixen `n - 1` discos del piu auxiliar al piu de destí.

    Evidentment, els passos i i iii es fan de forma recursiva. I aquests passos són segurs, perquè el disc més gran sempre és més a baix.

!!! Dibuix-animació

Extraordinari, oi? Sol passar amb el poder de la recursivitat!

Per implementar-ho en Python, definim l'acció (recursiva) següent:

```python
def hanoi(n: int,  ori: str,  aux: str,  dst: str) -> None:
    """Escriu com moure n discos del piu ori al piu dst utilitzant el piu aux."""
```

Aquí `n` és el nombre de discos a moure, i `ori`, `src` i `dst` són els noms que representen els tres pius. La crida inicial podria ser `hanoi(3, 'A', 'B', 'C')` per moure tres discos del piu A al piu C passant pel piu B. La implementació podria ser aquesta:

```python
def hanoi(n: int,  ori: str,  aux: str,  dst: str) -> None:
    """Escriu com moure n discos del piu ori al piu dst utilitzant el piu aux."""

    if n > 0:
        hanoi(n - 1, ori, dst, aux)
        print(f'{ori} -> {dst}')
        hanoi(n - 1, aux, ori, dst)
```

En el cas que `n` sigui zero, no fa res. Altrament, fa una primera crida recursiva amb un disc menys del piu d'origen cap al piu auxiliar, després escriu el moviment d'un disc del piu d'origen al piu de destí, i finalment fa una segona crida recursiva amb un disc menys del piu auxiliar cap al de destí.

La sortida corresponent per 3 discos és la següent:

```text
A -> C
A -> B
C -> B
A -> C
B -> A
B -> C
A -> C
```

I aquesta és l'animació corresponent (font: Wikipedia):

![hanoi.gif](hanoi.gif)


## Nombre de moviments

Quan de temps cal perquè els monjos arribin a moure tots els 64 discos i provoquin la fi del món? Per a saber-ho, sigui $M(n)$ el nombre de moviments que necessita l'acció `hanoi` quan reb $n$ com a nombre de discos a moure. Aleshores tenim la recurrència següent:

- $M(0) = 0$

- $M(n) = 2M(n - 1) + 1$ quan $n>0$.

És fàcil comprovar que la solució general d'aquesta recurrència és $M(n)=2^n - 1$ (per exemple, amb una demostració per inducció). Fixeu-vos què passa amb els primers valors:

|$n$|$M(n)$|
|---|---:|
|0|0|
|1|1|
|2|3|
|3|7|
|4|15|
|5|31|
|6|63|

Per tant, per moure 64 discos els monjos necessiten $2^{64}-1$ dies. Tenint en compte que els físics estimen que l'edat de l'univers (des del Big Bang) és d'uns $14·10^{12}$ anys, això suposa més d'un milió de vegades aquest temps. Per aquest costat, podem estar tranquils i deixar els monjos inofensivament ocupats 😇.

Però... i amb ordinador? El meu ordinador portàtil pot fer unes $10^9$ operacions per segon (perquè funciona a una freqüència aproximada d'1 GHz). Per tant, essencialment, podria resoldre el problema en $2^{64}/10^9$ segons, és a dir, quasi 6 segles. Mmmm... encara queda una mica de marge, però els ordinadors són més ràpids cada cop... 


<Autors autors="jpetit"/> 

