# Exemples d'accions

<img src='./exemples-accions.png' style='height: 9em; float: right; margin: 0 0 1em 1em;'/>

En aquesta lliçó es presenten diversos exemples d'accions.

## Acció per escriure tots els divisors d'un nombre

Ja hem fet un programa que escriu tots els divisors d'un nombre. Era aquest:

```python
from yogi import read

n = read(int)
d = 1
while d * d < n:
    if n % d == 0:
        print(d)
        print(n // d)
    d = d + 1
if d * d == n:
    print(d)
```

Recordeu que aquest programa aprofita el truc dels "dos divisors pel preu d'un": només cal cercar divisors d'un nombre `n` fins a `√n`, perquè si `d` divideix `n`, llavors `n // d` també dividix `n` i si `n <= √n` llavors `n // d >= √n`.

Encapsular aquest algorisme en una acció no és gens difícil:

```python
def escriure_divisors(n: int) -> None:
    """Escriu tots els divisors d'un nombre n > 0."""

    d = 1
    while d * d < n:
        if n % d == 0:
            print(d)
            print(n // d)
        d = d + 1
    if d * d == n:
        print(d)
```

Però, posats a fer un subprograma que du a terme aquesta tasca, no seria bo que els nombres s'escrivissin en ordre creixent? Penseu com fer-ho!

Una bona solució és usar dos bucles: un pels divisors "petits" fins a `√n`, l'altre pels divisors "grans" a partir d'`√n`. Però per no perdre eficiència, el segon ha de buscar de nou divisors "petits" de major a menor per recuperar els "grans". Aquest algorisme es podria implementar així:

```python
def escriure_divisors(n: int) -> None:
    """Escriu tots els divisors d'un nombre n > 0 en ordre creixent."""

    d = 1
    while d * d < n:
        if n % d == 0:
            print(d)
        d = d + 1
     if d * d == n:
        print(d)
     d = d - 1
     while d >= 1:
        if n % d == 0:
            print(n // d)
        d = d - 1
```

Per provar aquesta acció, seria bo fer un joc de proves amb nombres petits que puguin presentar casos extrems com ara de l'1 al 5, casos normals com ara el 56, i casos on el nombre sigui un quadrat perfecte com ara 25 i 49, per tal de comprovar que no es repeteix la seva arrel a la sortida.

## Acció per escriure tots els factors primers d'un nombre

Considerem ara un problema relacionat amb l'anterior però amb una solució una mica diferent: Donat un enter `n` amb `n` ≥ 2, cal escriure, en ordre creixent i sense repeticions, tots els seus factors primers. Per exemple, per el nombre 42 cal escriure 2, 3, 7 i per el nombre 2772 cal escriure 2, 3, 7, 11 perquè 2772 = 2²·3²·7·11.

La capçalera de l'acció que du a terme aquesta tasca podria ser aquesta:

```python
def escriure_factors_primers(n: int) -> None:
    """Escriu tots els factors primers d'un nombre n > 1 en ordre estrictament creixent."""
```

Un primer algorisme per resoldre aquesta tasca consisteix en anar provant de dividir el nombre `n` per nombres `d` de 2 en endavant. Quan trobem que `d` divideixi `n`, escriurem `d` perquè és un dels seus factors primers (de seguida veureu perquè) i divirem `n` per `d` tantes vegades com calgui per treure-li totes les potències de `d`. Aquest procés cal repetir-lo fins que `n` sigui 1 (perquè llavors ja no es podràn descobrir més factors primers), després d'incrementar `d`. El fet que els potencials divisors es tractin de petit a gran i que s'eliminin del nombre `n` garanteix que només s'escriguin factors primers.

Aquest algorisme es pot implementar així dins de l'acció proposada:

```python
def escriure_factors_primers(n: int) -> None:
    """Escriu tots els factors primers d'un nombre n > 1 en ordre estrictament creixent."""

    d = 2
    while n != 1:
        if n % d == 0:
            print(d)
            while n % d == 0:
                n = n // d
        d = d + 1
```

L'algorisme dóna els resultats esperats, però proveu-lo amb el número 200000014: De seguida escriu el seu factor primer 2 però triga molt en escriure el seu altre factor primer 100000007. En el meu ordinador triga uns 13 segons (sí: 13 segons davant d'un ordinador és molt 🐌). No es podria fer més ràpid?

Un cop més, podem fer ús que no trobarem cap divisor de `n` més gran que la seva arrel si ja li hem tret tots els divisors menors o iguals que l'arrel. Per tant, enlloc de fer que el bucle vagi buscant divisors `d` molt grans fins que `n` sigui 1, es pot fer que el bucle acabi quan `d > √n`. Però, compte, llavors encara pot ser que el valor actual d'`n` sigui un nombre primer i calgui escriure'l. Aquesta és la nova versió de l'acció amb aquesta millora.

```python
def escriure_factors_primers(n: int) -> None:
    """Escriu tots els factors primers d'un nombre n > 1 en ordre estrictament creixent."""

    d = 2
    while d * d <= n:
        if n % d == 0:
            print(d)
            while n % d == 0:
                n = n // d
        d = d + 1
    if n != 1:
        print(n)
```

Ara, el meu ordinador triga 5 centèssimes de segon en escriure els factors primers de 200000014. Una bona millora sobre els 13 segons anteriors!

<Autors autors="jpetit"/>
