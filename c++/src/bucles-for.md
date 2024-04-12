
# Iteracions amb for

<img src='./bucles-for.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

Aquest lliçó presenta la instrucció iterativa `for`,
que podem considerar una mena de cas particular,
força útil, de la instrucció `while`.


## Escriure molts nombres

Tornem a considerar un programa que llegeixi un nombre `n`,
i que escrigui tots els nombres entre 1 i `n`, un per línia.
Recordem que aquesta n'és una solució possible:

```c++
int main() {
    int n;
    cin >> n;
    int i = 1;
    while (i <= n) {
        cout << i << endl;
        ++i;
    }
}
```

Si considerem aquest codi a partir de la tercera línia,
hi trobem un esquema molt freqüent a l'hora de construir bucles,
que podem sintetitzar en aquest diagrama de flux:

<div id='flow-for'></div>

<script type='text/coffeescript' src='./flow-for.coffee'></script>

<br>

Per al programa anterior, aquesta n'és la correspondència:

diagrama | exemple
--- | ---
`<inicialització>` | `int i = 1;`
`<condició>`       | `(i <= n)`
`<instruccions>`   | `cout << i << endl;`
`<increment>`      | `++i;`

Qualsevol tros de codi que segueixi aquest esquema es pot escriure amb la instrucció `for`,
que té aquesta estructura:

```c++
for (⟨inicialització⟩; ⟨condició⟩; ⟨increment⟩) {
    ⟨instruccions⟩
}
```

i és equivalent a:

```c++
{
    ⟨inicialització⟩
    while (⟨condició⟩) {
        ⟨instruccions⟩
        ⟨increment⟩
    }
}
```

Per tant, el programa anterior es podria escriure així:

```c++
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; ++i) {
        cout << i << endl;
    }
}
```

De fet, com que en aquest cas només tenim una instrucció dintre del `for`,
podem escriure senzillament:

```c++
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; ++i) cout << i << endl;
}
```

Encara que inicialment pugui semblar més difícil d'entendre,
en particular per algú que comença a aprendre a programar,
aquest codi és més compacte, ràpid d'escriure
i fàcil de llegir per als programadors experimentats.
La raó és que tots els elements de control del bucle es troben en
un sol lloc.
Per tant, us aconsellem acostumar-vos als bucles `for`
i a usar-los per defecte,
sempre i quan segueixin l'esquema tan freqüent mencionat anteriorment.
Feu servir els bucles `while` només
per a iteracions amb esquemes més originals.



## Escriure molts nombres i els seus quadrats

Encara no esteu convençuts del nostre consell?
Doncs ara considerem un programa que llegeixi un nombre `n`,
i que escrigui tots els nombres entre 1 i `n`, un per línia,
seguits dels quadrats de tots els nombres entre 1 i `n`, un per línia.
Per exemple, si llegim un 3,
el programa ha d'escriure

```text
1
2
3
1
4
9
```

Si usem els `while`, és fàcil escriure aquest codi,
copiant el primer bucle com a base per construir el segon:

```c++
int main() {
    int n;
    cin >> n;
    int i = 1;
    while (i <= n) {
        cout << i << endl;
        ++i;
    }
    int i = 1;                      // ☠
    while (i <= n) {
        cout << i*i << endl;
        ++i;
    }
}
```

Lamentablement, aquest codi no compila.
El motiu és que amb el segon `int i = 1;`
estem redeclarant la variable `i`, que ja existia prèviament.
Per arreglar-ho, o bé canviem la redeclaració per l'assignació `i = 1;`,
o bé usem una nova variable (posem, `j`) per al segon bucle.
En qualsevol cas, a l'hora de triar les variables de control dels bucles `while`
(en aquest cas, `i` i `j`),
hem de recordar quines s'han usat en els bucles `while` anteriors.

I si seguim el nostre consell i usem els `for`?

```c++
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; ++i) cout << i << endl;
    for (int i = 1; i <= n; ++i) cout << i*i << endl;
}
```

Bastant millor, oi?
Però això és correcte?
El compilador no ens dirà  que estem redeclarant la `i` en el segon bucle?
No.
Una diferència subtil però força útil entre els `for` i els `while`
és que les variables de control desapareixen quen s'acaba el bucle.
Per això, no ens hem de preocupar de si repetim el mateix nom en bucles consecutius.




## Màxim de 1000 nombres

Reconsiderem ara un problema que ja hem resolt prèviament amb un `while`:
calcular el màxim de 1000 nombres.
Aquest era el nostre codi:

```c++
int main() {
    int maxim;
    cin >> maxim;
    int i = 0;
    while (i < 999) {
        int a;
        cin >> a;
        if (a > maxim) maxim = a;
        ++i;
    }
    cout << maxim << endl;
}
```

Com es faria amb un `for`?

```c++
int main() {
    int maxim;
    cin >> maxim;
    for (int i = 0; i < 999; ++i) {
        int a;
        cin >> a;
        if (a > maxim) maxim = a;
    }
    cout << maxim << endl;
}
```
En aquest cas, la millora no és tan espectacular.
Però fixeu-vos que sempre aconseguim codis més concisos.



## Exercici: Suma de `n` nombres

Escriviu un programa que llegeixi un nombre natural `n`,
seguit d'`n` enters, i que n'escrigui la seva suma.
Useu un `for`.


<div id='quiz'></div>

<script type="text/coffeescript">

text = """
Aquesta és una possible solució:

```c++
/* Llegeix n, seguit d'n enters, i n'escriu la suma. */

#include <iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int suma = 0;
    for (int i = 0; i < n; ++i) {
        int a;
        cin >> a;
        suma = suma + a;
    }
    cout << suma << endl;
}
```
"""

window.reveal text, "quiz"

</script>




<Autors autors="jpetit roura"/>


