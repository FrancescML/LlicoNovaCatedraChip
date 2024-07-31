... codi comú: min3 ...

# Programació dinàmica (optimització)

## Introducció

A la lliçó anterior hem vist
com usar la _programació dinàmica_
per resoldre eficientment alguns problemes de combinatòria.
Aquí es mostren alguns exemples de l'altre ús habitual
de la programació dinàmica:
els problemes d'optimització.

### Primer problema: distància d'edició.

Donades dues paraules, quant costa fer-les iguals?
Susposem que les operacions permeses són
afegir un caràcter, esborrar un caràcter, i canviar un caràcter,
i que totes costen una unitat.

Per resoldre aquest problema,
cal adonar-se'n que no cal mai afegir un caràcter,
perquè és equivalent esborrar el caràcter corresponent de l'altre paraula.
Així doncs, podem suposar que només esborrem o canviem caràcters.
...

Aquest programa resol el problema:

```c++
string s, t;
VVE R;

// Cost minim de fer iguals s[0..i-1] i t[0..j-1].
int cost(int i, int j) {
int& res = R[i][j];
if (res != -1) return res;
if (i == 0) return res = j;
if (j == 0) return res = i;
if (s[i-1] == t[j-1]) return res = cost(i - 1, j - 1);
return res = 1 + min3(cost(i - 1, j - 1), cost(i - 1, j), cost(i, j - 1));
}

int main() {
cin >> s >> t;
int n = s.size();
int m = t.size();
R = VVE(n + 1, VE(m + 1, -1));
cout << cost(n, m) << endl;
}

```

### Segon problema: LIS (_longest increasing subsequence_).

Donada una seqüència d'enters,
quina és la màxima longitud d'una subseqüència estrictament creixent?

```c++
int n;
VE V;
VE R;


// Longitud de la LIS que comenca a V[i], obligats a agafar V[i].
int lis(int i) {
    int& res = R[i];
    if (res != -1) return res;
    res = 1;
    for (int j = i + 1; j < n; ++j)
        if (V[j] > V[i]) res = max(res, 1 + lis(j));
    return res;
}


int main() {
    cin >> n;
    V = VE(n);
    for (int& x : V) cin >> V[i];
    R = VE(n, -1);
    int res = 0;
    for (int i = 0; i < n; ++i) res = max(res, lis(i));
    cout << res << endl;
}
```

... es pot fer en $n \log n$...

<Autors autors="roura"/>
