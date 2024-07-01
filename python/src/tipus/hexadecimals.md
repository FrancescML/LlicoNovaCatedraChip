# Aplicació: Nombres en hexadecimal

<img src='./hexadecimals.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>


Aquesta lliçó mostra una possible solució per al poblema
[P60816](https://jutge.org/problems/P60816) (Número del revés en hexadecimal).


## Exercici P60816

L'exercici [P60816](https://jutge.org/problems/P60816) demana un programa que llegeixi un nombre i que n'escrigui la seva representació hexadecimal del revés. Cal seguir la convenció de representar els valors entre el 10 i el 15
amb les lletres de la A fins a la F.

Per exemple, per a l'entrada ~~14~~ cal escriure la sortida ~~E~~, per a l'entrada ~~16~~ cal escriure la sortida ~~01~~, i per a l'entrada ~~7000~~ cal escriure la sortida  ~~85B1~~.

Aquesta n'és una possible solució:

```python
from yogi import read

n = read(int)
if n == 0:  # cas especial
    print(0)
else:
    while n > 0:
        d = n % 16
        if d == 10:
            print('A', end='')
        elif d == 11:
            print('B', end='')
        elif d == 12:
            print('C', end='')
        elif d == 13:
            print('D', end='')
        elif d == 14:
            print('E', end='')
        elif d == 15:
            print('F', end='')
        else:
            print(d, end='')
        n = n / 16
    print()
```

El programa comença llegint el número, que es desa en `n`. Després, hi ha un tractament especial per al cas que `n` sigui zero (altrament el programa no escriuria cap dígit), i un tractament per al cas general.

En el cas general, anem divint el nombre `n` entre 16 fins que sigui zero. D'aquesta forma se'n visiten tots els dígits en hexadecimal, de dreta a esquerra. A cada iteració, se n'extreu i escriu el darrer dígit hexadecimal `d`. Si és un valor entre 0 i 9, `d` aquest es pot escriure directament. Altrament, cal la lletra corresponent per cada nombre entre 10 i 15, cosa que fem amb una cascada de `if`s.

Com que cada dígit en hexadecimal s'ha d'escriure darrera de l'anterior, els `print` inclouen un `end=''` per indicar que no s'ha d'escriure res al final (ni tan sols el salt der línia). El darrer `print()` sense paràmetres és el que escriu el salt de línia.

## Observacions

- El problema demana d'escriure el resultat al revés perquè del dret no ho sabríeu fer (encara).

- Es podria evitar la cascada de `if`s fent servir les funcions `ord` i `chr`, però tampoc no les hem vist.

<Autors autors="jpetit"/> 

