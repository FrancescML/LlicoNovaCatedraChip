... cal decidir si fem el cast del size(),
o si recomenem compilar amb el flag que el desactiva ...

jpetit: JO PASSARIA PER INT N = size()

... typedef o using? ... jpetit: USING!!!

Codi comú:

```c++
#include <iostream>
#include <vector>
using namespace std;

typedef vector<int> VE;
typedef vector<VE> VVE;
typedef vector<VVE> VVVE;
typedef vector<string> VS;
typedef vector<bool> VB;

```

# Backtracking (conjunts)

## Introducció

Els algorismes de "tornada enrera" (_backtracking_, en anglès)
permeten trobar sistemàticament tots els objectes matemàtics
que coimpleixin una determinada propietat.
Comencem mostrant problemes que requereixen
considerar els subconjunts d'un conjunt donat.
Aquests problemes es poden resoldre amb un dels esquemes de tornada enrera més comuns.

### Primer programa: seqüències de zeros i uns amb $n$ bits.

Volem fer un programa que, donat un natural $n$,
escrigui totes les seqüències de zeros i uns amb $n$ bits.
Aquest codi ho fa:

```c++
void escriu(const VB& triat) {
    for (bool x : triat) cout << x; // conversió implícita de booleà a enter
    cout << endl;
}


// Escriu totes les combinacions d'n bits que comencen igual que triat[0..i-1].
void f(int i, VB& triat) {
    if (i == int(triat.size())) escriu(triat);
    else {
        triat[i] = false;
        f(i + 1, triat);
        triat[i] = true;
        f(i + 1, triat);
    }
}


int main() {
    int n;
    cin >> n;
    VB triat(n);
    f(0, triat);
}
```

El `main` senzillament llegeix $n$,
crea un `vector` de booleans `triat` de mida $n$,
i fa la crida inicial a una funció `f()`.
El vector `triat` serveix per anar guardant, per a cada posició,
si s'ha triat o no que tingui un 1.

La funció `f()`, que és recursiva, va omplint `triat` d'esquerra a dreta.
El seu primer paràmetre és l'índex `i` de la següent posició que cal decidir.
Equivalentment, és el nombre de posicions que ja s'han fixat.
Per tant, la crida inicial s'ha de fer amb `i` igual a 0.

Quan `i` val `triat.size()`, és a dir, $n$,
ja s'ha decidit el contingut de totes les posicions,
i l'únic que cal fer en aquest cas és escriure el contingut de `triat`.
Això és el que fa la funció `escriu()`,
usant el fet que per defecte `false` s'escriu com un 0 i `true` s'escriu com un 1.

Altrament, quan $i < n$, cal decidir si a la posició actual posem un 0 o un 1.
Aquesta és la part més interessant del codi.
Com que volem escriure totes les combinacions que comencin amb `triat[0..i-1]`,
el que fem primer és posar un 0 a la posició següent (`triat[i] = false;`),
i a continuació cridar a `f()`
per escriure totes les combinacions que comencin amb `triat[0..i-1]` seguit d'un 0.
Després, posem un 1 a la posició següent (`triat[i] = true;`),
i cridem a `f()`
per escriure totes les combinacions que comencin amb `triat[0..i-1]` seguit d'un 1.

El resultat d'aquestes crides amb $n = 3$ és:

```c++text
000
001
010
011
100
101
110
111
```

Fixem-nos com, efectivament, el programa escriu les $2^3 = 8$ combinacions possibles.
Addicionalment, com que sempre posem un 0 abans que un 1,
les combinacions s'escriuen en ordre lexicogràfic.

El cost d'aquest codi és òptim,
en el sentit que és proporcional al nombre de caràcters escrits,
que és $n \times 2^n$ (si no comptem els salts de línia).
Però, tenint en compte que aquesta funció creix molt ràpidament amb $n$
(per exemple, per a $n = 30$ val més de 30 mil milions),
no és prudent usar aquest programa
(ni, en general, la majoria de codis de tornada enrera)
amb valors d'entrada gaire grans.

### Segon programa: com el primer, però més "pràctic".

Aquest programa fa el mateix que l'anterior:

```c++
int n;
VB triat;


void escriu() {
    for (bool x : triat) cout << x;
    cout << endl;
}


void f(int i) {
    if (i == n) return escriu();

    triat[i] = false;
    f(i + 1);
    triat[i] = true;
    f(i + 1);
}


int main() {
    cin >> n;
    triat = VB(n);
    f(0);
}
```

Aquest codi té unes poques diferències amb l'anterior,
però usa un estil més convenient en el context d'aquest curs.
D'una banda, usa un parell de **variables globals**: `n` i `triat`.
Aquestes variables són visibles des de qualsevol part del codi.
Per tant, podem passar a les funcions només els paràmetres no "redundants",
emfasitzant per tant els paràmetres que són significatius.
A més, el codi, amb menys còpies de paràmetres,
és més ràpid i gasta menys espai de la pila de recursió.

Què volem dir amb paràmetre "redundant"?
Si ens fixem en la funció `f()` del primer programa,
veurem que el seu segon paràmetre sempre és el mateix vector `triat`,
perquè sempre anem guardant les diferents combinacions
en el mateix espai de memòria.
Llavors, per què estem passant aquest paràmetre, si no canvia mai?

Un advantatge addicional d'ometre el paràmetre `triat`
és fer impossible una pífia habitual:
oblidar posar el `&` en la declaració de la funció.
És a dir, no podem escriure això

```c++
void f(int i, VB triat) ...
```

que compila sense problemes,
i tenir sense adonar-nos-en un codi que fa un munt de còpies redundants de vectors.

Respecte a la `n`,
tenir-la globalment ens permet comparar còmodament `i` amb `n` dins de la funció `f()`,
i així aconseguim un codi més llegible.

Però, com inicialitzem les variables globals?
L'estàndard de C++ diu que s'inicialitzen abans de començar a executar el `main()`,
amb els valors per defecte del tipus si no s'indica el contrari.
(En el nostre exemple, amb un 0 per a `n` i un vector buit per a `triat`.)
Com que no podem dimensionar correctament el vector `triat`
fins que llegim la seva mida `n` en el `main()`,
després a `triat` hi hem de guardar un `VB(n)`.

... aquí falta un senyal de perill ...

Una advertència important: les variables globals, en general,
estan considerades, i amb raó, molt perilloses.
Per exemple, amb programes grossos que cal desar en diversos fitxers
són una recepta per al desastre.
No és el nostre objectiu explicar-ne els motius en detall.
Només volem avisar que les variables globals
són útils en aquestes lliçons,
però molt perilloses en altres contextos.
(Si realment us cal programar seguint unes bones pràctiques generalitzables,
a canvi d'escriure codis més verbosos, consulteu l'apèndix ...
allà caldria posar un exemple de com fer-ho "bé")

Una altra diferència entre aquest programa i el primer
és que la funció `f` no té `else`.
Quan es compleix el cas base de la recursió (quan `i == n`),
escrivim la combinació i sortim immediatament de la crida.
Això també es podria haver implementat de forma més convencional,
usant unes poques línies de codi més:

```c++
    if (i == n) {
        escriu();
        return;
    }
```

Com a norma general, els autors d'aquestes lliçons
mostrem els codis de la forma més compacta possible,
sempre i quan això no n'afecti la llegibilitat.
Lògicament, cadascú és lliure d'usar el seu estil (raonable) de programació,
al seu propi risc.

### Tercer programa: seqüències de zeros i uns amb $n$ bits, sense dos zeros seguits.

Ara volem fer un programa que escrigui el mateix que l'anterior,
però evitant les seqüències amb dos zeros seguits.
Ho podem aconseguir trivialment amb aquestes modificacions:

```c++
bool ok() {
    for (int i = 1; i < n; ++i)
        if (not triat[i-1] and not triat[i]) return false;
    return true;
}


void f(int i) {
    if (i == n) {
        if (ok()) escriu();
        return;
    }

    ...
}
```

Com funciona? Simplement, abans d'escriure cada vector,
comprovem amb la funció `ok()` que no contingui dos zeros seguits,
amb un bucle senzill.

Efectivament, el resultat amb $n = 3$ és, com cal:

```c++text
010
011
101
110
111
```

Així doncs, sembla que aquest codi funciona, però és una bona solució?
No, és horrorosa.
Com veurem més avall,
les combinacions sense dos zeros seguits
són una minoria molt petita d'entre totes les combinacions possibles.
Per tant, aquest programa bàsicament es dedica
a generar combinacions que al final ha de descartar.

El que hem de fer és generar només les solucions correctes.
Més concretament, en tot moment assegurarem que el prefix actual de `triat`
contingui valors que es puguin completar per formar almenys una combinació correcta.
En altres paraules, ignorarem qualsevol branca de l'arbre de recursió
que comenci amb un prefix que no dugui enlloc.
Per a aquest problema, una petita modificació del codi original ja el fa eficient:

```c++
void f(int i) {
    if (i == n) return escriu();

    if (i == 0 or triat[i-1]) {
        triat[i] = false;
        f(i + 1);
    }
    triat[i] = true;
    f(i + 1);
}
```

El funcionament és simple:
Suposant per inducció que el prefix actual no conté dos zeros seguits,
sempre el podrem estendre amb un 1 (fent `triat[i] = true;`).
En canvi, abans de fer `triat[i] = false;`
hem d'estar segurs que podem:
o bé estem al principi de vector (`i == 0`),
o bé a la posició a l'esquerra de `i` hi ha un 1 (`triat[i-1]` és cert).
Fixem-nos que les dues condicions s'han de comprovar en aquest ordre,
per evitar que el programa accedeixi a la posició inexistent -1 del vector
quan `i == 0`.

### Quart programa: com el tercer, però només comptant les solucions.

Considerem com seria un programa que _compti_ (i no escrigui)
totes les seqüències de zeros i uns amb $n$ bits, sense dos zeros seguits.
Aquesta és una solució:

```c++
int n;
VB triat;


int f(int i) {
    if (i == n) return 1;

    int res = 0;
    if (i == 0 or triat[i-1]) {
        triat[i] = false;
        res += f(i + 1);
    }
    triat[i] = true;
    return res + f(i + 1);
}


int main() {
    cin >> n;
    triat = VB(n);
    cout << f(0) << endl;
}
```

Aquest programa és eficient?
Bé, depèn de com es miri.
Si el que volem és generar i comptar
les seqüències que compleixen la propietat, ho és:
només genera les seqüències correctes,
i evita generar els prefixos de les subseqüències que no duen enlloc.
El seu cost és proporcional al nombre de seqüències generades,
que tot seguit veurem que és exponencial,
tot i que molt més petit que $2^n$.
Per exemple per a $n = 30$, "només" hi ha dos milions llargs de solucions,
en front dels més de 30 mil milions de combinacions de zeros i uns.

Però si en tenim prou amb calcular el comptador corresponent a l'$n$ donada,
i no ens importa com,
l'anterior és potser un dels programes més ineficients que s'hagin escrit mai.
Per entendre per què, fixem-nos en els valors calculats en funció d'$n$:

... falta una taula maca ...

```c++text
0 1
1 2
2 3
3 5
5 8
6 13
7 21
...
```

Qualsevol que tingui una mica de bagatge matemàtic
hi pot reconèixer immediatament els
[nombres de Fibonacci](https://ca.wikipedia.org/wiki/Successi%C3%B3_de_Fibonacci).
En una altra lliçó posterior justificarem
que efectivament el nombre de combinacions vàlides és $F_{n+1}$.

... per fricar, incloure imatge de Fibonacci (si n'hi ha),
o alguna cosa com el Parteno, ...

Per tant, el programa en el fons només calcula un nombre de Fibonacci,
amb cost proporcional al propi nombre calculat,
el qual creix exponencialment amb base $\varphi = (1 + \sqrt{5})/2 \simeq 1'62$,
on $\varphi$ és el
[nombre auri](https://ca.wikipedia.org/wiki/Secci%C3%B3_%C3%A0uria).
Però, donat $n$, quant costa calcular $F_{n+2}$ de forma eficient?
Resulta que es pot calcular amb cost _logarítmic_.
Com a conclusió, estem calculant amb cost exponencial
una quantitat que es pot calcular amb cost logarítmic.
Déu n'hi do...

Cal dir que aquest exemple és excepcional.
En general, no es coneixen fórmules tancades
per a molts problemes combinatoris.
En alguns d'aquests casos, per saber quants objectes matemàtics hi ha
que compleixin una certa propietat,
no es pot fer res millor que generar-los tots
per comptar-los d'un en un.

### Cinquè programa: seqüències de zeros i uns amb $n$ bits, dels quals $u$ són uns.

Suposem que l'entrada del programa és la mida $n$ i el nombre d'uns $u$,
i que hem d'escriure les $( \overset{n}{u} )$ combinacions vàlides.
Com ja sabem, el que **no** hem de fer és calcular les $2^n$ seqüències,
i al final filtrar quines són bones i escriure-les.
En canvi, hem de tirar enrera la recursió
quan ens trobem amb qualsevol prefix que no es pugui estendre correctament.
Una manera d'aconseguir-ho és passar a la funció `f()` dos paràmetres addicionals:
el nombre `z` de zeros que encara es poden usar,
i el nombre `u` d'uns que encara es poden usar.
El codi resultant és igual al segon codi d'aquesta lliçó,
amb aquests canvis:

```c++
void f(int i, int z, int u) {
  if (z < 0 or u < 0) return;

  if (i == n) return escriu();

  triat[i] = false;
  f(i + 1, z - 1, u);
  triat[i] = true;
  f(i + 1, z, u - 1);
}


int main() {
    int u;
    cin >> n >> u;
    triat = VB(n);
    f(0, n - u, u);
}
```

Fixem-nos que la `u` del `main()` és la que dóna l'usuari del programa,
mentre que la `u` de `f()` és el nombre d'uns que encara podem posar,
el qual es va decrementant cada vegada que es posa una posició a `true`.
Similarment, la `z`, que inicialment és `n - u`,
es va decrementant cada vegada que es posa una posició a `false`.
La línia de codi més interessant és aquesta:

```c++
  if (z < 0 or u < 0) return;
```

Aquest condicional comprova que el prefix actual
no hagi gastat més zeros o més uns dels que tenia dret.
Si fos així, tira immediatament enrera la recursió.
Com a conseqüència, si arribem a la línia

```c++
  if (i == n) return escriu();
```

i la condició `(i == n)` és certa,
tenint en compte que en tot moment es compleix
`i` $+$ `z` $+$ `u` $=$ `n`,
podem deduir que tant `z` com `u` valen 0,
i el vector actual segur que conté una combinació vàlida
sense haver de fer cap comprovació addicional,
per la qual cosa el podem escriure directament.

### Sisè programa: tots els subconjunts d'$n$ paraules donades.

Volem fer un programa que, donades $n$ paraules diferents,
n'escrigui tots els possibles subconjunts.
Per exemple, amb les paraules `"zero"`, `"un"` i `"dos"`,
la sortida podria ser:

```c++text
{ }
{ dos }
{ un }
{ un dos }
{ zero }
{ zero dos }
{ zero un }
{ zero un dos }
```

Com podem resoldre aquest problema?
Doncs, bàsicament, ja l'hem resolt abans.
La solució és molt semblant al segon programa,
però amb un `VS par` global per guardar-hi les paraules,
i aquestes petites modificacions:

```c++
void escriu() {
    cout << "{";
    for (int i = 0; i < n; ++i)
        if (triat[i]) cout << " " << par[i];
    cout << " }" << endl;
}


void f(int i) {
    ... // codi idèntic al del segon programa
}


int main() {
    cin >> n;
    par = VS(n);
    for (string& s : par) cin >> s;
    triat = VB(n);
    f(0);
}
```

Per a cada `i`, interpretem que triem `par[i]`
si i només si `triat[i]` és cert.
Per exemple, `"zero"` forma part del subconjunt
si i només si `triat[0]` és cert.
Així, la línia

```c++text
{ zero un }
```

es correspon a la línia

```c++text
110
```

del primer (i del segon) programa
(~~110~~ vol dir que triem `"zero"` i `"un"`, i no triem `"dos"`).

Com a conseqüència, en el fons, aquest programa i el segon són el mateix,
i l'únic que canvia és el format
amb què s'escriu el contingut del vector `triat` un cop omplert.

### Setè programa: multiconjunts d'$n$ paraules donades, podent repetir-les fins a $k$ vegades.

Volem fer un programa que, donades $n$ paraules diferents,
i un natural $k$,
n'escrigui tots els possibles multiconjunts (és a dir, conjunts amb possibles repetits),
on cada paraula aparegui com a màxim $k$ vegades.
Per exemple, amb les paraules `"zero"` i `"un"`, i $k = 2$,
la sortida podria ser:

```c++text
{ }
{ un }
{ un un }
{ zero }
{ zero un }
{ zero un un }
{ zero zero }
{ zero zero un }
{ zero zero un un }
```

Fins ara, per a cada element, havíem de decidir si el triàvem o no.
Però, aquí, hem de decidir _quantes_ vegades el posem.
Per tant , enlloc d'un vector de booleans,
ara ens cal un vector d'enters, diguem-ne `quants`,
tal que `quants[i]` indiqui quantes vegades posem la paraula `i`-èsima:

```c++
int n, k;
VS par;
VE quants;


void escriu() {
    cout << "{";
    for (int i = 0; i < n; ++i)
        for (int r = 0; r < quants[i]; ++r) cout << " " << par[i];
    cout << " }" << endl;
}


void f(int i) {
    if (i == n) return escriu();

    for (int j = 0; j <= k; ++j) {
        quants[i] = j;
        f(i + 1);
    }
}


int main() {
    cin >> n >> k;
    par = VS(n);
    for (string& s : par) cin >> s;
    quants = VE(n);
    f(0);
}
```

Fixem-nos que la línia

```c++
        for (int r = 0; r < quants[i]; ++r) cout << " " << par[i];
```

escriu `par[i]` tantes vegades com digui el comptador `quants[i]`.
I el bucle

```c++
    for (int j = 0; j <= k; ++j) {
        quants[i] = j;
        f(i + 1);
    }
```

posa a `quants[i]` tots els nombres entre 0 i `k`, ambdós inclosos.
Aquest `for` és una mena de generalització de les línies

```c++
    triat[i] = false;
    f(i + 1);
    triat[i] = true;
    f(i + 1);
```

del programa anterior, on `k` implícitament valia 1.

### Vuitè programa: maneres de sumar $s$ amb $n$ nombres donats.

Finalment, fem un programa que, donada una suma objectiu $s$
i $n$ nombres enters diferents,
escrigui totes les maneres de sumar $s$ amb els nombres donats.
Per exemple, amb $s = 10$ i els nombres 3, 7, $-4$, 0, 2, i 5,
la sortida podria ser:

```c++text
{7,-4,2,5}
{7,-4,0,2,5}
{3,2,5}
{3,0,2,5}
{3,7}
{3,7,0}
```

El format d'escriptura és una mica més sofisticat que fins ara,
però això no és important.
La funció `escriu()` ho encapsula i se n'encarrega.
Més significatiu és que en aquest problema
no hi ha una manera senzilla d'espurgar l'arbre de recursió.
Per exemple, si els nombres fossin tots positius,
si en algun moment la suma acumulada fos més gran que $s$,
ja podríem saber que la branca actual no du enlloc.
Però, amb nombres positius i negatius barrejats,
hem de seguir explorant fins al final,
i només en aquell moment comprovar si la suma acumulada coincideix amb `s`:

```c++
int s, n;
VE num;
VB triat;


void escriu() {
    bool primer = true;
    cout << '{';
    for (int i = 0; i < n; ++i)
        if (triat[i]) {
            if (primer) primer = false;
            else cout << ',';
            cout << num[i];
        }
    cout << '}' << endl;
}


void f(int i, int suma) {
    if (i == n) {
        if (suma == s) escriu();
        return;
    }

    triat[i] = false;
    f(i + 1, suma);
    triat[i] = true;
    f(i + 1, suma + num[i]);
}


int main() {
    cin >> s >> n;
    num = VE(n);
    for (int& x : num) cin >> x;
    triat = VB(n);
    f(0, 0);
}
```

Es pot fer un programa més eficient
per resoldre aquest problema?
Depèn: Si els nombres són petits,
llavors hi ha solucions amb una tècnica de programació
denominada _programació dinàmica_
que tenen un cost que s'anomena _pseudo-polinòmic_.
Això ho veurem en una lliçó posterior.

<Autors autors="roura"/>
