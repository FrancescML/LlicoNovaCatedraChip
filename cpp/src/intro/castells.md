# Aplicació: Castells i catapultes

<img src='././castells.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó presenta una simple modelació amb booleans
de l'èxit o el fracàs d'un atac a un castell medieval.

## El problema

Un castell medieval està assetjat.
Disposem dels valors de l'alçada de les muralles,
i també de l'alçada de les escales dels atacants.
A més, sabem si els atacants tenen o no catapultes,
i quantes pedres grosses poden disparar.

Les regles que regeixen l'èxit de l'atac són:

-   Si els atacants tenen escales més altes que les muralles del castell,
    l'atac té èxit.
-   Si els atacants tenen alguna catapulta i almenys deu pedres grosses, l'atac té èxit.

En qualsevol altre cas, l'atac fracassa.

## La formulació booleana

Les dades que se'ns han donat es poden descriure en C++ d'aquesta forma:

```c++
double alcada_muralles; // alçada de les muralles del castell (en metres)
double alcada_escales; // alçada de les escales dels atacants (en metres)
bool catapultes; // indica si els atacants disposen o no d'alguna catapulta
int pedres; // nombre de pedres grosses disponibles

```

El tipus d'`alcada_muralles` i d'`alcada_escales` s'ha triat com a un real
perquè contenen una mida amb possibles decimals. El tipus de `pedres` s'ha triat com
a un enter perquè, justament, conté un nombre natural (no es poden tenir
tres perdre grosses i quart). El tipus de `catapultes` s'ha triat com a un
booleà, perquè indica la mera presència o no de catapultes.

Suposem que aquestes variables s'han omplert amb unes certes dades.
Ara volem calcular si l'atac té èxit o no,
i guardar-ho en una variable booleana:

```c++
bool atac_amb_exit;         // indica si l'atac al castell té èxit
```

Segons les regles descrites anteriorment,
ens cal fer servir una operació de disjunció (`or`)
per unir les dues condicions.
La primera condició és el resultat d'una comparació:
`alcada_escales > alcada_muralles`.
La segona condició és la conjunció (`and`) de dues nessitats:
la presència de catapultes i l'existència de prou pedres grosses.
Per tant, es pot escriure com `catapultes and pedres >= 10`.

Tot plegat, tenim:

```c++
bool atac_amb_exit = alcada_escales > alcada_muralles or (catapultes and pedres >= 10);
```

Els parèntesis són importants per desambigüar aquesta expressió
de `(alcada_escales > alcada_muralles or catapultes) and pedres`,
que és diferent (i incorrecta segons les nostres regles).

<Autors autors="jpetit roura"/>
