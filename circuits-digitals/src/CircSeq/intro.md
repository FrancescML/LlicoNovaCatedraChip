<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits seqüencials

Els circuits seqüencials són un tipus de circuits digitals en què el valor de la sortida no depèn únicament de les entrades actuals, sinó també de l’estat anterior del circuit. Això vol dir que tenen memòria.

A diferència dels circuits combinacionals, que només calculen resultats instantanis a partir d’una entrada, els circuits seqüencials guarden informació sobre el passat mitjançant elements de memòria.

Els circuits seqüencials són fonamentals en la construcció de memòries, comptadors, registres, unitats de control i processadors. 

### Sincronització i rellotge
Molts circuits seqüencials funcionen sincronitzats amb un senyal de rellotge (clock) que marca el ritme amb què es produeixen els canvis d’estat.
Els circuits seqüencials es poden classificar segons com gestionen el temps.

**Sistemes Seqüencials Síncrons**: Els canvis en l'estat (i les sortides) només es produeixen en instants de temps ben definits, marcats per un senyal de control periòdic anomenat rellotge (*clock*). El rellotge sincronitza el funcionament, fent que les variables internes canviïn només amb un pols o un flanc (ascendent o descendent) del senyal de rellotge. Són els més comuns i fàcils de dissenyar.

**Sistemes Seqüencials Asíncrons**: Actuen de manera contínua en el temps; un canvi en les entrades provoca canvis en les variables internes sense esperar un senyal de rellotge. Són més difícils de dissenyar a causa dels problemes de sincronització que poden patir.


### Funció

Segons la seva funció, els circuits seqüencials es poden classificar en:

**Comptadors**: Circuits que avancen per una seqüència predefinida d’estats segons els polsos del rellotge. S’utilitzen per comptar esdeveniments o generar patrons binaris.

**Registres**: Circuits que emmagatzemen i desplacen dades binàries. Serveixen per guardar valors temporals o transmetre informació entre diferents parts d’un sistema.

**Màquines d’estats**: Models que descriuen el comportament seqüencial d’un sistema, definint les transicions entre estats en funció de les entrades i el rellotge.

**Memòries**: Dispositius seqüencials dissenyats per emmagatzemar grans quantitats de dades binàries, essencials en ordinadors i sistemes digitals complexos.

### Memòria i estat
La capacitat de retenir un valor anterior s'aconsegueix mitjançant un element de memòria o estat.

**Estat**: És el conjunt d'informació que el circuit necessita per determinar el seu comportament futur. Representa la informació sobre la seqüència prèvia d'entrades.

**Realimentació** (*Feedback*): Els circuits seqüencials utilitzen llaços de realimentació, on les sortides es reintrodueixen com a entrades internes, cosa que permet preservar la informació anterior.

### El Biestable (Flip-Flop)
El component fonamental per construir la memòria en els circuits seqüencials síncrons és el biestable (o *flip-flop*). 

És un dispositiu amb dos estats estables (0 o 1) capaç d'emmagatzemar un bit d'informació. La sortida d’un biestable no depèn només de les entrades actuals, sinó també de l’estat anterior. Aquesta capacitat de recordar és la base de tots els dispositius de memòria i control dels sistemes digitals.

Hi ha diversos tipus, com el biestable **RS** (*Set-Reset*), **D** (*Data*) i **T** (*Toggle*), cadascun amb diferents regles per canviar d'estat.




<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/>