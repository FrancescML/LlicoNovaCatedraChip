# Aplicació: Producte escalar

<img src='./producte-escalar.png' style='height: 6em; float: right; margin: 0 0 1em 1em;'/>


Aquesta lliçó mostra una aplicació matemàtica
als vectors: el càlcul del producte escalar de dos
vectors. A més, de passada, introdueix la instrucció
estàndard `assert()` que permet explicitar assercions
per detectar situacions anòmales en els programes.


## Producte escalar en matemàtiques

Recordeu que, en matemàtiques, el producte escalar —també conegut com a producte
interior o punt— de dos vectors de $n$ components $a=[a_1,a_2,\\dots,a_n]$
i $b=[b_1,b_2,\\dots,b_n]$ és el valor

\\[a·b = \\sum_{i=1}^n a_i b_i.\\]

Per exemple, el producte escalar de [1, 4, -3] i [2, -1, -2] és
1·2 + 4·(-1) + (-3)·(-2) que és 4.


## Producte escalar en C++

En informàtica, és molt còmode representar els vectors matemàtics utilitzant
vectors de reals. Només cal anar en compte amb els índexos: en matemàtiques solen
començar per 1, però en C++ comencen per zero.

Donats els vectors d'enters `a` i `b` de la mateixa talla,
aquesta senzilla funció retorna el seu producte escalar:

```c++
// retorna el producte escalar de dos vectors de la mateixa talla
double producte_escalar(const vector<double>& a, const vector<double>& b)
{
    int n = a.size();
	double s = 0;    
	for (int i = 0; i < n; ++i) {
		s += a[i] * b[i];
	}
	return s;
}
```

Per a fer-ho, els productes dels parells de `a` i de `b` es van acumulant
en una variable `s` inicialitzada a zero que, finalment, és retornada.
Fixeu-vos com estem emulant en C++ el sumatori matemàtic!

Observeu també que, a la capçalera de la funció, els vectors s'han passat per
referència constant: En efecte, es tracta de paràmetres d'entrada que
no val la pena copiar.

Per provar que la funció anterior funciona bé la podríem invocar així

```c++
cout << producte_escalar({1 ,4 -3}, {2, -1, -2}) << endl;
```

i comprovar que escriu 4.


## Assercions

Quan s'empra la funció anterior, es pot donar el problema de que l'usuari passi
vectors de talles diferents (i mira que li hem dit que no ho faci al comentari,
però els usuaris són humans i es solen equivocar!). Si el primer vector és més
curt que el segon, la funció retorna el producte escalar "retallant" el segon
vector, cosa que  pot ser més o menys admissible però que no provoca cap error.
En canvi, si el primer vector és més llarg que el segon, la funció consultarà un
element del segon vector que no existeix, i això és un error.

Si volem comprovar explícitament dins de la funció que els dos vectors  tenen la
mateixa talla, podríem incloure un condicional que, en cas negatiu, escrigués
algun missatge d'error. Seria una cosa així:

```c++
// retorna el producte escalar de dos vectors de la mateixa talla
double producte_escalar(const vector<double>& a, const vector<double>& b)
{
    if (a.size() != b.size()) {
        cout << "vectors de mida diferent" << endl;
    }

    int n = a.size();
	double s = 0;    
	for (int i = 0; i < n; ++i) {
		s += a[i] * b[i];
	}
	return s;
}
```

Però això tampoc ajuda massa, perquè s'escriu el missatge d'error però després
es continua endavant, com si no hagués de passar res.

Una manera d'aturar el programa i donar un diagnòstic pertinent  és
utilitzant la instrucció `assert()` que reb com a paràmetre un valor booleà. Si
aquest booleà és cert, no fa res. En canvi, si és fals, atura el programa i
indica la línia on s'ha aturat, per poder saber què ha passat. En aquest cas,
faríem això:

```c++
// retorna el producte escalar de dos vectors de la mateixa talla
double producte_escalar(const vector<double>& a, const vector<double>& b)
{
    assert(a.size() == b.size());

    int n = a.size();
	double s = 0;    
	for (int i = 0; i < n; ++i) {
		s += a[i] * b[i];
	}
	return s;
}
```

La condició booleana dins d'un `assert` es diu una **asserció** i és
una condició que el programador pressuposa que es compleix. Si, per alguna raó
en temps d'execució aquesta asserció no es compleix, el programa s'aturarà
i proporcionarà un diagnòstic com ara el següent:

```text
Assertion failed: (a.size() == b.size()), function producte_escalar, file producte-escalar.cc, line 9.
Abort trap: 6
```

Afegir assercions als programes és una manera de millorar-ne la seva
documentació i de reforçar la seva seguretat. Ara bé, les assercions
consumeixen temps i, per això, hi ha maneres de desabilitar-les
(només cal compilar amb `-DNODEBUG`).

Una nota final: per tal d'utilitzar `assert()` heu d'incloure la llibreria
`cassert` fent un `#include <cassert>` al principi del programa.

## Exemple: vectors perpendiculars

Volem fer una funció booleana que ens digui si dos vectors de $\mathbb{R}^3$
són o no prependiculars. Com sabreu, dos vectors de l'espai `a`, `b` són
perpendiculars si i només si el seu producte escalar és zero. Així, la funció quedaria


```c++
bool son_perpendiculars(const vector<double>& a, const vector<double>& b)
{
    return producte_escalar(a, b) == 0;
}


double producte_escalar(const vector<double>& a, const vector<double>& b)
{
    ...
}
```

amb la funció `producte_escalar` que hem escrit abans.

<? author("rafah jpetit") ?>

