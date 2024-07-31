# Aplicació: Girs i palíndroms

<img src='././palindroms.png' style='height: 6em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra diverses variacions per girar vectors o textos i per
determinar si són o no palíndroms. Per fer-ho, s'sutilitzaran algunes de les
operacions més recurrents al treballar amb vectors.

## Preludi: Intercanviar dos elements d'un vector

Una operació bàsica que sovint voldrem fer servir és la d'intercanviar
el contingut de dues posicions d'un vector. Suposem que tenim el
vector `v = {1, 2, 3, 4, 5}`, i que volem intercanviar
l'enter de la posició 1 (el 2) amb el de la posició 3 (el 4).

A la lliçó de pas de paràmetres per referència ja hem vist com intercanviar
el contingut de dues variables enteres:

```c++c++
void intercanvia(int& a, int& b)
{
	int c = a;
	a = b;
	b = c;
}
```

Doncs ara podem aplicar l'acció `intercanvia` als elements del vector que ens
interessa.

```c++c++
vector<int> v = {1, 2, 3, 4, 5}     // {1,2,3,4,5}
intercanvia(v[1], v[3]);            // {1,4,3,2,5}
```

Aquest exemple mostra com podem treballar amb elements individuals del vector.

## Girar un vector de caràcters

Suposem ara que tenim un vector de `n` caràcters i que volem girar-lo. Per
exemple, el resultat de girar {'a', 'e', 'i', 'o', 'u'} és {'u', 'o', 'i', 'e', 'a'}.

Segurament, el primer
que faríem seria canviar el primer element per l'últim, després el segon pel
penúltim, i així successivament.

Pensem a que equival això en termes d'índexs del vector.
Volem intercanviar l'element a la posició 0 per l'element a la
posició `n - 1`, l'1 pel `n - 2`, etc. És a dir, l'element a la
posició `i` l'intercanviarem per l'element a la posició `n - 1 - i`. Però
compte! A partir de la meitat del vector, si continuem
recorrent el vector i intercanviant elements oposats estarem repetint
els intercanvis, i si seguim fins el final, el resultat serà que el vector
tornarà a estar en l'ordre inicial. Així, el bucle amb què farem
els intercanvis haurà de parar a meitat del vector.

Per saber fins quin índex arribar, va bé pensar alguns exemples senzills:
Per `n = 4`, hem de fer dos intercanvis (fins l'índex `i = 1`). Per `n = 5`,
com que l'element del mig no cal moure'l, també ens es suficient amb
dos intercanvis (de nou fins `i = 1`). Per `n = 6` ja en fan falta 3. Es pot
deduir que en general haurem de parar quan `i >= n / 2 - 1` (notant que
la divisió d'enters retorna la part entera del resultat) és, a dir,
no parant mentre `i < n / 2`. Aquest seria
el programa sencer:

```c++c++
#include <iostream>
#include <vector>
using namespace std;

// intercanvia els valors dels dos paràmetres
void intercanvia(char& a, char& b)
{
	char c = a;
	a = b;
	b = c;
}

int main()
{
	vector<char> v = {'a', 'e', 'i', 'o', 'u'};  // {a,e,i,o,u}
	int n = v.size();
    // gira el vector v
	for (int i = 0; i < n / 2; ++i) {
		intercanvia(v[i], v[n - 1 - i]);
	}
    // escriu el vector v ({u,o,i,e,a})
	for (char x : v) {
        cout << x << endl;
    }
}
```

Abans hem vist l'equivalència entre vectors de caràcters i textos.
Així, el mateix programa principal es podria escriure com segueix:

```c++c++
int main()
{
	string v = "aeiou";         // {a,e,i,o,u}
	int n = v.size();
	for (int i = 0; i < n / 2; ++i) {
		intercanvia(v[i], v[n - 1 - i]);
	}
    // escriu el text v ("uoiea")
	cout << v << endl;
}
```

De fet, podríem encapsular aquesta operació de girar un text en una acció per
poder-la aprofitar més fàcilment. Al programa següent, l'acció `girar()` gira el
text `s` que se li passa com a paràmetre (per referència, és clar). El
programa principal l'utilitza per escriure un text donat del revés.

```c++c++
// gira el text en s (deixa s del revés)
void girar(string& s)
{
    int n = s.size();
	for (int i = 0; i < n / 2; ++i) {
		intercanvia(s[i], s[n - 1 - i]);
	}
}

int main()
{
	string t;
    cin >> t;
    girar(t);
    cout << t << endl;
}
```

Alternativament, podríem haver-ho encapsulat en uan funció que, donat un text,
el retorna girat (sense modifica el seu paràmetre):

```c++c++
// retorna s girat (retorna s del revés, sense modificar s)
string girat(string s)
{
    girar(s);
	return s;
}

int main()
{
	string t;
	cin >> t;
    cout << girat(t) << endl;
}
```

Com que `girar` modifica el seu paràmetre, hem triat que el paràmetre de `girat`
es passi per valor (és a dir, que s'en faci una còpia).

## Comprovar si un mot és palíndrom

Un mot és un palíndrom si, girant-lo, obtenim el mot original.
Per exemple, `"pep"`, `"anna"` i `"tururut"` són mots palíndroms, però `"pepa"` no ho és.

Per saber si un text és un palíndrom, podríem girar-lo i comparar-lo amb
l'original. La funció següent indica si un text donat és o no un palíndrom
utilitzant la funció `girat()` escrita abans:

```c++c++
// indica si mot és un palíndrom
bool es_mot_palindrom(const string& mot)
{
    return girat(mot) == mot;
}
```

Que fàcil i clar! No obstant, això és fer massa feina, ja que una cerca és suficient:
Podem fer la comparació sense necessitat de girar el text, fent el mateix que
abans però substituint la funció `intercanvia()` per una comparació (`==` o
`!=`) que ens indiqui si els elements en índexs oposats són iguals. Si en algún
moment trobem dos elements oposats que no són iguals, el text no serà palíndrom.
Aquí ho teniu:

```c++c++
// indica si mot és un palíndrom
bool es_mot_palindrom(const string& mot)
{
	int n = mot.size();
	for (int i = 0; i < n/2; ++i) {
		if (mot[i] != mot[n - 1 - i]) {
            return false;
        }
	}
	return true;
}
```

## Comprovar si una frase és palindròmica

Una frase és palindròmica si es llegeix igual del dret que del revés, tot ignorant
els espais. Per exemple _"el bo plau al poble"_ és una frase palindròmica.

Per determinar si una frase emmagatzemada en un text és palindròmica, podem fer
com abans, però com que cal saltar els espais de forma no simètrica,
utilitzarem dos índexos: Un índex `i` anirà recorrent els caràcters del text
d'esquerra a dreta, i in índex `j` anirà recorrent els caràcters del text de
dreta a esquerra. Quan ambdós es trobin, ja haurem acabat. Abans de comparar
lletres, ens assegurem de saltar els blancs.

Aquesta és la implementació:

```c++c++
// indica si frase és una frase palindròmica
bool es_frase_palindromica(const string& frase)
{
	int n = mot.size();
	int i = 0;
    int j = n - 1;
    while (i < j) {
        while (frase[i] == ' ') ++i;
        while (frase[j] == ' ') --j;
        if (frase[i] != frase[j]) return false;
        ++i;
        --j;
    }
	return true;
}
```

<Autors autors="jpetit rafah"/>
