# Iteracions

<img src='././iteracions.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquest lliçó presenta la instrucció iterativa `while`. En informàtica, de
repetir operacions en diem iterar o fer bucles. La iteració permet simplificar i
potenciar els algorismes afirmant que es repetiran certs passos fins que no es
digui el contrari. Aprendre a dissenyar bucles és extremadament important per
escriure programes.

## Escriure molts nombres

Considereu un programa que llegeixi un nombre `n`,
i que escrigui tots els nombres entre 1 i `n`, un per línia.
Per exemple, si llegim un 3,
el programa ha d'escriure

```c++text
1
2
3
```

Amb les eines que hem vist fins ara, no és possible fer aquest programa.
Per exemple, quantes línies de codi tindria? 100?
Llavors, si la `n` fos 1000, com podríem fer que el programa escrivís 1000 línies?
Clarament, ens cal un nou tipus d'instrucció.

En particular, ens cal poder dir a l'ordinador
que vagi fent operacions mentre es compleixi una certa condició,
és a dir, ens cal una **instrucció iterativa**,
que en la forma més bàsica en C++ s'escriu així:

```c++c++
while (⟨condició⟩) {
    ⟨instruccions⟩
}
```

Per executar un `while`, l'ordinador primer comprova la `⟨condició⟩`.
Si no es compleix, passa a executar el que hi hagi després del `while`.
Si es compleix, s'executen les `⟨instruccions⟩` contingudes entre les claus.
Després, torna a comprovar la condició.
Si no es compleix, passa a executar el que hi hagi després del `while`.
Si es compleix, s'executen totes les instruccions contingudes entre les claus.
I així repetidament, _mentre_ (`while`, en angles) la `⟨condició⟩`
es compleixi.

El diagrama de flux següent mostra el funcionament del bucle `while`:

<MyFlowChart src="flow-while.ts"/>

Aquest programa resol el problema proposat usant un `while`:

```c++c++
int main() {
    int n;
    cin >> n;
    int i = 1;
    while (i <= n) {
        cout << i << endl;
        i = i + 1;
    }
}
```

Com funciona?
Primer llegim la `n` (suposem que val 3).
La tercera línia
declara una variable `i` amb valor inicial 1.
Després, es comprova la condició del `while`.
Com que aquesta es compleix, perquè `1 <= 3`,
s'executa el cos del `while`,
el qual consisteix a escriure la `i` actual (que és 1) en una línia,
i a incrementar a continuació la `i` de 1 a 2.
Ara es torna a comprovar la condició,
i com que es compleix, perquè `2 <= 3`, s'escriu un 2 i la `i` passa a valer 3.
Ara es torna a comprovar la condició,
que encara es compleix, perquè `3 <= 3`, s'escriu un 3 i la `i` passa a valer 4.
Ara la condició ja no es compleix,
perquè no és cert que `4 <= 3`,
per la qual cosa el `while` acaba.
I com que a continuació no hi ha més codi, el programa també acaba,
després d'haver escrit els nombres entre 1 i 3.

## Màxim de 1000 nombres

Recuperem un problema que ja hem resolt prèviament:
calcular el màxim de diversos nombres.
Però ara no de dos o de quatre nombres, sinó de 1000.
Això es podria resoldre amb un codi similar
als que vam veure a la lliçó de les instruccions condicionals.
Però aquest codi tindria més de 1000 línies, la majoria quasi idèntiques,
i seria una solució horrorosa.
En canvi, l'us d'un `while` ens permet escriure un codi elegant:

```c++c++
int main() {
    int maxim;
    cin >> maxim;
    int i = 0;
    while (i < 999) {
        int a;
        cin >> a;
        if (a > maxim) maxim = a;
        ++i; // i = i + 1;
    }
    cout << maxim << endl;
}
```

Com funciona aquest programa?
Primer, fixem-nos en les línies

```c++c++
    int i = 0;
    while (i < 999) {
        🚧 🚧 🚧
        ++i; // i = i + 1;
    }
```

La instrucció `++i;` incrementa la variable `i` en 1.
Com el comentari del codi indica, i com ja sabem,
també es podria fer el mateix amb `i = i + 1;`.
Però com que incrementar una variable
és una de les operacions mes usades a l'hora de programar,
se sol fer servir aquesta variant tan curta i pràctica.

Ara, podem veure que l'efecte del `while`
és executar les instruccions que hi hagi als `🚧 🚧 🚧`
exactament 999 vegades (per a valors d'`i` entre 0 i 998, ambdós inclosos).
És a dir, és una manera de fer un bucle que doni 999 voltes.

Considerem finalment tot el programa:
Inicialment, es llegeix el primer nombre i es guarda a la variabla `maxim`.
A continuació, 999 vegades es llegeix un altre nombre dins d'una variable auxiliar `a` i,
si el nombre acabat de llegir és més gran que el contingut dins de `maxim`,
s'actualitza `maxim` amb aquest valor.
Així aconseguim que, en tot moment,
`maxim` contingui el valor més gran dels llegits fins al moment.
Per tant, al final del programa és suficient amb escriure `maxim`.

## Exercici: Suma de `n` nombres

Escriviu un programa que llegeixi un nombre natural `n`,
seguit d'`n` enters, i que n'escrigui la seva suma.

<Autors autors="jpetit roura"/>
