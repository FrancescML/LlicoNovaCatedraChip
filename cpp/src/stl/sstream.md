# Canals de textos: `sstream`

## Introducció

<img src='./sstream.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

De la mateixa forma que es poden llegir dades amb `cin` des del canal
estàndard d'entrada, es poden llegir seqüencialment dades que es troben
emmagatzemades en un text (`string`) a través d'un objecte de tipus
`istringstream`. Els objectes `istringstream` ofereixen les mateixes
operacions de lectura que `cin`, en particular els operadors `>>`.

Anàlogament, enlloc d'escriure dades al canal estàndard de sortida amb `cout`,
es poden escriure dades que s'aniràn emmagatzemant seqüencialment en un canal
a través d'un objecte de tipus `ostringstream`. Els objectes `ostringstream`
ofereixen les mateixes operacions d'escriptura que `cout` i `cerr`, en
particular els operadors `<<`. Un cop totes les dades han estat escrites al
canal, aquestes es poden consultar com a un únic text.

Per usar `istringstream`s i `ostringstream`s, cal fer un `#include <sstream>`.
Els següents exemples expliquen i concreten el seu ús.

## Exemple: Lectura d'una operació senzilla

Suposem que tenim una variable `s` que té un valor que representa
una operació senzilla com ara `"21.45 * 56.23"`
i que en volem extreure els seus dos operands reals (`21.45` i
`56.23`) i el seu operador (`'*'`). El que ens cal és llegir seqüencialment
de `s` tres valors:

1. el primer operand (de tipus real),
2. l'operador (de tipus caràcter) i,
3. el segon operand (de tipus real).

Per a fer-ho, declarem una variable `iss` de tipus `istringstream`
que actui com a canal de les dades emmagatzemades en `s` i després li apliquem
les tres lectures requerides:

```c++
string s = "21.45 \* 56.23";
istringstream iss(s);
double operand1, operand2;
char operador;
iss >> operand1 >> operador >> operand2;

```

Així de senzill!

## Exemple: Sumar nombres a cada línia

Considerem que tenim una fitxer compost de diferents linies i que cada
línia conté una seqüència d'enters. Es vol obtenir la suma dels nombres
de cada línia. Per exemple, si l'entrada és

```text
56 12
1 2 3

9 1 1 14
```

la sortida hauria de ser

```text
68
6
0
25
```

És clar que només llegint enters amb `>>` des de `cin` no podrem solucionar el problema,
perquè aquesta lectura salta els blancs (tant els separadors com els salts de línia)
i, per tant, no podem saber on acaba cada línia.

Una manera de resoldre-ho és utilitzant la lectura per línies. Recordeu que
`getline(cin, s)` llegeix la següent línia de `cin` i la desa en un `string`
`s`. A més, aquesta funció retorna `true` si ha pogut llegir la línia en
qüestió i retorna `false` quan l'entrada ha acabat.

Per poder sumar tots els valors dins d'aquest text, es pot crear una nova variable
`iss` de tipus `istringstream` sobre cada línia llegida `s` i aplicar
sobre `iss` els operadors de lectura `>>` habituals per obtenir-ne
tots els seus enters, tot acumulant-los.

El programa sencer és aquest:

```c++
#include <sstream>
#include <iostream>
#include <string>
using namespace std;

int main() {
    string s;
    while (getline(cin, s)) {
        istringstream iss(s);
        int sum = 0;
        int x;
        while (iss >> x) sum += x;
        cout << sum << endl;
    }
}
```

## Exemple: Convertir un enter en un text

Sovint es vol convertir un enter (`int`) en un text (`string`). La funció següent
ho fa tot utilitzant un `ostringstream`:

```c++
string int_to_str(int x) {
    ostringstream oss;
    oss << x;
    return oss.str();
}
```

Primer, es declara un objecte `oss` de tipus `ostringstream` que serà el canal on es
dipositaràn les dades. A continuació, s'escriu l'enter `x` a `oss` (de forma semblant
a com es faria amb `cout`, però l'efecte és que ara no s'escriu res pel canal
de sortida, sinó que va a parar el canal `oss`). Finalment, es recupera la informació
escrita en `oss` com a text, utilitzant el seu mètode `str()`.

💡 De fet, la funció estàndard `to_string()` ja fa aquesta tasca per a tots els tipus
bàsics; vegeu-ne la documentació a
[cppreference](http://en.cppreference.com/w/cpp/string/basic_string/to_string).

## Exemple: Convertir entre una estructura i un text

Considerem que tenim un tipus de dades (de joguina!) per emmagatzemar la
informació d'un pacient en alguna aplicació mèdica:

```c++
struct Pacient {
    int dni;
    string nom;
    int edat;
    double pes;
    double alçada;
    vector<int> id_metges;      // identificadors dels metges que l'han tractat
};
```

La funció `pacient_to_string()` següent utilitza un `ostringstream` per codificar
les dades d'un pacient en un text fàcilment llegible tot separant cada camp
amb barres i agrupant entre parèntesis la llista dels identificadors dels seus
metges.

```c++
string pacient_to_string(const Pacient& p) {
    ostringstream oss;
    oss << p.dni << " / " << p.nom << " / " << p.edat << " / " << p.pes << " / " << p.alçada << " / ";
    for (auto id : p.id_metges) {
        oss << id << " ";
    }
    oss << "/";
    return oss.str();
}
```

Per fer el pas invers, la funció `string_to_pacient()` següent utilitza un `istringstream`:

```c++
Pacient string_to_pacient(const string& s) {
    Pacient p;
    char c;
    istringstream iss;
    iss >> p.nom >> c >> p.nom >> c >> p.edat >> c >> p.pes >> c >> p.alçada >> c;
    int id;
    while (iss >> id) {
        p.id_metges.push_back(id);
    }
    return p;
}
```

Fixeu-vos que el caràcter `c` serveix per anar llegint les barres que separen els elements
i que, per simplicitat, no s'ha realitzat cap control d'errors.

<Autors autors="jpetit"/>
