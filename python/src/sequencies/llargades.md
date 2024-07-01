# Aplicació: Llargades de paraules

<img src='./llargades.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

Aquesta lliçó presenta un programa per llegir un poema i obtenir-ne algunes estadístiques sobre la llargada de les seves paraules.


## Enunciat i exemple

Donat un poema, suposem que estem interessats a saber quina n'és la paraules més llarga, quantes paraules conté, i quina n'és la llargada mitjana (en nombre de lletres).

Per exemple, en el cas que la nostra entrada fós

```text
quan els oques van al camp la primera va al davant
la segona va al darrera i despres ve la tercera
```

hauríem d'obtenir com a sortida

```text
nombre de paraules: 21
llargada mitjana: 3.7619
paraula més llarga: primera
```

Si hi ha diverses paraules amb el mateix nombre màxim de lletres, cal escriure'n una qualsevol.


## Solució

Per resoldre aquesta tasca, considerarem que el poema consisteix en una seqüència no buida de paraules. Per tant, utilitzem un bucle

```python
for paraula in tokens(str):
    ...
```

per tal de poder tractar totes les paraules una rera l'altra. Afortunadament, la funció `tokens()` aplicada a `str`s ja funciona per paraules (tot entenent que estan separades per blancs o salts de línies).

Dins del bucle, només ens cal mantenir la informació necessària per poder donar les respostes al final del programa, quan ja s'hagin processat totes les paraules. Per això, usarem les variables següents:

- `nombre_paraules` és un enter que compta el nombre de paraules. Lògicament, cal inicialitzar-lo a zero. A cada iteració cal incrementar-lo en una unitat. Després del bucle contindrà el nombre total de paraules en el poema.

- `suma_llargades` és un enter que acumula les llargades de les paraules. Lògicament, també cal inicialitzar-lo a zero. A cada iteració cal incrementar-lo amb la llargada de la paraula actual. Després del bucle contindrà la suma total de lletres de totes les paraules del poema.

- `paraula_mes_llarga` és un text que representa la paraula més llarga trobada fins al moment (la primera, en cas d'empat). La podem incialitzar amb el text buit `''` perquè qualsevol altra paraula sempre serà més llarga. A cada iteració caldrà mirar si la paraula actual és més llarga que `paraula_mes_llarga` i, en cas afirmatiu, substituir-la per la paraula actual. Després del bucle contindrà una de les paraules més llargues del poema (en concret, la que s'hagi llegit abans).

En sortir del bucle, només cal reportar els valors calculats.

El programa sencer queda doncs així:


```python
from yogi import tokens

def main():
    # inicialitzacions
    nombre_paraules = 0
    suma_llargades = 0
    paraula_mes_llarga = ''
    # bucle principal per cada paraula de l'entrada
    for paraula in tokens():
        nombre_paraules = nombre_paraules + 1
        suma_llargades = suma_llargades + len(paraula)
        if len(paraula) > len(paraula_mes_llarga):
            paraula_mes_llarga = paraula
    # escriptura del resultat
    print('nombre de paraules:', nombre_paraules)
    print('llargada mitjana:', suma_llargades /nombre_paraules)
    print('paraula més llarga:', paraula_mes_llarga)


if __name__ == '__main__':
    main()
```

Cal dir que aquest programa només funciona correctament si el poema té almenys una paraula, perquè altrament la llargada mitjana no estaria ben definida.



<Autors autors="jpetit roura"/>
