# Aplicació: Màxim comú divisor i mínim comú multiple

<img src='././disco.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Aquesta lliçó mostra com definir funcions per al màxim comú divisor i el mínim
comú múltiple, i en dóna una aplicació per calcular propietats de les llums
d'una discoteca. A més, s'introdueix el concepte de precondició
d'una funció.

## Funció per al màxim comú divisor

Recordeu que [l'algorisme d'Euclides](/ip/intro/maxim-comu-divisor.html) és
una forma molt eficient de trobar el màxim comú divisor (mcd) de dos naturals.
Com que, quan es programa, no és infreqüent haver de calcular el mcd,
resulta convenient tenir-ne el codi encapsulat dins d'una funció.
Aquesta, anomenem-la `mcd`, hauria de rebre com a paràmetres
els dos nombres enters en qüestió, i hauria de retornar un enter (el seu mcd).
Per tant, podem definir la seva capçalera de la forma següent:

```c++
int mcd(int x, int y);

```

Recordeu que el mcd de dos nombres no està ben definit si algun dels nombres és
negatiu (i que val 0 quan ambdós són zero). Per deixar clar que la funció
`mcd` només es pot aplicar sobre enters _positius_, anotarem el codi amb un
comentari que ho indiqui:

```c++
// Retorna el màxim comú divisor de dos enters x i y, amb x ≥ 0 i y ≥ 0.
int mcd(int x, int y);
```

Les condicions que han de satisfer les entrades d'una funció per tal de
poder-de executar correctament s'anomenen **precondicions**.
És responsabilitat del
programador verificar que els valors amb què invoca les funcions
compleixen les seves precondicions. Si una precondició no es compleix,
l'efecte de la funció és indefinit: potser funciona, potser no, potser es
penja, potser peta el programa, ... o, fent broma,
potser explota l'ordinador, potser moren dos gatets
(😿😿️), potser es fon un reactor nuclear (💥)...

La definició del cos de la funció `mcd` implementa l'algorisme d'Euclides,
igual que ja havíem vist anteriorment, i en retorna el resultat:

```c++
// Retorna el màxim comú divisor de dos enters x i y, amb x ≥ 0 i y ≥ 0.
int mcd(int x, int y) {
    while (y != 0) {
        int r = x%y;
        x = y;
        y = r;
    }
    return x;
}
```

Fixeu-vos (una vegada més) que aquesta funció ni llegeix el valor de `x` i de
`y` pel canal d'entrada `cin`, ni escriu el seu resultat `x` pel canal de sortida `cout`.
Això és perquè els valors de `x` i `y` els reb com a paràmetres,
i el resultat el lliura amb un `return`.

## Funció per al mínim comú multiple

Considerem ara el problema de calcular el mínim comú multiple (mcm) de dos
naturals $x$ i $y$ (suposant que no són ambdós zero).
Probablement recordareu que

$$
    \text{mcm}(x,y) = \dfrac{x·y}{\text{mcd}(x,y)}.
$$

Per tant, podem implementar una funció `mcm` ben senzillament
utilitzant la funció `mcd` que hem definit anteriorment, de la forma següent:

```c++
// Retorna el mínim comú multiple de dos naturals x i y, amb x + y > 0.
int mcm(int x, int y) {
    return x*y/mcd(x, y);
}
```

Però aquesta implementació té una feblesa: si `x` i `y` són grans, el seu producte
també ho serà i, llavors, pot produir un sobreixement.
Per millorar-la, podem rescriure la fórmula anterior com a

$$
    \text{mcm}(x,y) = \dfrac{x·y}{\text{mcd}(x,y)} = \dfrac{x}{\text{mcd}(x,y)} · y
$$

i, aprofitant que la divisió de `x` i pel mcd segur que serà
entera (penseu per què!), podem escriure la funció de la forma següent:

```c++
// Retorna el mínim comú multiple de dos naturals x i y, amb x + y > 0.
int mcm(int x, int y) {
    return (x/mcd(x, y))*y;
}
```

Abans, podíem tenir sobreiximents en el càlcul intermedi del mcm.
Ara encara podem patir sobreiximents,
però només si el resultat final no cap en un `int`.

## Llums d'una discoteca

Una discoteca té llums intermitents de color blau, verd, groc, vermell i blanc
que s'il·luminen cada 2, 4, 6, 8 i 10 segons, respectivament,
començant totes de forma sincronitzada.
Quan de temps trigaran a il·luminar-se totes alhora?
La resposta és cada 120 segons,
ja que 120 és el mínim comú multiple de 2, 4, 6, 8 i 10.

En general, resoldre aquest problema consisteix a trobar el mínim comú multiple
de molts nombres.
Però això és prou fàcil,
ja que per a qualssevol tres naturals no nuls $x$, $y$ i $z$ es té

$$
    \text{mcm}(x, y, z) = \text{mcm}(\text{mcm}(x, y), z)
$$

i això es pot aplicar a tants nombres com calgui.

Ja tenim doncs tots els elements per dissenyar un programa complet que, donada
una seqüència (no buida) de naturals estrictament positius,
n'escriu el seu mcm. Si interpretem aquests
nombres com els periodes de flaix dels llums, trobem cada quant coïncideixen en
el temps. Aquest n'és el codi complet:

```c++
#include <iostream>
using namespace std;

// Retorna el màxim comú divisor de dos enters x i y, amb x ≥ 0 i y ≥ 0.
int mcd(int x, int y) {
    while (y != 0) {
        int r = x%y;
        x = y;
        y = r;
    }
    return x;
}

// Retorna el mínim comú multiple de dos naturals x i y, amb x + y > 0.
int mcm(int x, int y) {
    return (x/mcd(x, y))*y;
}

// Calcula el mínim comú multiple d'una seqüència no buida de naturals > 0.
int main() {
    int m = 1;
    int x;
    while (cin >> x) m = mcm(m, x);
    cout << m << endl;
}
```

L'única peça nova és el programa principal, que calcula dins d'`m`
de forma incremental el mcm dels valors de la seqüència que ja ha llegit.
La inicialització `m = 1` permet un bucle uniforme, ja que 1
és l'element neutre del mcm.

Fixeu-vos com l'ús de diverses funcions ha fet que el programa
hagi quedat simple, estructurat i llegible. A més, les funcions
`mcd` i `mcm` són candidats ideals per reusar en futurs programes.

I ara, vinga, a ballar! 💃🕺💃🕺💃

<Autors autors="jpetit roura"/>
