# Lectura i escriptura


# TODO: Millorar


## Lectura

Com s'ha mencionat prèviament, l'instrucció `input` de Python s'utilitza per llegir dades des de *stdin* (potser amb un prompt mostrat prèviament a *stdout*).

No obstant això, l'ús de `input` té limitacions, ja que només permet llegir una línia de text. Per abordar aquests problemes i obtenir una forma més precisa i eficaç de llegir dades, en aquest curs farem servir el paquet `yogi`. D'aquesta manera, podrem superar les limitacions de input i millorar el procés de lectura de dades. Per usar el paquet `yogi`, cal haver-lo instal·lat previament (amb `pip3 install yogi`).

Per usar el paquest `yogi`, cal fer un `import yogi` (de forma semblant al `import turtle`). `yogi` ofereix una funció `read` que permet llegir dades enteres, reals o textuals. Cal especificar quin tipus de dades es vol llegir com a paràmetre: `int` per enters, `float` per reals o `str` per textos (paraules, concretament):

```python
>>> import yogi
>>> i = yogi.read(int)
12
>>> i
12
>>> f = yogi.read(float)
3.14
>>> f
3.14
>>> s = yogi.read(str)
Setembre
>>> s
'Setembre'
```

Gràcies a `yogi`, les dades es poden llegir malgrat que es trobin a la mateixa o en diferents línies. Per exemple, la instrucció següent llegeix dos enters i n'escriu la seva suma.

```python
>>> print(yogi.read(int) + yogi.read(int))
3 4
7
```

I també funciona amb dades separades per molts espais o línies:

```python
>>> print(yogi.read(int) + yogi.read(int))


3



          4
7
```

Aconseguir això amb `input` és practicament impossible.

Si es llegeix una dada d'un tipus no prescrit, es produirà un error. Per exemple:

```python
>>> i = yogi.read(int)
23.56
ValueError: invalid literal for int() with base 10: '23.56'
```

`yogi` ofereix més operacions, que veurem més endavant però abans d'acabar, fixeu-vos que es pot importar directament una funció d'un paquet per no haver d'anar prefixant-la amb el nom del paquet cada vegada:

```python
>>> from yogi import read
>>> print(read(int) + read(int))
```

En programes llargs no convé usar la forma `from ... import ...`, però per programes curts o d'usar i llençar, val la pena.



<Autors autors="jpetit"/>