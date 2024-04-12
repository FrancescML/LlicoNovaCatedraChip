# Condicionals


<img src='./if-then-else.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Aquest lliçó presenta la instrucció condicional, que permet
que l'ordinador executi certes instruccions o unes altres
depenent de si es dóna o no una determinada condició.


## Màxim de dos enters

Volem fer un programa que llegeixi dos enters, diguem-ne `a`i `b`, i
que escrigui un enter, diguem-ne `m`, que sigui el més gran entre `a`
i `b` (és a dir, el màxim d'`a` i `b`).

Utilitzant com a patró un programa anterior, podem escriure un programa
quasi complet com aquest:

```c++
#include <iostream>
using namespace std;

int main() {
    int a, b;               // Declaració de les variables d'entrada
    cin >> a >> b;          // Lectura de les dades d'entrada
    int m;                  // Declaració de la variable de sortida
    /* 🚧 */                // Càlcul del resultat
    cout << m << endl;      // Escriptura de la dada de sortida
}
```

El programa no està acabat, perquè encara no hem precisat com es calcula el resultat,
és a dir, quin ha de ser el valor d'`m` en funció dels valors d'`a` i de `b`. Com fer-ho?

Com que no hi ha cap operador que calculi directament el màxim entre dos nombres,
utilitzarem una **instrucció condicional**, la qual permet
executar una instrucció o una altra depenent d'una certa condició.
En C++ la instrucció condicional s'escriu usant les paraules clau `if`
i `else`, de la forma següent:

```c++
if (⟨Condició⟩) {
    ⟨Instruccions_SÍ⟩
} else {
    ⟨Instruccions_NO⟩
}
```

El funcionament és senzill: Si es compleix la ⟨Condició⟩, s'executa
el bloc d'⟨Instruccions_SÍ⟩;
altrament, s'executa el bloc d'⟨Instruccions_NO⟩.
El diagrama de flux següent mostra el funcionament de la instrució
condicional:

<div id='flow-if-then-else'></div>

<script type='text/coffeescript' src='./flow-if-then-else.coffee'></script>

<br>

A més, la part de l'`else`
és opcional: si no es proporciona, no es farà res quan no es compleixi la condició.
El diagrama de flux següent mostra el funcionament de la instrució
condicional sense `else`:

<div id='flow-if-then'></div>

<script type='text/coffeescript' src='./flow-if-then.coffee'></script>

<br>


Així, per calcular el màxim entre `a` i `b`, podem utilitzar la instrucció condicional
de la forma següent:

```c++
    if (a > b) {
        m = a;
    } else {
        m = b;
    }
```

Aquest fragment diu que quan el valor d'`a` sigui més gran que el de `b`,
cal copiar el valor d'`a` a la variable `m`. Altrament (és a dir, quan
el valor d'`a` sigui menor o igual que el de `b`), cal copiar el valor
de `b` a la variable `m`. En qualsevol dels dos casos, el valor final de `m`
serà el màxim entre els valors d'`a` i de `b`, tal com cal.

El programa complet queda doncs així:

```c++
#include <iostream>
using namespace std;

int main() {
    int a, b;               // Declaració de les variables d'entrada
    cin >> a >> b;          // Lectura de les dades d'entrada
    int m;                  // Declaració de la variable de sortida
    if (a > b) {            // Càlcul del resultat
        m = a;
    } else {
        m = b;
    }
    cout << m << endl;      // Escriptura de la dada de sortida
}
```

En aquest programa hem escrit la condició de la instrucció condicional utilitzant l'operador
`>`, que indica si el primer valor és més gran que el segon. També existeixen els operadors
`<` (més petit que), `>=` (més gran o igual que), `<=` (més petit o igual que),
`==` (igual que) i `!=` (diferent de).

👁️
Fixeu-vos que `x == y` (amb dos iguals)
compara si els valors de `x` i de `y` són iguals,
mentre que `x = y;` (amb un sol igual) copia a `x` el valor de `y`.


## Exercici

A continuació presentem algunes alternatives pel programa
anterior. Podrieu diferenciar les correctes de les incorrectes? A sota teniu un test
per demostrar la vostra vàlua!


```c++
if (a >= b) {     // Fragment 1
    m = a;
} else {
    m = b;
}
```


```c++
if (a < b) {      // Fragment 2
    m = b;
} else {
    m = a;
}
```


```c++
if (a <= b) {     // Fragment 3
    m = b;
} else {
    m = a;
}
```


```c++
if (a > b) {      // Fragment 4
    m = a;
}
if (b >= a) {
    m = b;
}

```c++

```c++
if (a > b) {      // Fragment 5
    m = a;
}
if (a < b) {
    m = b;
}
```



<div id='quiz'></div>


<script type="text/coffeescript">

q =
  type: "MultipleChoice"
  text: "Quins dels fragments següents són correctes (és a dir, deixen en `m` el màxim d'entre `a` i `b`)?"
  choices: [
      text: "Fragment 1"
      correct: true
    ,
      text: "Fragment 2"
      correct: true
    ,
      text: "Fragment 3"
      correct: true
    ,
      text: "Fragment 4"
      correct: true
    ,
      text: "Fragment 5"
      correct: false
  ]

window.quiz q, "quiz"

</script>



## Mínim i màxim de dos enters

Suposem que ara volem fer un programa que llegeixi dos nombres,
i que n'escrigui el mínim i el màxim en una línia,
separats amb un espai.
Aquesta n'és una possible solució (noteu que ja ometem sovint el
preàmbul per estalviar espai):

```c++
int main() {
    int a, b;
    cin >> a >> b;
    int minim, maxim;
    if (a < b) {
        minim = a;
        maxim = b;
    } else {
        minim = b;
        maxim = a;
    }
    cout << minim << " " << maxim << endl;
}
```

Una altra possible implementació seria prescindir de les variables
`maxim` i `minim` i escriure els valor d'`a` i `b`
en l'ordre correcte:

```c++
int main() {
    int a, b;
    cin >> a >> b;
    if (a < b) {
        cout << a << " " << b << endl;
    } else {
        cout << b << " " << a << endl;
    }
}
```

Per a un programa tan curt com aquest, qualsevol de les solucions és
igualment acceptable, però en programes un xic més llargs sovint és convenient
no barrejar els càlculs amb l'escriptura dels resultats.

Finalment, presentem una tercera solució,
que sempre escriu `a` i `b` en aquest ordre,
suposant que `a` conté el mínim i que `b` conté el màxim.
Si no fos, així, prèviament n'intercanvia els valors:

```c++
int main() {
    int a, b;
    cin >> a >> b;
    if (a > b) {
        int c = a;
        a = b;
        b = c;
    }
    cout << a << " " << b << endl;
}
```
Suposem que `a` conté un 8, i que `b` conté un 5.
El codi dins del condicional,
```
        int c = a;
        a = b;
        b = c;
```
primer desa el 8 a una variable auxiliar `c`,
després copia el 5 dins d'`a`,
i després copia el 8 (del qual havíem fet una còpia per no perdre'l) dins de `b`.
Efectivament, el resultat global és un intercanvi dels valors d'`a` i `b`.
Cal mencionar que la variable auxiliar `c`,
que després del condicional no ens interessa per res,
de fet desapareix quan acaba el condicional.
En altres paraules, si reemplacéssim l'última línia per aquesta:
```
    cout << a << " " << c << endl;
```
el compilador ens diria que aquí la `c` ja no existeix.


## Màxim de quatre enters

Ara suposem que volem fer un programa que llegeixi quatre nombres,
i que n'escrigui el màxim. Aquesta és una solució possible:

```c++
int main() {
    int a, b, c, d;
    cin >> a >> b >> c >> d;
    if (b > a) {
        a = b;
    }
    if (c > a) {
        a = c;
    }
    if (d > a) {
        a = d;
    }
    cout << a << endl;
}
```

Fixem-nos en el primer `if`:

```c++
    if (b > a) {
        a = b;
    }
```

El que fa aquesta línia és actualitzar el valor d'`a` si `b` és més gran.
Altrament, no fa res (perquè no hi ha la branca de l'`else`;
recordeu que és opcional).
El resultat és que després d'executar aquesta línia,
`a` conté el màxim entre els valors inicials d'`a` i de `b`.
Similarment, després del segon `if`,
`a` conté el màxim entre els valors inicials d'`a`, `b` i `c`.
I, després de l'últim `if`,
`a` conté el màxim dels quatre nombres llegits,
és a dir, el resultat demanat,
que ja es pot escriure.

En aquesta solució no hem usat explícitament cap variable per guardar la
sortida, sinó que hem aprofitat una de les variables d'entrada per fer-ho
(`a`, concretament). Això és lícit en aquest cas, perquè el valor original de les
variables d'entrada no ens cal guardar-lo.


## Indentació i blocs amb una sola instrucció

Segurament ja heu vist que quan s'escriuen programes, cada cop que s'obre un bloc
(amb una clau oberta `{`), s'escriuen les instruccions successives més cap a la
dreta (quatres espais en el nostre cas) fins que es tanca el bloc
(amb una clau tancada `}`), moment en el qual es recupera l'espaiat original.
Aquesta tècnica, anomenada **indentació**, permet que l'estructura del programa
sigui més senzilla de llegir i us heu d'acostumar a utilitzar-la.

De fet, per fer que els codis quedin una mica més curts, C++ permet obviar
les claus (`{` i `}`) dels blocs d'instruccions que contenen *una sola*
instrucció. Així, enlloc d'escriure

```c++
    if (b > a) {
        a = b;
    }
```

es pot escriure

```c++
    if (b > a) a = b;
```

Aleshores, el programa anterior pren la forma següent:

```c++
int main() {
    int a, b, c, d;
    cin >> a >> b >> c >> d;
    if (b > a) a = b;
    if (c > a) a = c;
    if (d > a) a = d;
    cout << a << endl;
}
```



<Autors autors="jpetit roura"/>

