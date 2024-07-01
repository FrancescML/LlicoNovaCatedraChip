# Aplicació: Suma d'un segon

<img src='./rellotge-digital.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquest lliçó reforça l'ús de la instrucció condicional amb un
programa que afegeix un segon a una hora del dia, donades les seves hores,
minuts i segons.


## Descripció del problema

Considereu el problema següent: Donada un hora (amb el seu nombre
d'hores, de minuts i de segons), es vol sumar un segon a aquesta hora.
A més, es vol que el resultat s'escrigui amb el format habitual
dels rellotges: les hores, minuts i segons s'escriuen amb dos dígits
i se separen per dos punts. Per exemple, donada l'hora ~~14:09:59~~,
cal escriure ~~14:10:00~~.

### Entrada

L’entrada consisteix en tres naturals `h`, `m` i `s` que representen una hora
del dia, és a dir, tals que 0 <= `h` < 24, 0 <= `m` < 60, i 0 <= `s`< 60.

### Sortida

Cal escriure el nou temps definit per h, m i s més un segon,
en el format ~~HH:MM:SS~~.

### Exemples

- Per a l'entrada ~~10 20 30~~ cal escriure ~~10:20:31~~.
- Per a l'entrada ~~0 0 59~~   cal escriure ~~00:01:00~~.
- Per a l'entrada ~~23 59 59~~ cal escriure ~~00:00:00~~.


## Solució

Per resoldre el problema, dividirem el programa en tres passos:

1. Primer, es llegiran les dades de l'entrada (una hora del dia).
2. Després, se sumarà un segon a aquesta hora del dia.
3. Finalment, s'escriurà l'hora del dia resultant, en el format requerit.

És molt habitual dividir un programa en aquests tres passos (lectura, càlcul i escriptura).
A continuació els detallem:

### 1. Lectura de l'hora

Tal com diu l'enunciat, l’entrada consisteix en tres naturals `h`, `m` i `s` que
representen una hora del dia. Per tant, les declarem com a variables de tipus enter (`int`):

```c++
int h, m, s;
```

La lectura és ben senzilla: només cal llegir les tres dades, l'una
darrera l'altra:

```c++
cin >> h >> m >> s;
```

Recordeu que aquesta instrucció llegeix tres enters del canal d'entrada
(`cin`) i els deixa en ordre en `h`, `m` i `s` respectivament.


### 2. Increment d'un segon

Per sumar un segon a l'hora,
cal sumar un a la variable `s`, que representa el nombre de segons.
Com ho farem?
Amb la instrucció

```c++
s = s + 1;
```

Per exemple, suposem que `s` val 23 abans d'executar aquesta línia.
Primer, es calcula el valor de `s + 1`, el qual és 24.
Després, aquest valor es copia a `s`.
Realment, l'efecte final és un increment d'`s`,
en aquest cas de 23 a 24.

Ara, si el nombre resultant és menor que 60, ja hem acabat.
Altrament, el nombre de segons és exactament 60 (perquè sabem per
l'enunciat que estava entre 0 i 59),
i per tant cal posar a zero el nombre de segons `s`
i sumar un a la variable `m`, que representa el nombre de minuts.
Si el nombre resultant és menor que 60, ja hem acabat també.
Sinó, caldrà posar a zero el nombre de minuts `m`
i sumar un a la variable `h`, que representa el nombre d'hores.
Finalment, si el nombre d'hores resultat és 24,
cal posar `h` a zero, perquè les
~~24:00:00~~ no és una hora vàlida: hauria de ser ~~00:00:00~~.

Tot aquest procés el podem implementar de la forma següent
amb condicionals imbricats:

```c++
s = s + 1;
if (s == 60) {
    s = 0;
    m = m + 1;
    if (m == 60) {
        m = 0;
        h = h + 1;
        if (h == 24) h = 0;
    }
}
```

En aquest programa, les frases com ara
"*Si el nombre resultant és menor que 60, ja hem acabat.
Altrament,  ...*" han estat codificades del revés: `if (s == 60) { ... } `.
D'aquesta forma ens estalviem construccions amb cossos buits.

Recordeu que l'operador de comparació s'escriu amb dos iguals
(`==`) i que la instrucció d'assignació utilitza un sol igual (`=`). Per
això, quan es comprova si `h` ha arribat a 24 s'utilitza la condició `h == 24`,
però quan es posa el seu valor a zero s'utilitza la instrucció `h = 0;`.

A més, fixeu-vos que, en informàtica, l'operador d'assignació `=`
(llegit *pren per valor*)
indica que el valor expressat a la dreta s'ha de desar a la variable
de l'esquerra. En matemàtiques, `s = s + 1` seria una absurditat.




### 3. Escriptura del resultat

Un cop incrementada l'hora d'entrada en un segon,
toca escriure el resultat:
Primer, cal escriure `h`, `m` i `s` separades per `:`.
A més, cal assegurar que cada nombre s'escrigui amb dos dígits.
Com aconseguir-ho?
Doncs escrivint un zero abans si el seu valor no arriba a deu.
Així doncs, podem escriure la part corresponent a l'hora d'aquesta forma:

```c++
if (h < 10) cout << 0;
cout << h << ":";
```

i completar-ho de la mateixa forma per la part dels minuts i dels segons:

```c++
if (m < 10) cout << 0;
cout << m << ":";
if (s < 10) cout << 0;
cout << s << endl;
```

⚡ Observeu que en lloc d'escriure el caràcter de dos punts després d'`s`,
cal escriure `endl` per posar el salt de línia final.


### Solució completa

El programa complet queda doncs així:

```c++
#include <iostream>
using namespace std;

int main() {
    // 1. Lectura de l'hora
    int h, m, s;
    cin >> h >> m >> s;

    // 2. Increment d'un segon
    s = s + 1;
    if (s == 60) {
        s = 0;
        m = m + 1;
        if (m == 60) {
            m = 0;
            h = h + 1;
            if (h == 24) {
                h = 0;
            }
        }
    }

    // 3. Escriptura del resultat
    if (h < 10) cout << 0;
    cout << h << ":";
    if (m < 10) cout << 0;
    cout << m << ":";
    if (s < 10) cout << 0;
    cout << s << endl;
}
```



### Solució alternativa

Per resoldre aquest problema,
també ens podem inspirar en el programa de la descomposició horària.
La part del càlcul del resultat quedaria així:

```c++
    // 2. Increment d'un segon
    int t = 3600*h + 60*m + s + 1;        // Nombre total de segons
    if (t == 3600*24) t = 0;              // Per evitar el 24:00:00
    int h = n/3600;                       // Càlcul del nombre d'hores
    int m = (n%3600)/60;                  // Càlcul del nombre de minuts
    int s = n%60;                         // Càlcul del nombre de segons
}
```




<Autors autors="jpetit roura"/>

