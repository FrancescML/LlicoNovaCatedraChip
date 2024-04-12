# Lectura i escriptura: escriptura


## Escriptura amb `print`

Com ja hem vist anteriorment, `print` és la instrucció d'escritura de Python i serveix per escriure dades a *stdout*.

Per escriure un valor, només cal passar el valor com a paràmetre del `print`:

```python
>>> print('Hola')
Hola
>>> print(2023)
2023
>>> var = 3.1416
>>> print(var)
3.1416
```

Per defecte, `print` afegeix un salt de línia a l'acabar l'escriptura.

Si es volen escriure moltes dades en una sola línia, es poden passa múltiple paràmetres separats per comes:

```python
>>> print('Hola', 'Jordi')
Hola Jordi
>>> print(31, 12, 2023)
31 12 2023
>>> print()

>>> print(2023, 'Carles', 0.5)
2023 Carles 0.5
```

Sense cap paràmetre, escriu una línia buida.


Es pot modificar le funcionament de `print` especificant dos paràmetres addicionals:

1. `sep` indica quin text separarà els elements donats,

2. `end` indica quin text s'escriurà al final del `print`.

Per defecte, `sep` és un espai i `end` és un salt de linia.

Aquests exemples mostren com utilitzar el `sep`:

```python
>>> print('Hola', 'Jordi', sep='_')
Hola_Jordi
>>> print(31, 12, 2023, sep='_')
31_12_2023
>>> print(31, 12, 2023, sep='')
31122023
>>> print(31, 12, 2023, sep='   ')
31   12   2023
```

I aquests exemples mostren com utilitzar el `end`:

```python
>>> print('Hola', 'Jordi', end='.')
Hola Jordi.>>> print('Hola', 'Jordi', end='\n\n')
Hola Jordi

>>>
```

En el primer cas, com que enlloc d'un salt de línia s'ha escrit un punt, el *prompt*  queda enganxat al text. El el segon cas, el `end` val dos salts de línia (el text especial `\n` és un salt de línia), i per això l'escritura deixa una línia de separació.

Evidentment, `end` i `sep` es poden usar alhora. Aquest exemple separa els elements amb comes i els acaba amb un punt:

```python
>>> print('Amalia', 'Maria', 'Emma', end=',', sep='.')
Amalia,Maria,Emma.>>>
```

El *prompt* (`>>>`) només es veu perquè aquests exemples usen l'intèrpret de Python. Estigueu tranquils que quan fem programes sencèrs, no apareixeran.

`print` té més opcions, però aquestes són les poques que necessitarem.




<Autors autors="jpetit"/>