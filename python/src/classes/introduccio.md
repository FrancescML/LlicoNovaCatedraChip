
# Classes i objectes

<img src='./classes.png' style='height: 8em; float: right; margin: 0 0 1em 2em;'/>

Aquesta lliçó presenta com estendre les estructures (*dataclasses*) en classes tot agegint mètodes que implementen operacions. Per a fer-ho, es revisa la implementació de la classe `Hora` i es presenten els conceptes de classe, objecte i constructor. Com a exemples addicionals es presenta una classe per a la simulació del moviment d'un pèndol i s'esbossa un sistema de classes per implementar un sistema de cites mèdiques.


## Introducció

Recordeu que una **estructura** és una col·lecció de dades dades relacionades que s'emmagatzemen en un sol lloc, com un tot. Una estructura està composta per una sèrie de camps, cadascun amb el seu nom i el seu tipus. En Python, les estructures s'implementen amb *dataclasses*. Per exemple, aquesta seria una estructura per a l'hora d'un rellotge digital:

```python
@dataclass
class Hora:
    h: int = 0      # hora  (0..23)
    m: int = 0      # minut (0..59)
    s: int = 0      # segon (0..59)
```

Recordeu també que es pot crear una nova variable de tipus `Hora` tot usant el tipus `Hora` com una funció i accedir als seus camps amb l'operació de selecció (el punt):

```python
ara = Hora(17, 45)      # tres quarts de sis de la tarda

print(ara.hora)         # escriu 17
```

Quan s'usen estructures és habitual definir noves accions i funcions al seu voltant. Per exemple:

```python
def escriure_hora(hora: Hora) -> None:
    print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')


def incrementar_un_segon(hora: Hora) -> None:
    hora.s += 1
    if hora.s == 60:
        hora.s = 0
        hora.m += 1
        if hora.m == 60:
            hora.m = 0
            hora.h += 1
            if hora.h == 24:
                hora.h = 0
```

Enlloc de tenir aquestes funcions i accions deslligades de les dades, les *dataclasses* permeten incloure aquestes operacions dins del propi tipus:

```python
@dataclass
class Hora:
    h: int = 0      # hora  (0..23)
    m: int = 0      # minut (0..59)
    s: int = 0      # segon (0..59)

    def escriure(hora: Hora) -> None:
        print(f'{hora.h:02d}:{hora.m:02d}:{hora.s:02d}')

    def incrementar_un_segon(hora: Hora) -> None:
        hora.s += 1
        if hora.s == 60:
            hora.s = 0
            hora.m += 1
            if hora.m == 60:
                hora.m = 0
                hora.h += 1
                if hora.h == 24:
                    hora.h = 0
```

Ara, `escriure_hora` i `incrementar_un_segon` ja no s'anomenen funcions o accions, sinó *mètodes*, perquè formen part de la classe. A diferència de les funcions i accions, els mètodes no es criden amb el valor com a paràmetre, sinó que es criden a través de l'operador de selecció (com els camps de dades):

```python
ara = Hora(17, 45)      # tres quarts de sis de la tarda

ara.incrementar_un_segon()
ara.escriure()
```

Si calgués definir una funció que incrementés una hora d'un nombre determinat de segons, aquest valor es donaria com a paràmetre del mètode:

```python
@dataclass
class Hora:
    ...

    def incrementar_segons(hora: Hora, segons: int) -> None:
        for _ in range(len(segons)):
            hora.incrementar_un_segon()
```

i es cridaria així:

```python
ara.incrementar_segons(60)
```

A mi m'agrada llegir això com una frase del tipus *subjecte*, *verb* i *complements*: A `ara.incrementar_segons(60)`, `ara` és el subjecte, `incrementar_segons` és el verb i `60` el complement. [Per això sempre he pensat que la programació orientada a objeces s'hauria de dit programació orientada a subjectes... En fi, això és cosa meva 😔.]

Suposo que en aquest punt us feu càrrec que aquesta notació ja l'havíem utilitzada: Per exemple, a `L.append(42)`, `L` fa refèrència a una llista que té un mètode `append` al qual li passem el paràmetre `42`.

Fixeu-vos que `Hora` defineix un tipus, i que aquest tipus és una classe. Les variables de tipus `Hora` es diuen **objectes** (o **instàncies**) de la classe `Hora`. Una classe és doncs una mena de motlle pel qual es poden crear molts objectes, tots del mateix tipus, però cadascun amb les seves dades i operacions.

Així, com si res, hem aconseguit que les classes no només tinguin camps que enmagatzemen dades, sinó que poden tenir mètodes que represeten càlculs sobre aquestes dades. Ni que sigui com a recurs per tenir els programes més endreçats, això ja és útil, però àviat en veurem molts més avantatges.


## Classes (sense *dataclasses*) amb constructors

Quan s'utilitzen classes, no és habitual fer-ho amb `dateclasses` com ho hem fet abans. Les *data classes* són, senzillament, unes classes especialment tunejades per contenir dades, però un cop es comenen a afegir mètodes, aquestes decoracions perden importància. A més, en Python hi ha la convenció d'utilitzar el paràmetre `self` com a subjecte del mètodes.

Així, la classe anterior es podria escriure d'aquesta manera:

```python
class Hora:         # sense @dataclass!
    h: int = 0      # hora  (0..23)
    m: int = 0      # minut (0..59)
    s: int = 0      # segon (0..59)

    def escriu(self) -> None:
        print(f'{self.h:02d}:{self.m:02d}:{self.s:02d}')

    def incrementa_un_segon(self) -> None:
        self.s += 1
        if self.s == 60:
            self.s = 0
            self.m += 1
            if self.m == 60:
                self.m = 0
                self.h += 1
                if self.h == 24:
                    self.h = 0

    def incrementa_segons(self, segons: int) -> None:
        for _ in range(len(segons)):
            self.incrementa_un_segon()
```

Malgrat que el tipus de @self@ es podria anotar, no se sol fer perquè ja se sobreentén que és de tipus `Hora`, perquè fa part de la classe `Hora`.

Ara bé, ara hem perdut la possibilitat de crear hores tot especificant-ne el seu valor inicial: totes les hores s'inicialitzen a mitjanit:

```python
hora = Hora()
hora.escriu()       # escriure 00:00:00
```

Per poder inicialitzar el valor de l'hora, cal que definim un **constructor**. Un constructor és el bocí de codi que s'encarrega de crear un objecte d'una classe. En Python, el constructor s'escriu com un mètodes que s'anomena `__init__` i no retorna res:

```python
class Hora:
    h: int
    m: int
    s: int

    def __init__(self, hores: int = 0, minuts: int = 0, segons: int = 0):
        self.h = hores
        self.m = minuts
        self.s = segons

    ...
```

Ara es poden crear hores a través del constructor, el qual ja compta amb valors per defecte:

```python
mitjanit = Hora()
migdia = Hora(14)
tresquartsdequinze = Hora(14, 45, 0)
```

El constructor pot executar qualsevol mena de codi. Per exemple, es pot encarregar de comprovar que els paràmetres donats són correctes:

```python
    def __init__(self, h: int = 0, m: int = 0, s: int = 0):
        assert 0 <= h < 24 and 0 <= m < 60 and 0 <= s < 60
        self.h = h
        self.m = m
        self.s = s
```

En canvi, les dataclasses no tenen manera d'actuar sobre les dades amb què s'inicialitzen els objectes.

De pas, fixeu-vos que no hi ha confusió possible entre els noms dels paràmetres del constructor  (o dels mètodes en general) i els noms dels camps de l'objecte: els darrers sempre han d'anar prefixats per `self.`.


## Exemple: Classe per a simular un pèndol

A continuació es crea una petita classe per simular el moviment d'un pèndol:

```python
class Pendol:

    longitud: float
    massa: float
    angle: float

    def __init__(self, longitud: float, massa: float, angle_inicial: float):
        """Crea un pèndol"""
        self.longitud = longitud
        self.massa = massa
        self.angle = angle_inicial

    def calcula_posicio(self, temps: float) -> float:
        """Calcula la posició actual en funció del temps i l'angle inicial"""

        posicio = self.longitud * math.sin(self.angle)
        return posicio

    def simula_moviment(self, temps_total: float, pas_temps: float) -> None:
        """Simula el moviment durant un cert temps."""

        temps = 0
        while temps <= temps_total:
            # Actualitzar l'angle en funció del temps
            nova_posicio = self.calcular_posicio(temps)
            print(f'Temps: {temps} segons, Posició: {nova_posicio} metres')

            # Avançar en el temps
            temps += pas_temps
```

Aquest en seria un exemple d'ús:

```python
pendol1 = Pendol(longitud=2.5, massa=0.5, angle_inicial=math.radians(30))
pendol1.simular_moviment(10, 0.5)
```


## Exemple: Classes per a un sistema de cites mèdiques

A continuació esbossem un sistema rudimentari de cites mèdiques que gestiona programacions de cites amb metges. Incorpora una classe `Metge` amb informació com el nom i l'especialitat, una classe `Cita` amb una hora i una data per una cita amb un metge i si s'ha realitzat o no, i permet programar, cancel·lar i consultar cites, mantenint el seguiment de si les cites han estat realitzades o no. Els metges es poden afegir al sistema per gestionar la seva disponibilitat i les cites s'organitzen amb detalls de data, hora i metge assignat. `Hora`, `Data`, `Cita` i `Metge` es fan amb dataclasses, perquè només contenen dades. En canvi, `SistemaCites` ja té comportament, per tant es fa amb una classe.

```python

@dataclass
class Hora:  ...

@dataclass
class Data:  ...

@dataclass
class Cita:
    data: Data
    hora: Hora
    metge: Metge
    realitzada: bool

@dataclass
class Metge:
    nom: str
    especialitat: str

class SistemaCites:

    cites: list[Cita]
    metges_disponible: list[Metge]

    def __init__(self):
        self.cites = []
        self.metges_disponibles = []

    def afegir_metge(self, metge):
        self.metges_disponibles.append(metge)

    def programar_cita(self, data: Data, hora: Hora, metge: Metge):
        if self.verificar_disponibilitat_metge(metge):
            cita = Cita(data, hora, metge, false)
            self.cites.append(cita)
            self.metges_disponibles.remove(metge)
            return f'Cita programada amb {metge.nom} per al {data} a les {hora}.'
        else:
            return f'{metge.nom} no està disponible.'

    def verificar_disponibilitat_metge(self, metge: Metge) -> bool:
        return metge in self.metges_disponibles

    def cancelar_cita(self, cita):
        metge_alliberat = cita.metge
        self.metges_disponibles.append(metge_alliberat)
        self.cites.remove(cita)
        return f'Cita cancel·lada amb {metge_alliberat.nom}.'

    def marcar_cita_com_realitzada(self, cita):
        cita['realitzada'] = True

    def consultar_cites(self):
        return self.cites
```

Modelar els conceptes i entitats d'un sistema mitjançant classes és convenient per diverses raons:

- Primerament, les classes permeten encapsular les propietats i comportaments relacionats d'una entitat en una única estructura, facilitant així la gestió i organització del codi.

- En segon lloc, les relacions entre classes reflecteixen les interaccions i dependències entre les entitats del sistema, proporcionant una representació clara i estructurada de la lògica del programa.

- A més a més, aquest enfocament permet la reutilització de codi, ja que les classes poden ser instanciades en diverses parts de l'aplicació, millorant la cohesió i mantenibilitat del sistema en el temps.

En conjunt, modelar les entitats i relacions en classes proporciona una base robusta per al desenvolupament d'aplicacions modulars, comprensibles i flexibles.








<Autors autors="jpetit"/> 

