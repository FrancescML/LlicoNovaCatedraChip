# Fitxers de text: `fstream`

## Introducció

<img src='./fstream.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó pretén donar una breu descripció sobre la manera de llegir i
escriure fitxers de text en C++.

## Fitxers

En informàtica, un **fitxer** és un recurs que proporciona el sistema operatiu
per poder desar i recuperar dades en un dispositiu d'emmagatzematge. Els fitxers
tipicament es guarden en discos durs o memòries flaix, s'adrecen a través d'un nom
i s'organitzen jeràrquicament en sistemes de fitxers. Actualment, els sistemes
operatius també permeten manipular impressores, connexions de xarxes i altres
dipositius com si fossin fitxers.

![Explorador de fitxers](./explorer.png)

Pel què fa al sistema operatiu, el contingut d'un fitxer és, simplement, una
seqüència de dades. La manera en que s'organitzen aquestes dades depèn del seu
ús. Per exemple, sovint parlem de _fitxers de text_ quan el contingut del
fitxer és un text o codi font, o parlem de _fitxers d'imatges_ quan el
contingut del fitxer conté una imatge. En el primer cas, el format és prou
senzill: la majoria dels caràcters són lletres i símbols i alguns pocs són
caràcters de control (com salts de línia, tabuladors...). En el segon cas,
existeixen diferents formats d'imatges, com ara JPG, PNG, GIF, BMP i cadascun
d'ells descriu a la seva manera els colors de la imatge, potser utilitzant
compressió. Sovint, però no sempre, l'extensió del nom del fitxer descriu el
seu format.

Per a cada fitxer, a banda del seu contingut, el sistema operatiu també desa
algunes meta-dades:

-   nom i extensió del fitxer,
-   talla del fitxer,
-   data i hora de creació i de darrera modificació,
-   propietari del fitxer,
-   drets d'accés al fitxer, ...

## Fitxers de text en C++

La manera més senzilla d'utilitzar fitxers en C++ és a través d'objectes de
les classes `ifstream` i `ofstream`. Els `ifstream`s serveixen per a llegir
fitxers, els `ofstream`s serveixen per a escriure fitxers. També existeixen
`iofstream`s que permeten llegir i escriure alhora, però no en parlarem aquí.

Per utilitzar aquestes classes, cal fer un `#include <fstream>` i,
un `using namespace std;`.

### Exemple d'escriptura d'un fitxer

Considereu aquest fragment de codi per
crear un fitxer que es digui `noms.txt` i que contingui
dues línies de text amb dos noms de persones:

```c++
ofstream f("noms.txt");
f << "Joan" << endl;
f << "Pere" << endl;
f.close();
```

1. Primer es crea un objecte `f` de tipus fitxer
   d'escriptura (`ofstream`) anomenat `noms.txt`.
   Si el fitxer no existia, es crearà buit. Si ja existia, es perdrà el seu contingut
   original i quedarà buit (compte!).

2. Després, es poden escriure dades dins del fitxer utilitzant
   l'operador `<<`, exactament de la mateixa manera que es fa
   amb `cout`. Això no és cap casualitat: el famós `cout`
   no és altre cosa que una variable global que representa
   el fitxer de sortida estàndard. El `endl` continua
   representant el salt de línia.

3. Finalment, es tanca el fitxer `f` amb `f.close()`.

Si ara es mira el contingut del fitxer `noms.txt`
(amb un editor de textos o utilitzant la comanda `cat noms.txt`
en Linux/Mac o `type noms.txt` en Windows) s'obtindrà

```c++text
Joan
Pere
```

### Exemple d'afegiment en un fitxer

Considereu ara aquest fragment de codi que extén el fitxer creat anteriorment
afegint-li ara un enter al seu final:

```c++
ofstream f("noms.txt", ios::app);
f << 23 << endl;
f.close();
```

1. Primer s'obre el fitxer anomenat `noms.txt` utilitzant el mode d'afegiment (`ios::app`).
   En aquest cas,
   si el fitxer no existia, es crea buit. Si ja existia (el nostre cas),
   les següents accions d'escriptura es realitzaran al seu final.

2. Després, s'afageixen dades al fitxer utilitzant el mètode
   l'operador `<<`, com abans. Aquest cop s'hi escriu en enter (23), però
   també s'hi poden escriure caràcters, reals, booleans...

3. Finalment, es tanca el fitxer `f` amb `f.close()`.

Si ara es mira el contingut del fitxer `noms.txt` s'obtindrà

```c++text
Joan
Pere
23
```

### Exemple de lectura d'un fitxer

Considereu ara aquest fragment de codi que obre el fitxer anterior
i en llegeix cada paraula:

```c++
ifstream f("noms.txt");
string s;
while (f >> s) {
    cout << s << endl;
}
f.close()
```

1.  Primer es crea un objecte `f` de tipus fitxer
    de lectura (`ifstream`) de nom `noms.txt`.

2.  Després, es llegeixen seqüencialment paraules del fitxer,
    utilitzant l'operador `>>`, exactament de la mateixa manera que es fa
    amb `cin`. Això no és cap casualitat: el famós `cin`
    no és altre cosa que una variable global que representa
    el fitxer d'entrada estàndard.

3.  Finalment, es tanca el fitxer `f` amb `f.close()`.

### Variacions per la lectura d'un fitxer

En el fragment de codi anterior, el fitxer s'ha llegit
paraula a paraula. Per tant, la primera `s` val
`"Joan"`, la segona `s` val `"Pere"` i
la tercerca `s` val `"23"`. Fixeu-vos que es 23 s'ha llegit
com a text, no com a enter. Si cal, ara s'hauria de convertir
aquest text en un enter (possiblement amb la funció estàndard
`stoi` de la llibreria `<string>`).

Ara bé, igual que amb el `cin`, podem llegir qualsevol tipus
de dades d'un fitxer. Per tant, si sabem que el nostre
fitxer conté dues paraules i en enter podríem fer alguna cosa
com ara la següent:

```c++
string paraula1, paraula2;
int enter;
ifstream f("noms.txt");
f >> paraula1 >> paraula2 >> enter;
f.close()
```

Una altra operació habitual és llegir els fitxers per línies.
Això es pot fer així:

```c++
ifstream f("noms.txt");
string linia;
while (getline(f, linia)) {
    cout << linia << endl;
}
f.close()
```

Aquest bucle realitza una iteració per a cada línia del fitxer `f`,
que llegeix dins del text `linia`, el qual és escrit al cos del bucle.
El bucle `while` acaba quan ja no queden més línies per llegir.
Es pot llegir aquesta construcció com a "_per a cada línia `linia`
en el fitxer `f`, fés ..._".

### Tancament de fitxers

Ja hem dit que quan no es vulgui manipular més un fitxer obert `f`,
cal tancar-lo amb `f.close()`. Ara bé, algunes vegades això no es fa, per dues
possibles raons:

-   Al finalitzar el programa, el sistema operatiu tanca automàticament tots els
    fitxers que aquest hagués obert.

-   Quan la variable `f` es perdi (és a dir, quan acabi el bloc on s'ha
    declarat), el destructor del fitxer ja el tancarà automàticament.

Malgrat això, és una bona pràctica tancar els fitxers tant bon punt ja no es
necessiten més. Això no només evitar malgastar recursos de l'ordinador,
sinó que, a més, assegura que els canvis als fitxers es desin
sense perdre temps.

### Fitxers com a paràmetres

Els fitxers són variables i, per tant, es poden passar com a paràmetres de funcions
i accions. Ara bé, només té sentit fer-ho passant-los per referència. Aquest n'és
un exemple:

```c++
#include <fstream>
#include <vector>
#include <string>
using namespace std;

void desar_productes(ofstream& f, const vector<string>& productes) {
    for (string producte : productes) f << producte << endl;
}

void desar_preus(ofstream& f, const vector<double>& preus) {
    for (double preu : preus) f << preu << endl;
}

void desar(ofstream& f, const vector<string>& productes, const vector<double> preus) {
    desar_productes(f, productes);
    desar_preus(f, preus);
}

int main() {
    vector<string> productes;
    vector<double> preus;
    // ... omplir els vectors ...
    ofstream f("fitxer.txt");
    desar(f, productes, preus);
}
```

## Escriptura i lectura d'objectes

Sovint, volem que els objectes d'una determinada classe es puguin escriure a
fitxers o llegir des de fitxers. I també volem que es puguin llegir amb el
`cin` o escriure amb el `cout`. Per exemple, per a una hipotètica classe
`Punt`, voldríem poder fer

```c++
Punt p(3, 4);
cout << p << endl;
```

per obtenir ~~(3,4)~~ al canal de sortida estàndard i

```c++
ofstream f("punt.txt");
f << p << endl;
f.close();
```

per obtenir ~~(3,4)~~ al fitxer `punt.txt`. De forma similar, voldríem que
l'operador `>>` ens permetés llegir punts en el mateix format, és a dir, amb
les dues coordenades entre parèntesis i separades per una coma.

La manera d'aconseguir això és definir funcions pels operadors `>>` i `<<`
dins de la classe `Punt`. La capçalera de la funció d'escriptura
és un xic intimidant:

```c++
friend ostream& operator<< (ostream& os, const Punt& p);
```

Vegem-ne el significat:

-   La paraula clau `friend` indica que aquest operador no és un mètode
    de la classe, sinó una funció externa a ella, però que té accés a la
    seva part privada. No és gaire important, però s'ha de posar.

-   L'operador té dos paràmetres: un canal de sortida `os` i un punt `p`.

    -   El canal de sortida `os` representa on s'enviarà la dada a escriure
        i és de tipus `ostream`. A través de l'herència, un `ostream` pot ser el `cout`, o un fitxer
        de sortida (`ofstream`), o un canal de text (`ostringstream`)... L'important és
        que s'hi poden escriure coses. Aquest canal de sortida `os` es passa per referència,
        perquè canviarà pel fet de que s'hi escriu quelcom.

    -   El punt `p` denota l'objecte que es vol escriure. Com que es tracta d'una funció
        i no d'un mètode, cal posar-lo explícitament. Com per escriure un punt no es vol
        canviar-lo, es passa per valor (si és petit) o per referència constant
        (si és gran).

    Aquests dos paràmetres són els que hi ha a crides com `cout << p`,
    que utilitza notació infixa.

-   Aquesta funció retorna un canal de sortida per referència (el `ostream&` que hi
    ha a la dreta del `friend`). Es pressuposa que aquest valor retornat és exactament
    el mateix que el primer paràmetre `os`. Això és el que permet encadenar els operadors `<<`
    a construccions com ara `cout << p1 << endl << p2 << endl;` que vol
    dir `(((cout << p1) << endl) << p2) << endl;`.

La implementació acaba sent més senzilla:

```c++
friend ostream& operator<< (ostream& os, const Punt& p) {
    os << '(' << p.x << ',' << p.y << ')';
    return os;
}
```

Bàsicament, hi ha dues instruccions:

1. A la primera, s'escriu a `os` els elements del punt `p` amb el format
   volgut. Aquí és tant senzill com escriure un parèntesi obert,
   la coordenada X, una coma, la coordenada Y i un parèntesi tancat.

2. Es retorna el primer paràmetre (per permetre l'encadanament).

Oli en en llum! I per la lectura?

La capçalera de la funció de lectura és semblant:

```c++
friend istream& operator>> (ostream& is, Punt& p);
```

Vegem-ne el significat:

-   La paraula clau `friend` funciona com abans.

-   L'operador té dos paràmetres: un canal d'entrada `is` i un punt `p`.

    -   El canal d'entrada `is` representa des d'on s'obtindrà la dada a llegir
        i és de tipus `istream`. A través de l'herència, un `istream` pot ser el `cin`, o un fitxer
        de lectura (`ifstream`), o un canal de text (`istringstream`)... L'important és
        que s'hi poden llegir coses. Aquest canal d'entrada `is` es passa per referència,
        perquè canviarà pel fet de que s'hi haurà llegit quelcom.

    -   El punt `p` denota l'objecte que es vol llegir.
        En aquest cas, es passa per referència, perquè volem donar-li un nou valor.

-   Aquesta funció també retorna un canal d'entrada per referència.
    El valor retornat és exactament
    el mateix que el primer paràmetre `is` i permet encadenar els operadors `>>`.

La implementació és aquesta:

```c++
friend istream& operator>> (istream& is, Punt& p) {
    char c;
    is >> c >> p.x >> c >> p.y >> c;
    return is;
}
```

En aquest cas es llegeixen les dades elementals del canal `is` per
deixar les rellevants a `p`, menjant els embellidors amb un caràcter `c`.
Al acabar, es retorna el primer paràmetre (per permetre l'encadanament).

Aquest és el programa complet, incloent alguns exemples d'utilització
i ajuntant en una sola instrucció les lectures o escriptures i el `return`
(penseu perquè es pot fer).

```c++
#include <iostream>
#include <fstream>

using namespace std;

class Punt {

    double x, y;

public:

    Punt(double x, double y) {
        this->x = x;
        this->y = y;
    }

    friend ostream& operator<< (ostream& os, const Punt& p) {
        return os << '(' << p.x << ',' << p.y << ')';
    }

    friend istream& operator>> (istream& is, Punt& p) {
        char c;
        return is >> c >> p.x >> c >> p.y >> c;
    }
};


int main() {
    Punt p(3, 4);

    // escriu el punt al cout
    cout << p << endl;

    // llegeix un punt del cin
    cin >> p;

    // escriu el punt en un fitxer
    ofstream ofs("punt.txt");
    ofs << p << endl;
    ofs.close();

    // llegeix un punt d'un fitxer
    ifstream ifs("punt.txt");
    ifs >> p;
    ifs.close();
}
```

## Tractament d'errors

Sovint dissenyem les nostres aplicacions suposant que les dades d'entrada
tindran el format esperat pel programa. Malauradament, a la vida real hem de
conviure amb usuaris que no fan un ús adient de les aplicacions. Convé que les
aplicacions estiguin preparades per aquests mals usos emetent missatges
d'error informatius i recuperant-se d'aquests errors de manera fiable.

D'entre els molts exemples d'errors que ens podem trobar, n'hem triat alguns
de típics que sovint apareixen:

-   Fitxer inexistent: l'usuari ens especifica un nom de fitxer que no existeix.

-   Format incorrecte: per exemple, l'usuari ens dona el nom d'un objecte (`"taula"`)
    quan el programa esperava llegir un nombre enter.

-   Fi de fitxer: volem llegir dades després d'haver arribar al final del fitxer.

Aquest seria un fragment codi que tractaria amb aquests errors:

```c++
/* Function to process some data from a file.
   Returns true if successful, and false if some error occurred.
*/
bool treat_data(const string& filename) {
    ...
    ifstream f(filename);

    if (not f.is_open()) {
        cerr << "File " << filename << " could not be opened." << endl;
        return false;
    }
    ...
    int x;
    f >> x; // An integer is expected

    if (f.fail()) {
        cerr << "Non-integer data encountered" << endl;
        return false;
    }

    if (f.eof()) {
        cerr << "End-of-file encountered when reading data" << endl;
        return false;
    }
    ...
    // and now treat data as expected
    ...
    return true; // Everything was ok !
}
```

En el codi anterior podem veure que es fa servir `cerr` (canal d'error)
per escriure els missatges d'error. Aquest és el canal preferit per
aquest tipus de missatges.

Les classes que tracten amb _streams_ ofereixen una gran diversitat de mètodes
per a la detecció d'errors. Cal anar als manuals de referència per esbrinar la
manera més adient de tractar cada error.

Finalment, cal esmentar que hi ha una manera més sofisticada per tractar
errors: les
[excepcions](https://en.wikipedia.org/wiki/C%2B%2B#Exception_handling). En
aquesta lliçó no es tracta aquest tema.

<Autors autors="jpetit jordic"/>
