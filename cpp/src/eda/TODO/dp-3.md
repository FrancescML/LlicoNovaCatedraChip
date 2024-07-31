# Programació dinàmica (altres)

## Introducció

A les dues lliçons anteriors
hem vist diversos exemples de _programació dinàmica_.
Aquí incloem alguns codis ...

### Primer problema: Nombre de maneres d'aconseguir canvi amb monedes úniques.

...manera com fins ara...

```c++
VE V;
VVL R;


// Nombre de maneres d'aconseguir canvi x podent usar les i primeres monedes.
// Cada moneda es pot usar zero o una vegades.
ll f(int i, int x) {
    if (x < 0) return 0;
    ll& res = R[i][x];
    if (res != -1) return res;
    return res = (i == 0 ? (x == 0) : f(i - 1, x) + f(i - 1, x - V[i-1]));
}


int main() {
    int n;
    cin >> n;
    V = VE(n);
    for (int& x : V) cin >> V[i];
    int s;
    cin >> s;
    R = VVL(n + 1, VL(s + 1, -1));
    for (int i = 0; i <= s; ++i) cout << i << ' ' << f(n, i) << endl;
}
```

... manera professional ...

```c++
int main() {
    ...

    VL R(s + 1, 0);
    R[0] = 1;
    for (int i = 0; i < n; ++i)
        for (int j = s; j >= V[i]; --j) R[j] += R[j-V[i]];
    for (int i = 0; i <= s; ++i) cout << i << ' ' << R[i] << endl;
}
```

---

```c++
VE V;
VVL R;


// Nombre de maneres d'aconseguir canvi x podent usar les i primeres monedes.
// Cada moneda es pot usar tantes vegades com es vulgui.
ll f(int i, int x) {
  if (x < 0) return 0;
  ll& res = R[i][x];
  if (res != -1) return res;
  if (i == 0) return res = (x == 0);
  return res = f(i - 1, x) + f(i, x - V[i-1]);
}


int main() {
  int n;
  cin >> n;
  V = VE(n);
  for (int i = 0; i < n; ++i) cin >> V[i];
  int s;
  cin >> s;
  R = VVL(n + 1, VL(s + 1, -1));
  for (int i = 0; i <= s; ++i) cout << i << ' ' << f(n, i) << endl;
}
```

---

```c++
int main() {
  int n;
  cin >> n;
  VE V(n);
  for (int i = 0; i < n; ++i) cin >> V[i];
  int s;
  cin >> s;

  VL R(s + 1, 0);
  R[0] = 1;
  for (int i = 0; i < n; ++i)
    for (int j = V[i]; j <= s; ++j) R[j] += R[j-V[i]];

  for (int i = 0; i <= s; ++i) cout << i << ' ' << R[i] << endl;
}
```

---

```c++
int main() {
  int n, m;
  cin >> n >> m;
  VVE M(n, VE(n, INF));
  for (int i = 0; i < n; ++i) M[i][i] = 0;
  while (m--) {
    int i, j, c;
    cin >> i >> j >> c;
    M[i][j] = c;
  }

  for (int k = 0; k < n; ++k)
    for (int i = 0; i < n; ++i)
      for (int j = 0; j < n; ++j)
        M[i][j] = min(M[i][j], M[i][k] + M[k][j]);

  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j)
      cout << ' ' << (M[i][j] == INF ? -1 : M[i][j]);
    cout << endl;
  }
}
```

---

... dp amb maps...

<Autors autors="jpetit roura"/>
