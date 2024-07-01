# Programes que saluden

👋 Hola, comencem!

<img src='./programes-que-saluden.png' style='height: 10em; margin-left: auto; margin-right: auto; '/>

Aquesta lliçó presenta uns petits programes en Python que saluden educadament a l'usuari que els executa. Pas a pas, aquesta lliçó mostra les instruccions de lectura, d'escriptura i d'assignació. De moment, no cal que instal·leu res al vostre ordinador, ja que els programes s'executen directament dins d'aquesta mateixa pàgina web. Així, podeu provar-los sense cap complicació.

## Primer programa

Aquest és el nostre primer programa en Python:

```python
print('Hola a tothom!')
```

No és gaire impressionant, oi? Només utilitza una instrucció anomenada `print` que escriu el que se li posi entre els parèntesis. Per escriure textos, cal tancar-los entre cometes. Diem que `print` és una **instrucció d'escriptura**, perquè fa que l'ordinador escrigui alguna cosa.

A la petita app que teniu a sota aquest paràgraf, teniu el programa anterior carregat a la finestra de l'esquerra. Piqueu el botó <a href='#' onclick='alert("Aquest triangle no! El de sota (més gros).")' style='all: unset;'>▶</a> per executar-lo!

<PyWeb :code="`print('Hola a tothom!')`" :height="200"/>

Quan piqueu el botó ▶, el programa en Python s'executa i a la finestra de la dreta podeu veure com el programa us saluda. També veieu una indicació (en verd) de que el programa ha acabat.

Ben fàcil, oi? Ja heu executat el vostre primer programa en Python! 👏👏👏

::: info Exercici

Canvieu el missatge de la salutació i torneu a executar el programa picant el botó ▶ per fer una nova prova. Si d'una execució a una altra voleu esborrar la finestra de la dreta, podeu picar el botó ⨂. Si heu canviat el programa de l'esquerra (voluntàriament o no) i voleu restablir l'original, piqueu el botó ↻.

:::

::: info Nota important

Us volia dir que hi ha tres coses importants pel vostre aprenentatge:

1. **Proveu els programes!** Per aprendre a programar, cal veure com funcionen els programes.

1. **Experimenteu!** No tingueu por de provar coses noves.

1. **Feu els exercicis!** No us limiteu a llegir-ne la solució.

:::

## Salutació amb una variable

Ara fem un programa que, al saludar, escrigui el nom de la persona a qui cal saludar. De moment, suposarem que el seu nom és Mireia, després ho farem més personal. El programa és aquest:

```python
nom = 'Mireia'
print('Hola', nom)
```

Piqueu el botó ▶ per executar-lo:

<PyWeb :code="`nom = 'Mireia'
print('Hola', nom)`"  :height="250"/>

Ara el programa escriu el missatge "~~Hola Mireia~~". Com funciona?

Aquest programa està format per dues instruccions:

```python
nom = 'Mireia'
print('Hola', nom)
```

Cada instrucció en Python s'escriu en una línia. Per defecte, l'ordinador executa **seqüencialment** les instruccions, és a dir, una darrera de l'altra, començant des de dalt.

La primera instrucció, `nom = 'Mireia'`, és una **assignació** i serveix per desar un valor en una **variable**. Aquí, el valor és el text `'Mireia'` i la variable és `nom`. Una variable és com un calaixet a la memòria de l'ordinador amb una etiqueta on es desa una dada. En aquest cas, al calaixet té l'etiqueta `nom` i conté el valor `'Mireia'`.

La segona instrucció, `print('Hola', nom)`, ja sabem que és una instrucció d'escriptura. Aquest cop, indica que cal escriure el text `'Hola'` seguit del valor desat a la variable `nom`. Fixeu-vos que per escriure un text cal posar-lo entre cometes, mentre que per escriure el valor d'una variable, cal escriure l'identificador de la variable, sense cometes.

Dins d'una instrucció `print` es poden escriure diferents elements, separant-los amb comes. Quan s'escriuen, es separen amb espais. El `print` també escriu un salt de línia al final.

Per tot això, quan el programa s'executa, aquest escriu una línia que diu "~~Hola Mireia~~".

:::info Exercici
Canvieu el programa perquè ara saludi a una persona anomenada Pep. Comproveu que ho heu fet correctament executant-lo de nou.

::: details Solució

```python
nom = 'Pep'
print('Hola', nom)
```

:::

:::info Exercici
Canvieu el programa perquè ara saludi a la Marta i l'Arnau, desant el valors dels dos noms en dues variables. Comproveu-ho que funciona bé!

::: details Solució

```python
nom1 = 'Marta'
nom2 = 'Arnau'
print('Hola', nom1, 'i', nom2)
```

:::

## Salutació preguntant el nom

Ara voldríem un programa que saludi de forma més personal a l'usuari. Per això, el programa li ha de preguntar primer el seu nom i després saludar-lo, usant aquell nom. El programa corresponent és aquest:

```python
nom = input('Com et dius? ')
print('Hola', nom)
```

La segona instrucció és igual que abans però la primera és diferent. De seguida expliquem què fem. Però, primer, mireu què fa. Ja sabeu: piqueu el botó ▶ de sota per executar-lo.

<PyWeb :code="`nom = input('Com et dius? ')
print('Hola', nom)`"  :height="250"/>

Quan executeu el programa, una caixa de diàleg s'obrirà i us preguntarà el vostre nom, escriviu-lo. A continuació, a la finestra de la dreta podreu veure com el programa us saluda. De fet, a la finestra de la dreta apareix tota la conversa mantinguda. El text en negre és el que escriu l'ordinador, el text en blau el que escriu l'usuari.

Així, si quan el programa em pregunta el meu nom li dic ~~Jordi~~, el programa em contesta ~~Hola Jordi~~. Visca! 🥳

Aquest nou programa és essencialment igual que l'anterior però ara, el valor assignat a la variable `nom` no és incrustat dins del programa, sinó que és el resultat de la funció `input`:

```python
nom = input('Com et dius? ')
```

`input` és una **instrucció de lectura** i serveix per demanar una dada a l'usuari. Entre els parèntesis es pot escriure un text que és un indicador (_prompt_) de la dada que es sol·licita. Quan Python executa un `input`, primer escriu el _prompt_ i després s'espera a llegir una línia que l'usuari introdueix. El valor d'aquesta línia és desat a la variable `nom` gràcies a la instrucció d'assignació.

La segona instrucció d'aquest programa, com al de la secció anterior, escriu la salutació pertinent.

La diferència important entre els dos programes és que, en el cas anterior el valor de la variable sempre era el mateix, mentre que ara, és el valor donat per l'usuari.

Per tant, `print` i `input` permeten la interacció entre l'ordinador i l'usuari: `print` permet escriure, i `input` permet llegir. Fixeu-vos que les instruccions de lectura i d'escriptura adopten el punt de vista de l'ordinador:

-   En una instrucció de lectura, _l'ordinador llegeix_ una informació que _l'usuari escriu_ (segurament al teclat).
-   En una instrucció d'escriptura, _l'ordinador escriu_ una informació que _l'usuari llegeix_ (segurament a la pantalla).

## Exercici

Ara us toca a vosaltres 👩‍💻! Feu un programa que llegeixi el nom de dues persones i saludi a les dues. El programa ha de preguntar dos noms, i realitzar una única salutació als dos. Per exemple, si el primer nom és "~~Marta~~" i el segon és "~~Arnau~~", el programa hauria de contestar "~~Hola Marta i Arnau~~".

Utilitzant com a plantilla el programa anterior, escriviu el programa aquí sota i executeu-lo per tal d'assegurar-vos que funciona bé. Si no us en sortiu (i també si us en sortiu), piqueu el botó ✎ per veure una possible solució. Cliqueu el botó ↻ per restablir la plantilla.

<PyWeb
:code="`nom = input('Com et dius? ')
print('Hola', nom)`
"
:sol="`nom1 = input('Primer nom? ')
nom2 = input('Segona nom? ')
print('Hola', nom1, 'i', nom2)`
"
:height="250"
/>

Espero que no us hagi costat gaire! Quan tingueu dominat aquest tema, feu clic a la pestanya de sota per anar a la següent lliçó.

<Autors autors="jpetit"/>
