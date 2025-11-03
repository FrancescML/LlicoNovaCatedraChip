# Aplicació: Sumes parcials d'una llista

<img src='./sumes-parcials.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

En aquesta lliçó veurem diferents problemes que involucren trobar la suma d'un nombre consecutiu d'elements d'una llista, i discutirem diferents tècniques per resoldre'ls, tenint en compte la seva complexitat algorísmica, és a dir, el nombre aproximat de passos necessaris per a dur a terme l'algorisme en funció del nombre de dades a tractar.

## Suma dels elements d'una subllista donades la primera i l'última posició

Suposem que tenim una llista `L` d'enters de llargada `n` i ens demanen trobar la suma de tots els elements de `L` que es troben entre la posició `a` i la posició `b`. Es tracta d'un problema prou simple, ja que podem simplement recórrer els elements de `L` entre `a` i `b` i anar acumulant la seva suma. Així, les següents línies de codi resoldrien el problema:

```python
s = 0
for i in range(a, b + 1):
	s += L[i]
print(s)
```

En el pitjor del casos haurem de recórrer tota la llista, i per tant la complexitat del programa serà lineal amb `n` (això vol dir que el nombre d'operacions que haurem de fer, i per tant el temps d'execució, serà directament proporcional a `n`, i ho notarem com $O(n)$).

Suposem ara que no només volem coèéixer la suma d'una subllista de `L`, sinó que li donarem al nostre programa un nombre indefinit de parelles `a`, `b`, i volem que per cada parella ens retorni la suma parcial corresponent. Un primer intent podria ser reutilitzar el codi que ja hem escrit pel cas d'una sola parella, i incloure'l dintre d'un bucle en el qual anirem actualitzant els valors d'`a` i `b`:

```python
for a in tokens(int):
	b = read(int)
	s = 0
	for i in range(a, b + 1):
		s += L[i]
	print(f'La suma del elements entre {a} i {b} és {s}')
```

Si analitzem la complexitat d'aquest bucle veurem que també és proporcional al nombre de parelles `a` i `b` que entrem al programa, i per cada parella el nombre d'operacions que efectuem ja hem vist que és proporcional a `n`. Veurem ara que hi ha una millor manera d'afrontar aquest problema.

La idea serà usar una nova llista `S` on guardarem a la posició `i` la suma dels elements de `L` entre la posicions `0` i la posició `i`. Crearem `S` tot recorrent un sol cop`L`, i un cop ho haguem fet, per cada parella `a`, `b`, podem trobar la suma parcial simplement restant el contingut de la posició `b` al de la posició `a` de `S`, ja que per construcció:

$$
S[b] - S[a] = (L[0] + \cdots + L[b]) - (L[0] + \cdots + L[a]) = L[a] + \cdots + L[b]
$$

Així doncs, el codi següent és equivalent al que hem presentat abans però molt més eficient quan el nombre de parelles `a` i `b` és gran:

```python
n = len(L)
s = [0 for _ range(n)]
S[0] = L[0]               	# el primer element de s ha de ser L[0]
for i in range(1, n):
	S[i] = S[i - 1] + L[i]  # així S[i] = L[0] + ··· + L[i]
for a in tokens(int):
	b = read(int)
	s = S[b] - S[a]
	print(f'La suma del elements entre {a} i {b} és {s}')
```

## Màxima suma parcial d'una llista

Considerem qua ara, donada una llista d'enters `L`, volem trobar quins són els índexs `a` i `b` tals que la suma parcial entre les posicions `a` i `b` és màxima. Per exemple, donada la llista `L = [-3, 2, -1, 3, 4, -5, 1]`, la subllista amb la suma parcial més gran és `[2, -1, 3, 4]`, que correspondria a `a = 1`, `b = 4`, i suma 8.

Com que volem la suma parcial màxima, una possible manera de procedir és calcular totes les sumes parcials i quedar-se amb la més gran. Aquesta idea és el que hem fet servir per escriure el code següent:

```python
maxSum = L[0]          # aquí guardem la suma més gran fins ara
maxA = 0               # i aquí els índex corresponents
maxB = 0
for a in range(0, n):
	for b in range(a, n):
		# calculem la suma parcial entre a i b
		s = 0
		for k in range(a, b + 1):
			s += L[k]
		# si és més gran que la millor fins ara, actualitzem màxim i índexs
		if s > maxSum:
			maxSum, maxA, maxB = s, a, b
```

Ja es veu que no es tracta d'una solució gaire eficient, ja que fa servir tres bucles que recorren la llista `L`, i per tant el temps d'execució serà proporcional a $n^3$.

Una altra possibilitat seria fer servir el mateix truc que abans i crear una llista que guardi les sumes parcials des del primer element. El codi que resultaria no l'escriurem ja que es tracta del mateix que abans canviant el bucle que calcula `s` per una simple resta `s = S[b] - S[a]`. No obstant, en aquests cas la utilitat dla llista de sumes parcials és pràcticament nul·la ja que podem aprofitar que estem recorrent tota la llista per anar calculant aquestes sumes. Així, el code següent seria equivalent i ens estalviem la creació de la llista `S`.

```python
maxSum = L[0]          # Aquí guardem la suma més gran fins ara
maxA = 0               # I aquí els índex corresponents
maxB = 0
for a in range(0, n):
	s = 0
	for b in range(a, n):
		# calculem la suma parcial entre a i b reaprofitant la suma anterior
		s += L[b]
		# si és més gran que la millor fins ara, actualitzem màxim i índexs
		if sum > maxSum:
			maxSum, maxA, maxB = s, a, b
```

Amb això hem aconseguit resoldre el problema amb només dos bucles que recorren la llista `L` i per tant la complexitat d'aquest algorisme és tan sols $O(n^2)$.

No obstant, hi ha una manera de fer-ho encara més eficient, tot i que aquesta ja és una mica menys directa. Resulta que podem resoldre el problema de trobar la màxima suma parcial recorrent la llista només un cop, fent servir la idea següent: la suma parcial màxima que acaba exactament en la posició `k` és, o bé la mateixa que acaba en la posició `k - 1` afegint l'element `k`, o bé l'element `k` sol.

**Exercici:** Demostreu-ho. Podeu raonar-ho per contradicció, no és molt complicat.

Per veure-ho més clar farem un exemple. Considerem la llista
`L = [2, -3, 1, 5, -4]`. La subllista amb suma parcial màxima que acaba exactament a la posició 0 és el `[2]` ja que no hi ha altre. Trobar el màxim dels que acaben a la posició 1 tampoc té molt de misteri, ja que només hi ha les dues opcions que ja considerem. En aquest cas el màxim és el `[2,-3]`. Pel de la posició 3, el que diu la proposició d'abans és que només cal mirar entre el `[2,-3,1]` i el `[1]`. En efecte té sentit ja que si el `[-3,1]` fos més gran que el `[2,-3,1]`, en particular el `[-3]` seria més gran que el `[2,-3]` i ens hauríem equivocat triant l'anterior màxim. En el nostre cas el que té suma màxima és el `[1]`. De la mateixa manera, pel següent només hem de mirar entre el `[1,5]` i el `[5]` i guanya el `[1,5]`. Per acabar, la subllista que més gran que acaba en l'última posició és el `[1,5,-4]`, ja que aquest té suma major que el `[4]`. Si durant aquest procés ens anem guardant les sumes d'aquests vectors podem aprofitar el mateix bucle per comparar-les i quedar-nos amb la més gran, que en aquest cas seria la de `[1,5]`, que val 6.

El codi que implementa l'algorisme seria així:

```python
maxSum, maxA, maxB = L[0], 0, 0
s = L[0]        # guardarem la màxima suma que acaba en b
a = 0           # i aquí l'índex pel qual comença

for b in range(1, n):
	if L[b] > sum:
		# cas en que l'element sol és més gran
		s, a = L[b], b
	else:
		# cas en que afegim el nou element a la suma
		s += L[b]
		if sum > maxSum:
			maxSum, maxA, maxB = s, a, b
```

Ara, tot el programa té un cost lineal en $n$, és a dir, $O(n)$.

<Autors autors="jpetit rafah"/>
