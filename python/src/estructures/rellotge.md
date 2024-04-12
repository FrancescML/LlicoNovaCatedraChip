
# Aplicació: Rellotge despertador

<img src='./rellotge-digital.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

Més rellotges! Aquesta lliçó mostra com utilitzar una estructura per reunir en una sola variable els tres components hora, minuts i segons de l'hora del dia d'un rellotge.


## Definició del tipus

Considereu un rellotge digital, que marca les hores, minuts i segons de l'hora del dia. Tal vegada voldríem desar aquesta informació en un sol lloc i, fer-ho en una estructura com la següent seria una idea ben adient:

```python
@dataclass
class Hora:
    h: int = 0      # hora  (0..23)
    m: int = 0      # minut (0..59)
    s: int = 0      # segon (0..59)
```

És a dir, l'hora del dia té tres camps: `h`, `m` i `s` que representen, respectivament, les seves hores, minuts i segons. Cada camps és un enter, i als comentaris hem emfatitzat els valors legals que poden tenir cadascun d'ells. A més, hem donat un valor per defecte a cadascun dels camps.

Fixeu-vos que també haguéssim pogut definir una `Hora` com una llista amb tres enters, o amb una tupla de tres camps, però haver-ho fet amb una estructura ho fa molt més segur i explícit, ja que no hi haurà mai errors amb les posicions ni dubtes sobre quin valor hi ha a cada posició.


## Construcció de valors

Un cop definit el tipus `Hora`, ja es pot construir-ne valors:

```python
migdia = Hora(12, 0, 0)
mitjanit = Hora(0, 0, 0)
```

Sovint, els valors de classes s'anomenen **instàncies**. En aquest cas, `migdia` és una instància de `Hora`.

Al constructor, es poden passar els paràmetres reals especificant a quin paràmetre formal es refereixen. En aquest cas, també se'ls pot canviar l'ordre:

```python
alarma = Hora(s=0, m=30, h=7)  # 07:30:00
```

A més, no cal donar els valors pels camps que ja els tenen per defecte:

```python
alarma = Hora(m=30, h=7)    # 07:30:00
alarma = Hora(7, 30)        # 07:30:00
```


## Operacions

Una primera operació que ens podria ser útil és la d'escriure una hora donada. Per això, escriurem una acció que, donada una `Hora`, l'escriu en format estàndard, amb dos dígits per camp utilitzant un text amb format:

```python
def escriure_hora(hora: Hora) -> None:
    print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')
```

A continuació, podríem tenir una operació que, donada un hora, li afegís un segon. Hi ha dues maneres de fer-ho: amb una acció que té un paràmetre que és modificat o amb una funció que, donada una hora, en retorna una de nova. Totes dues són opcions vàlides i la preferència de l'una sobre l'altra depèn del context.

Comencem amb l'acció que modifica el paràmetre:

```python
def incrementar_un_segon(hora: Hora) -> None:
    hora.s += 1
    if hora.s == 60:
        hora.s = 0
        hora.m += 1
        if hora.m == 60:
            hora.m = 0
            hora.h += 1
            if hora.h == 24:
                hora.h = 0
```

I ara, fem-ho amb una funció:

```python
def un_segon_mes_tard(hora: Hora) -> Hora:
    despres = dataclasses.replace(hora)
    despres.s += 1
    if despres.s == 60:
        despres.s = 0
        despres.m += 1
        if despres.m == 60:
            despres.m = 0
            despres.h += 1
            if despres.h == 24:
                despres.h = 0
    return despres
```

Aquesta vegada, cal copiar primer l'hora en una nova variable. La manera de fer-ho és amb `dataclasses.replace`. Ara que ja disposem d'una còpia del paràmetre real que podem modificar lliurament sense modificar l'original i treballem amb ella i, al final, la retornem.


## Programa principal

Per acabar, fem un programa complet que simuli un rellotge despertador, escrivint l'hora corresponent cada segon i avisant a l'hora de l'alarma. Per a fer-ho, utilitzarem els subprogrames anteriors i la funció `sleep()` disponible al mòdul estàndard `time` que suspèn l'execució del programa durant tants segons com se li passi per paràmetre.

```python
import time
import dataclasses

@dataclasses.dataclass
class Hora:
    h: int = 0       # hora  (0..23)
    m: int = 0       # minut (0..59)
    s: int = 0       # segon (0..59)

def escriure_hora(hora: Hora) -> None:
    print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')

def incrementar_un_segon(hora: Hora) -> None:
    hora.s += 1
    if hora.s == 60:
        hora.s = 0
        hora.m += 1
        if hora.m == 60:
            hora.m = 0
            hora.h += 1
            if hora.h == 24:
                hora.h = 0

def main() -> None:
    hora = Hora(23, 59, 55)
    alarma = Hora(7, 30)
    while True:
        escriure_hora(hora)
        if hora == alarma:
            print('ring ring!')
        sleep(1)                       # esperar un segon
        incrementar_un_segon(hora)

if __name__ == '__main__':
    main()
```

L'ordre de les funcions no és rellevant en Python, però si que cal declarar abans el tipus `Hora` que les funcions que l'utilitzen.

El bucle `while True` és un bucle infinit: el programa no acabarà mai. Normalment no volem programes que mai acabin, però, en aquest cas... jo no voldria que el meu rellotge acabés! Piqueu <kbd>control</kbd>+<kbd>c</kbd> per aturar la seva execució.

La comparació de dues instàncies amb `==` consisteix en mirar si tots els seus camps són iguals. També es pot usar `!=`, però `<`, `>`, `>=` i `<=` (per defecte) no funcionen.


<Autors autors="jpetit"/> 

