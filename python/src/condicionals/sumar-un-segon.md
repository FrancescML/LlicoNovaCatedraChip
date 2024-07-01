# Aplicació: Suma d'un segon

<img src='./rellotge-digital.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

Aquest lliçó reforça l'ús de la instrucció condicional amb un programa que afegeix un segon a una hora del dia, donades les seves hores, minuts i segons.


## Descripció del problema

Considereu el problema següent: Donada una hora del dia (a través dels valors corresponents a les hores, els minuts i els segons), es vol sumar un segon a aquesta hora. A més, es vol que el resultat s'escrigui amb el format habitual dels rellotges: les hores, minuts i segons s'escriuen amb dos dígits i se separen per dos punts. Per exemple, donada l'hora ~~14:09:59~~, cal escriure ~~14:10:00~~.

### Entrada

L’entrada consisteix en tres naturals `h`, `m` i `s` que representen una hora del dia, és a dir, tals que 0 ≤ `h` < 24, 0 ≤ `m` < 60, i 0 ≤ `s` < 60.

### Sortida

Cal escriure el nou temps definit per h, m i s més un segon, en el format ~~HH:MM:SS~~.

### Exemples

- Per a l'entrada ~~10 20 30~~ cal escriure ~~10:20:31~~.
- Per a l'entrada ~~0 0 59~~   cal escriure ~~00:01:00~~.
- Per a l'entrada ~~23 59 59~~ cal escriure ~~00:00:00~~.


## Solució

Per resoldre el problema, dividirem el programa en tres passos:

1. Primer, es llegiran les dades de l'entrada (una hora del dia).
2. Després, se sumarà un segon a aquesta hora del dia.
3. Finalment, s'escriurà l'hora del dia resultant, en el format requerit.

És molt habitual dividir un programa en aquests tres passos (lectura, càlcul i escriptura). A continuació els detallem:

### 1. Lectura de l'hora

Tal com diu l'enunciat, l’entrada consisteix en tres naturals `h`, `m` i `s` que representen una hora del dia.

La lectura és ben senzilla: només cal llegir les tres dades, l'una darrera l'altra:

```python
h = yogi.read(int)
m = yogi.read(int)
s = yogi.read(int)
```

Recordeu que aquestes instruccions llegeixen tres enters i els desa en ordre en les variables `h`, `m` i `s` respectivament.


### 2. Increment d'un segon

Per sumar un segon a l'hora, cal sumar una unitat a la variable `s`, que representa el nombre de segons. Com ho farem? Amb la instrucció

```python
s = s + 1
```

Per exemple, suposem que `s` val 23 abans d'executar aquesta línia. Primer, es calcula el valor de `s + 1`, el qual és 24. Després, aquest valor es copia a `s`. Realment, l'efecte final és un increment d'`s`, en aquest cas de 23 a 24.

Si el nombre resultant en `s` és menor que 60, ja hem acabat. Altrament, el nombre de segons és exactament 60 (perquè sabem per l'enunciat que estava entre 0 i 59), i per tant cal posar a zero el nombre de segons `s` i sumar un a la variable `m`, que representa el nombre de minuts. Si el nombre resultant és menor que 60, ja hem acabat també. Sinó, caldrà posar a zero el nombre de minuts `m` i sumar un a la variable `h`, que representa el nombre d'hores. Finalment, si el nombre d'hores resultant és 24, també cal posar `h` a zero, perquè les ~~24:00:00~~ no és una hora vàlida: hauria de ser ~~00:00:00~~.

Tot aquest procés el podem implementar de la forma següent amb condicionals aniuats:

```python
s = s + 1
if s == 60:
    s = 0
    m = m + 1
    if m == 60:
        m = 0
        h = h + 1
        if h == 24:
            h = 0
```

En aquest programa, les frases com ara "*Si el nombre resultant és menor que 60, ja hem acabat. Sinó, ...*" han estat codificades del revés: `if s == 60: ...`. D'aquesta forma ens estalviem construccions amb cossos buits.

> 👁️ Recordeu que l'operador de comparació s'escriu amb dos iguals (`==`) i que la instrucció d'assignació utilitza un sol igual (`=`). Per això, quan es comprova si `h` ha arribat a 24 s'utilitza la condició `h == 24`, però quan es posa el seu valor a zero s'utilitza la instrucció `h = 0`. A més, fixeu-vos que, en informàtica, l'operador d'assignació `=` (llegit *pren per valor*) indica que el valor expressat a la dreta s'ha de desar a la variable de l'esquerra. En matemàtiques, *s* = *s* + 1 seria una absurditat.




### 3. Escriptura del resultat

Un cop incrementada l'hora del dia en un segon, toca escriure el resultat: els valors de les variables`h`, `m` i `s` separats per `:`. A més, cal assegurar que cada nombre s'escrigui amb dos dígits. Com aconseguir-ho? Doncs escrivint un zero abans si el seu valor no arriba a deu.

Podríem doncs intentar escriure la part corresponent a l'hora d'aquesta forma:

```python
if h < 10:
    print(0, h)
else:
    print(h)
```

Però això té dues pegues:

1. Al `print(0, h)`, el `0` i `h` s'escriuen separats per un espai.

2. Cadascun dels dos `print`s acaba amb un salt de línia, cosa que farà
que el proper text aparegui a la línia següent.

Per això, a la funció li haurem d'especificar dos paràmetres addicionals:

1. `sep` indica quin text separarà els elements donats,

2. `end` indica quin text s'escriurà al final del `print`.

Els podem usar així:

```python
if h < 10:
    print(0, h, sep='', end=':')
else:
    print(h, end=':')
```

de forma que la separació entre el `0` i `h` sigui buida i que s'escriguin els dos punts al final.

Llavors ja només cal completar-ho de la mateixa forma per la part dels minuts i dels segons:

```python
if m < 10:
    print(0, m, sep='', end=':')
else:
    print(m, end=':')
if s < 10:
    print(0, s, sep='')
else:
    print(s)
```

Pels minuts, és igual que per les hores; pels segons, ja no cal prescriure cap finalitzador, el valor per defecte de `end` és un salt de línia i ja ens convé.


### Solució completa

El programa complet queda doncs així:

```python
import yogi

# llegir l'hora del dia
h = yogi.read(int)
m = yogi.read(int)
s = yogi.read(int)

# sumar-li un segon
s = s + 1
if s == 60:
    s = 0
    m = m + 1
    if m == 60:
        m = 0
        h = h + 1
        if h == 24:
            h = 0

# escriure l'hora del dia resultant en el format adeqüat
if h < 10:
    print(0, h, sep='', end=':')
else:
    print(h, end=':')
if m < 10:
    print(0, m, sep='', end=':')
else:
    print(m, end=':')
if s < 10:
    print(0, s, sep='')
else:
    print(s)
```



### Solució alternativa

Per resoldre aquest problema, també ens podem inspirar en el programa de la descomposició horària. La part del càlcul del resultat quedaria així:

```python
# sumar-li un segon
n = 3600*h + 60*m + s + 1       # calcular nombre total de segons
if n == 3600 * 24:              # per evitar el 24:00:00
    n = 0
h = n // 3600                   # calcular el nombre d'hores
m = (n % 3600) // 60            # calcular el nombre de minuts
s = n % 60                      # calcular el nombre de segons
```




<Autors autors="jpetit roura"/>
