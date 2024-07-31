# Backtracking (permutacions)

## Introducció

En aquesta lliçó mostrem problemes que requereixen
considerar les permutacions,
és a dir, els possibles ordres, d'un conjunt donat.
Aquests problemes es poden resoldre aplicant
un altre dels esquemes de tornada enrera més comuns.

### Primer programa: permutacions de $\{0, \dots, n-1\}$.

Volem fer un programa que, donat un natural $n$,
escrigui els nombres entre 0 i $n-1$ en tots els ordres possibles.
Aquest codi ho aconsegueix:

```c++
int n;
VE perm;
VB usat;

void escriu() {
for (int x : perm) cout << ' ' << x;
cout << endl;
}

void f(int i) {
if (i == n) return escriu();

    for (int x = 0; x < n; ++x)
        if (not usat[x]) {
            perm[i] = x;
            usat[x] = true;
            f(i + 1);
            usat[x] = false;
        }

}

int main() {
cin >> n;
perm = VE(n);
usat = VB(n, false);
f(0);
}

```

El programa guarda cada permutació al vector `perm`,
el qual va omplint d'esquerra a dreta,
posant en ordre a la posició actual `i` qualsevol nombre `x`
que no s'hagi usat prèviament.
Per assegurar que sigui així, es manté un vector de booleans `usat`
que recorda, per a cada nombre, si ja s'ha usat o no.

Per a $n = 3$, la sortida és

```text
0 1 2
0 2 1
1 0 2
1 2 0
2 0 1
2 1 0
```

Com cal, el programa escriu les $3! = 6$ permutacions.
A més, ho fa en ordre lexicogràfic.

Com a comentari final,
cal recordar posar la línia

```c++
            usat[x] = false;
```

És fàcil oblidar-la, cosa que fa que el programa funcioni incorrectament.
Però fixem-nos que no cal "netejar" el vector `perm`
després de la crida, amb alguna instrucció tipus `perm[i] = -1;`.

### Segon programa: igual, però també les compta.

Si, a més d'escriure les permutacions, volem comptar-les,
només cal fer els pocs retocs que es poden veure a continuació:

```c++
int f(int i) {
    if (i == n) {
        escriu();
        return 1;
    }

    int res = 0;
    for (int x = 0; x < n; ++x)
        if (not usat[x]) {
            perm[i] = x;
            usat[x] = true;
            res += f(i + 1);
            usat[x] = false;
        }
    return res;
}


int main() {
    ...
    cout << f(0) << endl;
}
```

... comentaris ...

### Tercer programa: maneres de posar $n$ torres en un tauler $n \times n$.

Suposem que volem escriure totes les possibles maneres de posar $n$ torres
en un tauler $n \times n$ sense que s'amenacin entre si.
Per exemple, amb $n = 3$ la sortida podria ser

```text
T..
.T.
..T

T..
..T
.T.

.T.
T..
..T

.T.
..T
T..

..T
T..
.T.

..T
.T.
T..

```

Què té a veure aquest problema amb els que hem vist fins ara en aquest tema?
Doncs que, bàsicament, és igual al primer.
Només cal observar que cada tauler vàlid té associada una permutació:
per a cada fila, a quina columna hem posat la torre.
Com que totes les columnes han de ser diferents, i el tauler és quadrat,
totes els nombres han d'aparèixer exactament una vegada.
I, a la inversa, cada permutació es correspon a un tauler vàlid.
Per tant, només cal canviar la manera amb què escrivim la informació,
és a dir, la funció `escriu()`:

```c++
void escriu() {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) cout << (j == perm[i] ? 'T' : '.');
        cout << endl;
    }
    cout << endl;
}
```

... explicació de ( ? : ) ...

### Quart programa: maneres de posar $n$ reines en un tauler $n \times n$.

Ara no volem posar torres, sinó reines, en el tauler.
Aquest problema és semblant a l'anterior,
però ens caldrà controlar també les amenaces diagonals.
Amb $n = 3$ no hi ha cap solució possible,
però amb $n = 4$ la sortida podria ser

```text
.R..
...R
R...
..R.

..R.
R...
...R
.R..
```

... comentari ...

```c++
int n;
VE perm;
VB colu, dia1, dia2;


void f(int i) {
    if (i == n) return escriu();

    for (int x = 0; x < n; ++x) {
        int d1 = i + x;
        int d2 = i - x + n - 1;
        if (not colu[x] and not dia1[d1] and not dia2[d2]) {
            perm[i] = x;
            colu[x] = dia1[d1] = dia2[d2] = true;
            f(i + 1);
            colu[x] = dia1[d1] = dia2[d2] = false;
        }
    }
}


int main() {
    cin >> n;
    perm = VE(n);
    colu = VE(n, false);
    dia1 = dia2 = VE(2*n - 1, false);
    f(0);
}
```

La funció `escriu()` és idèntica a la del programa anterior,
només canviant `'T'` per `'R'`.

### Cinquè programa: igual a l'anterior, però només comptant.

... no cal el vector perm ...

```c++
int f(int i) {
    if (i == n) return 1;

    int res = 0;
    for (int x = 0; x < n; ++x) {
        int d1 = i + x;
        int d2 = i - x + n - 1;
        if (not colu[x] and not dia1[d1] and not dia2[d2]) {
            colu[x] = dia1[d1] = dia2[d2] = true;
            res += f(i + 1);
            colu[x] = dia1[d1] = dia2[d2] = false;
        }
    }
    return res;
}


int main() {
    ...
    cout << f(0) << endl;
}
```

### Sisè programa: semblant als anteriors, però escriu la primera solució que troba.

```c++
bool f(int i) {
    if (i == n) {
        escriu();
        return true;
    }

    for (int x = 0; x < n; ++x) {
        int d1 = i + x;
        int d2 = i - x + n - 1;
        if (not colu[x] and not dia1[d1] and not dia2[d2]) {
            perm[i] = x;
            colu[x] = dia1[d1] = dia2[d2] = true;
            if (f(i + 1)) return true;
            colu[x] = dia1[d1] = dia2[d2] = false;
        }
    }
    return false;
}


int main() {
    ...
    if (not f(0)) cout << "sense solucio" << endl;
}
```

---

### Setè programa: Sudoku.

Per acabar la lliçó, fem un programa que resolgui un sudoku.
Aquí està:

```c++
VVE sudoku(9, VE(9));
VVE fila(9, VE(10, false));
VVE colu(9, VE(10, false));
VVVE quad(3, VVE(3, VE(10, false)));


bool f(int i, int j) {
    if (i == 9) {
        escriu();
        return true;
    }

    if (j == 9) return f(i + 1, 0);

    if (sudoku[i][j] != 0) return f(i, j + 1);

    for (int x = 1; x <= 9; ++x)
        if (not fila[i][x] and not colu[j][x] and not quad[i/3][j/3][x]) {
            sudoku[i][j] = x;
            fila[i][x] = colu[j][x] = quad[i/3][j/3][x] = true;
            if (f(i, j + 1)) return true;
            fila[i][x] = colu[j][x] = quad[i/3][j/3][x] = false;
            sudoku[i][j] = 0; // ara sí que cal netejar
        }
    return false;
}


int main() {
    for (int i = 0; i < 9; ++i)
        for (int j = 0; j < 9; ++j) {
            char c;
            cin >> c;
            if (c == '.') sudoku[i][j] = 0;
            else {
                int x = c - '0';
                sudoku[i][j] = x;
                fila[i][x] = colu[j][x] = quad[i/3][j/3][x] = true;
            }
        }
    f(0, 0);
}
```

... Para quan troba la solucio. ...

<Autors autors="roura"/>
