# Accions

<img src='././accions.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó introdueix les accions, un nou tipus
de subprograma, semblant a les funcions. Una **acció** és un subprograma que
produeix uns efectes laterals durant la seva execució. En aquesta lliçó ens
fixarem en accions que tenen com a efecte produir una sortida i, en una
propera lliçó, extendrem l'abast de les accions gràcies als paràmetres per
referència.

## Escriptura de rectangles

Suposem que volem fer un programa per escriure un rectangle amb $m\times n$ asteríscos.
Per exemple, aquest és un rectangle $3\times4$:

```c++text

---

---

---

```

Segurament la solució més senzilla és aquesta:

```c++
int main() {
    // llegir el nombre de files i columnes
    int m, n;
    cin >> m >> n;
    // escriure un rectangle amb m × n asteríscos
    for (int i = 1; i <= m; ++i) {
        for (int j = 1; j <= n; ++j) {
            cout << '*';
        }
        cout << endl;
    }
}
```

Clar i curt! Primer, es llegeix el nombre de files (`m`) i de columnes
(`n`). Després, per a cada fila `i`, per a tota `i` entre 1 i `m`, s'escriu la fila
corresponent, que s'obté escrivint un asterísc per a cada columna `j`, per a tota
`j` entre 1 i `j`.

Però, [com ja hem vist](dibuixos.html), els programes escrits d'aquesta forma
de seguida es tornen una mica més complicats del que hom voldria. Quan
dibuixem formes, els valors d'inici de les variables com ara `i` i de les `j`
són delicats, i haver-los de mantenir tots alhora es fa més i més difícil quan
el nombre de línies del programa augmenta. Partir el programa en diferents
subprogrames podria ser una manera de simplicar-lo.

Per a fer-ho, decidim que un subprograma s'ocupi de la part
corresponent a escriure el rectangle:

```c++
int main() {
    // llegir el nombre de files i columnes
    int m, n;
    cin >> m >> n;

    escriure_rectangle(m, n);
}
```

Bàsicament, hem substituit el codi que escrivia el rectangle per la invocació
d'un subprograma anomenat `escriure_rectangle` que reb dos paràmetres: el
nombre de files i el nombre de columnes que ha de tenir el rectangle.

Aquí, `escriure_rectangle(m, n);` és semblant a la invocació d'una funció,
però al contrari de les funcions, aquesta invocació no forma part d'una
expressió sinó que és com una gran instrucció. Això és perquè aquesta
invocació no recull cap resultat sinó que provoca un determinat efecte. En
aquest cas, l'efecte provocat és l'escriptura d'un rectangle pel canal de
sortida. Per això, parlem d'**acció** i no de **funció**.

Els subprogrames corresponents a accions es defineixen de forma semblant als
de les funcions. Però com que les accions no retornen cap resultat,
la seva capçalera indica que el tipus retornat és `void`, que en anglès vol
dir _res_ i a dins de la seva definició no tenen cap `return` amb un valor:

```c++
// Acció que escriu un rectangle amb files × columnes asteríscos.
void escriure_rectangle(int files, int columnes) {
    for (int i = 1; i <= files; ++i) {
        for (int j = 1; j <= columnes; ++j) {
            cout << '*';
        }
        cout << endl;
    }
}
```

Fixeu-vos que, igual que per les funcions, els noms dels paràmetres formals de
les accions no tenen perquè correspondre amb els dels paràmetres reals que
s'utilitzen a l'hora d'invocar-les.

Gràcies a la introducció de l'acció `escriure_rectangle`, el programa
principal ha quedat més senzill i, en el futur, quan volguem escriure
rectangles, podrem aprofitar aquest subprograma, que ja no depèn del seu
programa principal, perquè tota la interacció que hi manté és a través dels
seus paràmetres.

Evidentment, fins ara, tampoc hem guanyat gaire simplificant el codi del
programa: simplement hem mogut una part del seu codi en un altre subprograma.
Però podem aplicar el mateix procés en aquesta acció:

```c++
// Acció que escriu un rectangle amb files × columnes asteríscos.
void escriure_rectangle(int files, int columnes) {
    for (int i = 1; i <= files; ++i) {
        escriure_fila(columnes);
    }
}
```

Ara, l'acció `escriure_rectangle` és extremadament senzilla, ja que
s'oblida dels detalls necessaris per escriure una fila relegant-los a una
nova acció anomenada `escriure_fila` a la qual li passa com a paràmetre
el nombre de columnes que ha de contenir.

El codi de l'acció `escriure_fila` és la següent:

```c++
// Acció que escriu una fila amb columnes asteríscos.
void escriure_fila(int columnes) {
    for (int i = 1; i <= columnes; ++i) {
        cout << '*';
    }
    cout << endl;
}
```

En aquest cas hem canviat la variable `j` per `i`. Ho podem fer perquè aquesta
variable és local i, per tant, no té cap relació amb les variables d'altres
subprogrames.

Per veure totes les transformacions aplicades en pespectiva, aquest és el codi complet
resultant (també hem aprofitat per fer alguna contracció de claus):

```c++
#include <iostream>
using namespace std;


// Acció que escriu una fila amb columnes asteríscos.
void escriure_fila(int columnes) {
    for (int i = 1; i <= columnes; ++i) cout << '*';
    cout << endl;
}

// Acció que escriu un rectangle amb files × columnes asteríscos.
void escriure_rectangle(int files, int columnes) {
    for (int i = 1; i <= files; ++i) escriure_fila(columnes);
}

int main() {
    int m, n;
    cin >> m >> n;
    escriure_rectangle(m, n);
}
```

Clarament, el codi anterior és més llarg que el primer, però gràcies a la
descomposició en subprogrames, cadascuna de les parts és molt més senzilla que
abans. Com que cada part és més senzilla, és menys probable que contingui
errors i, si els conté, seràn més fàcils de detectar i d'arregar. A més,
cadascun dels subprogrames que inclou són candidats a ser reusats en futurs
projectes, estalviant doncs temps de programació. L'ús de petits comentaris
descrivint l'efecte de cada acció incrementa també la llegibilitat del
programa. La tria de bons identificadors per a les funcions i les accions
també ajuden a autodocumentar els programes.

Malgrat que sembli que aquest exemple l'hem portat fins a l'extrem,
estructurar un programa d'aquesta forma (és a dir, separar-lo en petites
funcions i/o accions tant independents com sigui possible) sempre és una bona
pràctica. De fet, a partir d'ara, la convertirem en la nostra principal eina
de disseny.

## Escriptura de triangles

La introducció de subprogrames permet aprofitar codi a l'hora d'escriure nous
programes. Per a compravar-ho, suposem que ara volem fer un programa per
escriure triangles de $n$ asteríscos. Per exemple, aquest és un triangle de
mida $4$:

```c++text
*
**
***
****
```

El programa principal podria ser:

```c++
int main() {
    // llegir el nombre de files
    int n;
    cin >> n;

    escriure_triangle(n);
}
```

Senzillament llegim el valor de `n` i cridem a una acció `escriure_triangle` que
desenvolupem a continuació:

```c++
// Acció que escriu un triangle d'asteríscos amb mida n.
void escriure_triangle(int n) {
    for (int i = 1; i <= n; ++i) escriure_fila(i);
}
```

I guaita: L'acció `escriure_fila` ja la teníem programada! No cal que la tornem
a escriure.

## Diferència funció/acció en C++

En realitat, en C++ no existeix diferència entre funcions i accions. Aquesta
diferència conceptual l'establim nosaltres per tal reflexionar més
adequadament sobre els programes, però veureu que altres fonts poden no
utilitzar-la.

<Autors autors="jpetit roura"/>
