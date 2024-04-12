# Programa principal i variables globals


<img src='./main.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>


## La història

A la nostra introducció a les funcions vam escriure aquest programa:


```python
from yogi import read

def maxim2(a: int, b: int) -> int:
"""Calcula el màxim de dos enters."""

    if a > b:
        m = a 
    else:
        m = b
    return m


def maxim3(a: int, b: int, c: int) -> int:
    """Calcula el màxim de tres enters."""

    m = maxim2(maxim2(a, b), c)
    return m


# programa principal
a = read(int)
b = read(int)
c = read(int)
print(maxim3(a, b, c))
```

Ja sabem que les variables `a`, `b` i `m` de la funció `maxim2` són variables locals i independents de les variables `a`, `b` i `m` de la funció `maxim3`. Ara bé, les variables definades al programa principal (el que comença al comentari `# prova`) són **variables globals**. Les variables globals tenen el defecte de que es poden veure des de tot el programa.

Per exemple, la variable global `c` definida al programa principal pot ser consultada des de la funció `maxim2`. Això és un greu inconvenient, perquè fa que la relació dels subprogrames els uns amb els altres no es limiti al pas de paràmetres: un canvi en una variable global molt lluny d'una funció pot afectar el seu funcionament. Això, en ocasions és útil, però crea grans dificultats de comprensió i manteniment en programes minimament grans.

En canvi, les variables globals `a` i `b` definides al programa principal no poden ser consultades des de la funció `maxim2`. La raó és que els paràmetres `a` i `b` les amaguen: els paràmetres locals tenen prioritat davant de les variables globals. Però si es canviés el nom dels paràmetres, aquestes variables globals ja no estarien amagades dins la funció.

A més, les variables globals no només poden ser consultades des de les funcions, també poden ser-hi modificades! Fer-ho és una mica més difícil, perquè cal usar la paraula clau `global` que no explicarem ara perquè no volem que la feu servir 😀.

En Python només hi ha una manera d'evitar la filtració de les variables globals a les funcions i accions d'un programa: no tenir-les. Per això, és una bona pràctica encapsular el que seria el programa principal dins d'una acció, que per convenció s'anomena `main`. Llavors el programa quedaria així:

```python
from yogi import read

def maxim2(a: int, b: int) -> int:
"""Calcula el màxim de dos enters."""

    if a > b:
        m = a 
    else:
        m = b
    return m


def maxim3(a: int, b: int, c: int) -> int:
    """Calcula el màxim de tres enters."""

    m = maxim2(maxim2(a, b), c)
    return m


def main() -> None:
    a = read(int)
    b = read(int)
    c = read(int)
    print(maxim3(a, b, c))


main()
```

Com podeu veure, ara les instruccions de l'antic principal es troben dins de l'acció `main`, que no té paràmetres. Conseqüentment, les variables que es defineixen dins de `main` són variables locals i no són visibles des d'altres funcions. Això dóna molta més seguretat al programa.

Quan es fa això, però, cal anar en compte de no oblidar cridar aquesta funció `main` al final del programa. Altrament, l'execució del programa no faria res!

De fet, moltes vegades, és encara millor condicionar la crida a `main()` al fet que el programa s'executi com a programa i que no ho faci quan es carrega amb un `import`. Deixeu-m'ho explicar:

Si el programa anterior el desem en un fitxer `funcions.py`, ja sabeu que el podem executar amb 

```bash
$ python3 funcions.py
```

En aquest cas, té tot el sentit del món que el programa es comenci a executar tot invocant l'acció `main`.

Però també sabeu que, des de le l'intèrpret de Python es poden carregar programes amb `import`:

```python
>>> import funcions
```

En general, en aquest cas, no és convenient que el programa principal es comenci a executar: Potser l´únic que es pretenia al importar aquest programa és disposar de les funcions `maxim2` i `maxim3` dins l'intèrpret. Aquestes es poden invocar amb alguna crida com ara `funcions.maxim2(23, 52)`.

Per distingir entre el primer i el segon cas cal usar la màgia següent:

```python
...

if __name__ == '__main__':
    main()
```

🤣! Amb aquest condicional, la funció `main` es cridarà quan s'executi el programa i no ho farà quan s'importi.


## Sumari

Per evitar contaminar el programa amb variables globals que poden ser consultades des de qualsevol punt, és convenient encapsular el programa principal dins d'una acció `main()`:

```python
def main() -> None:
    ...
```


Per tal d'invocar aquesta acció que conté el programa principal només quan s'executi el programa i no quan s'importi el programa, cal afegir aquest codi al final del programa:

```python
if __name__ == '__main__':
    main()
```


<Autors autors="jpetit"/> 

