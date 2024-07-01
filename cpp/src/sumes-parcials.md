# Aplicació: Sumes parcials d'un vector

<img src='./sumes-parcials.png' style='height: 8em; float: right; margin: 0 0 1em 1em;'/>

En aquesta lliçó veurem diferents problemes que involucren trobar la suma d'un
nombre consecutiu d'elements d'un vector, i discutirem diferents tècniques per
resoldre'ls, tenint en compte la seva complexitat algorísmica, és a dir, el
nombre aproximat de passos necessaris per a dur a terme l'algorisme en funció
del nombre de dades a tractar.

## Suma dels elements d'un subvector donades la primera i l'última posició

Suposem que tenim un vector `v` d'enters de llargada `n` i ens demanen
trobar la suma de tots els elements de v que es troben entre la posició
`a` i la posició `b`. En principi, es tracta d'un problema prou simple,
ja que podem simplement recorrer els elements de `v` entre `a` i `b` i
anar acumulant la seva suma. Així, les següents línies de codi
resoldrien el problema:

````c++
int sum = 0;
for (int i = a; i <= b; ++i) {
	sum += v[i];
}
cout << sum << endl;

```c++

En el pitjor del casos haurem de recorrer tot el vector, i per tant la
complexitat del programa serà lineal amb n (això vol dir que el nombre
d'operacions que haurem de fer, i per tant el temps d'execució, serà
directament proporcional a `n`, i ho notarem com O(n)).

Suposem ara que no només volem conéixer la suma d'un subvector de `v`,
sinò que li donarem al nostre probrama un nombre indefinit de parelles
`a`, `b`, i volem que par cada parella ens retorni la suma parcial
corresponent. Un primer intent podria ser reutilitzar el codi que ja hem
escrit pel cas d'una sola parella, i incloure'l dintre d'un bucle
en el qual anirem actualitzant els valors de `a` i `b`. Aquest bucle
deuria quedar semblant al que presentem a continuació

```c++
while (cin >> a >> b) {
	int sum = 0;
	for (int i = a; i <= b; ++i) {
		sum += v[i];
	}
	cout << "La suma del elements entre " << a;
	cout << " i " << b << " es " << sum << "." << endl;
}
````

Si analitzem la complexitat d'aquest bucle veurem que també és
proporcional al nombre de parelles `a` i `b` que entrem al programa,
i per cada parella el nombre d'operacions que efectuem ja hem vist
que és proporcional a `n`. Veurem ara que hi ha una millor manera
d'afrontar aquest problema.

La idea serà crear un nou vector `s` en el que guardarem a la posició
`i` la suma dels elements de `v` entre la posicions `0` i la posició
`i`. Això només ens costarà recorrer un cop tot el vector, i un cop ho
hem fet, ara per cada parella `a`, `b`, podem trobar la suma parcial
simplement restant el contingut de la posició `b` i la posició `a` del
vector `s`, ja que per construcció:

$$
s[b] - s[a] = (v[0] + \cdots + v[b]) - (v[0] + \cdots + v[a]) =
v[a] + \cdots + v[b]
$$

Així doncs, el següent codi és equivalent al que hem presentat abans
però molt més eficient quan el nombre de parelles `a` i `b` és gran:

```c++
vector<int> s(n, 0);
s[0] = v[0];                // El primer element de s ha de ser v[0]
for (int i = 1; i < n; ++i) {
	s[i] = s[i-1] + v[i];   // Així s[i] = v[0] + ... + v[i]
}
while (cin >> a >> b) {
	cout << "La suma del elements entre " << a;
	cout << " i " << b << " es " << s[b] - s[a] << "." << endl;
}
```

Notem que si els elements del vector `v` no ens venen donats en forma
de vector, sinò que els anem entrant al programa, aquesta versió és
encara més útil, ja que ni tan sols cal que guardem els elements a un
vector `v` sinò que podem generar directament el vector de sumes
parcials `s`.

## Màxima suma parcial d'un vector

Volem ara trobar, donat un vector d'enters `v`, quins són els índexs
`a` i `b` tals que la suma parcial entre les posicions `a` i `b` és
màxima. Per exemple, donat el vector `v = {-3, 2, -1, 3, 4, -5, 1}`,
podem comprovar fàcilment que el subvector amb la suma parcial més gran
és el `{2, -1, 3, 4}`, que correspondria a `a = 1`, `b = 4`, i suma 8.

El primer que potser ens ve al cap és un algorisme que salta a la vista
que no serà molt eficient: com que ens demanen la suma parcial màxima,
podem calcular totes les sumes parcials i quedar-nos amb la més gran.
Aquest raonament és el que hem fet servir per escriure el següent codi:

```c++
int maxSum = v[0];          // Aquí guardem la suma més gran fins ara
int maxA = 0;               // I aquí els índex corresponents
int maxB = 0;
for (int a = 0; a < n; ++a) {
	for (int b = a; b < n; ++b) {
		int sum = 0;
		for (int k = a; k <= b; ++k) {
			sum += v[k];       // Calculem la suma parcial entre a i b
		}
		if (sum > maxSum) {
			maxSum = sum;      // Actualitzem el màxim
			maxA = a;          // Actualitzem els índexs
			maxB = b;
		}
	}
}
```

Ja es veu que no es tracta d'una solució òptima, ja que fa servir tres
bucles que recorren el vector `v`, i per tant el temps d'execució serà
proporcional a $n^3$.

Una altra possibilitat seria fer servir el mateix truc que abans i crear
un vector que guardi les sumes parcials des del primer element. El codi
que resultaria no l'escriurem ja que es tracta del mateix que abans
canviant el bucle que calcula `sum` per una simple resta
`sum = s[b] - s[a]`. No obstant, en aquets cas la utilitat del vector
de sumes parcials és pràcticament nul·la ja que podem aprofitar que
estem recorrent tot el vector per anar calculant aquestes sumes. Així,
el següent codi seria equivalent i ens estalviem la creació del vector
`s`.

```c++
int maxSum = v[0];          // Aquí guardem la suma més gran fins ara
int maxA = 0;               // I aquí els índex corresponents
int maxB = 0;
for (int a = 0; a < n; ++a) {
	int sum = 0
	for (int b = a; b < n; ++b) {
		sum += v[b];           // Reaprofitem la suma anterior
		if (sum > maxSum) {
			maxSum = sum;      // Actualitzem el màxim
			maxA = a;          // Actualitzem els índexs
			maxB = b;
		}
	}
}
```

Amb això hem aconseguit resoldre el problema amb només dos bucles que
recorren el vector `v` i per tant la complexitat d'aquest algorisme
és tan sols $O(n^2)$.

No obstant, hi ha una manera de fer-ho encara més eficient, tot i que
aquesta ja és una mica menys directa. Resulta que podem resoldre el
problema de trobar la màxima suma parcial recorrent el vector només un
cop, fent servir la idea següent: la suma parcial màxima que acaba
exactament en la posició`k` és, o bé la mateixa que acaba en la posició
`k-1` afegint l'element `k`, o bé l'element `k` sol (exercici:
demostrar-ho. Podeu raonar-ho per contradicció, no us hauria de resultar
molt complicat.)

Per veure-ho més clar farem un exemple. Considerem el vector
`v = {2, -3, 1, 5, -4}`. El subvector amb suma parcial màxima que acaba
exactament a la posició 0 és el `{2}` ja que no hi ha altre. Trobar
el màxim dels que acaben ala posició 1 tampoc té molt de misteri,
ja que només hi ha les dues opcions que ja considerem. En aquest cas
el màxim és el `{2,-3}`. Pel de la posició 3, el que diu la proposició
d'abans és que només cal mirar entre el `{2,-3,1}` i el `{1}`. En efecte
té sentit ja que si el `{-3,1}` fos més gran que el `{2,-3,1}`, en
particular el `{-3}` seria més gran que el `{2,-3}` i ens hauríem
equivocat triant l'anterior màxim. En el nostre cas el que té suma
màxima és el `{1}`. De la mateixa manera, pel següent només hem de mirar
entre el `{1,5}` i el `{5}` i guanya el `{1,5}`. Per acabar, el
subvector que més gran que acaba en l'última posició és el `{1,5,-4}`,
ja que aquest té suma majir que el `{4}`. Si durant aquest procés ens
anem guardant les sumes d'aquests vectors podem aprofitar el mateix
bucle per comparar-les i quedar-nos amb la més gran, que en aquest cas
seria la de `{1,5}`, que val 6.

El codi que implementa l'algorisme seria així:

```c++
int maxSum = v[0];     // Aquí guardem la suma més gran fins ara
int maxA = 0;          // I aquí els índex corresponents
int maxB = 0;

int sum = v[0];        // Guardarem la màxima suma que acaba en b
int a = 0;             // I aquí l'índex pel qual comença

for (int b = 1; b < n; ++b) {
	if (v[b] > sum) {
		sum = v[b];    // Cas en que l'element sol és més gran
		a = b;
	}
	else {
		sum += v[b];   // Cas en que afegim el nou element a la suma
	}

	if (sum > maxSum) {
		maxSum = sum;      // Actualitzem el màxim
		maxA = a;          // Actualitzem els índexs
		maxB = b;
	}
}
```

<Autors autors="rafah"/>
