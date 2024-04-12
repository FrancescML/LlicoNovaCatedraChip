# Programa que calculen

<img src='./programes-que-calculen.png' style='height: 10em;'/>

Aquesta lliçó presenta nous programes en Python per fer càlculs com el producte de dos nombres donats per l'usuari. Per a fer-lo, veurem com llegir dades numèriques i com realitzar operacions aritmètiques. De passada, també s'introdueix el concepte de comentari. Com a exercici, es demana de fer una variació del programa que calculi la suma de tres nombres.

## Càlcul de productes

Aquest és un nou programa en Python:

```python
# Calculadora de productes.

# lectura de les dades d'entrada
x = int(input('Digues un número: '))
y = int(input('Digues un altre número: '))

# càlcul del producte
p = x * y

# escriptura de la dada de sortida
print('El producte és', p)
```

És una mena de calculadora molt senzilla, que només llegeix dos nombres i n'escriu el seu producte. Com abans, primer anem a veure què fa: Piqueu el botó ▶!

<PyWeb
:code="`\# Calculadora de productes.\n
\# lectura de les dades d'entrada
x = int(input('Digues un número: '))
y = int(input('Digues un altre número: '))\n
\# càlcul del producte
p = x * y\n
\# escriptura de la dada de sortida
print('El producte és', p)`"
:height="400"
/>

Quan piqueu el botó ▶, el programa en Python es comença a executar. Una finestra s'obrirà i us preguntarà per un primer número. Després una altra finestra s'obrirà i us preguntarà pel segon primer número. Finalment, a la finestra de la dreta podreu veure el producte dels dos números donats.

Així, si entro `12` com a primer número i `5` com a segon número, l'ordinador m'informa que el seu producte és `60`.

Torneu a executar el programa picant el botó ▶ i feu una nova prova. Per exemple, proveu de multiplicar dos números grans, com ara 4377678463 per 817287427844233.

Meravellós, oi?

## Explicació del programa

Per tal de poder entendre què fa aquest programa, primer hem de tenir en compte aquests elements nous:

-   Els programes contenen **comentaris**: fragments de text que documenten alguna part del programa i que són ignorats per l'ordinador. L'ús adequat dels comentaris fa que la comprensió i manteniment dels programes sigui més fàcil per part dels humans. En Python els comentaris comencen amb el símbol `#` i acaben al final de la línia.

-   Les línies en blanc tampoc tenen importància en els programes en Python, però igual que quan escrivim separem les idees en paràgrafs, també deixem línies en blanc per separar diferents parts dels programes. Això fa que els programes siguin més clars i menys atapeïts. A l'ordinador això no li importa però els programes no només són executats per màquines, també són llegits per humans que mereixen la nostra consideració.

-   Els diferents colors que podeu veure als programes només són per facilitar-ne la comprensió quan es llegeixen. Com els comentaris, aquestes coloraines no afecten el significat del programa. Però al contrari dels comentaris, que són escrits pels programadors, els colors són generats automàticament per l'ordinador (i no són sempre els mateixos entre diferents sistemes).

Així doncs, per l'ordinador, el fragment realment important del programa anterior és aquest:

```python
x = int(input('Digues un número: '))
y = int(input('Digues un altre número: '))
p = x * y
print('El producte és', p)
```

El programa està format doncs per quatre instruccions. Com sabeu, cada instrucció en Python s'escriu en una línia i l'ordinador executa les instruccions seqüencialment.

Per tal de poder entendre què fa aquest programa, donem una descripció informal de cada instrucció, en l'ordre en què es duen a terme:

1. La primera instrucció, `x = int(input('Digues un número: '))` ja sabeu que serveix per demanar una dada i desar-la en una variable. Aquest cop, però, com que la dada que volem és numèrica, embolcallem l'`input` dins d'un `int()`. Quan l'ordinador executa aquesta instrucció, primer escriu el text "~~Digues un número:~~" i després llegeix un text que escriu l'usuari. Aquest text és convertit a un valor enter (amb l'`int()`) i desat en la variable `x`. Simplement recordeu que, per ara, aquesta és la forma de llegir dades numèriques.

2. La segona instrucció, `y = int(input('Digues un altre número: '))` és una segona instrucció anàloga a l'anterior i fa que l'ordinador pregunti quin és el segon número i el desi a la variable `y`.

3. La tercera instrucció, `p = x * y` calcula el producte dels valors que es troben desats a les variables `x` i `y` i desa el resultat en una nova variable anomenada `p` a través d'una instrucció d'assignació. En Python (i en informàtica, en general), l'operador de producte s'escriu amb un asterisc: `*`.

4. La quarta i darrera línia, `print('El producte és', p)` és una **instrucció d'escriptura**: indica que cal escriure el text `'El producte és'` seguit del valor desat a la variable `p`.

En aquest programa podem veure doncs que `x` i `y` es corresponen a les dades d'entrada del nostre problema, i que `p` és la dada de sortida. No ha calgut descriure cap algorisme per calcular `p` a partir de `x` i `y`, ja que en Python el producte (`*`) és una operació bàsica que l'ordinador realitza directament.

Les operacions aritmètiques bàsiques que es poden aplicar entre dos enters són:

| operació                    | operador |
| --------------------------- | -------- |
| suma                        | `+`      |
| resta                       | `-`      |
| producte                    | `*`      |
| divisió entera              | `//`     |
| residu de la divisió entera | `%`      |
| exponenciació               | `**`     |

Com és habitual en matemàtiques, les **expressions** com ara `x * y` o `E - (m * c**2)` combinen valors, variables i operadors i poden utilitzar parèntesis per agrupar operacions. Més endavant veurem més detalls sobre les expressions i totes aquestes operacions.

## Exercici

Ara us toca a vosaltres! Utilitzant com a plantilla el programa anterior, feu un programa que pregunti per tres enters i n'escrigui la seva suma. Per exemple, si el programa llegeix 12, 20 i 3 haurà d'escriure 35.

Espero que ho us en sortiu! Aquest cop cal llegir tres números i calcular la seva suma. No oblideu ajustar els comentaris.

<PyWeb
:sol="`\# Calculadora de sumes.\n
\# lectura de les dades d'entrada
x = int(input('Digues un primer número: '))
y = int(input('Digues un segon número: '))\n
z = int(input('Digues un tercer número: '))\n
\# càlcul de la suma
s = x + y + z\n
\# escriptura de la dada de sortida
print('La seva suma és', s)`"
:height="400"/>
