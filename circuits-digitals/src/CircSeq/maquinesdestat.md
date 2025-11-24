<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Màquines d'estat
Una màquina d’estats (en anglès *Finite State Machine* o *FSM*) és un model matemàtic que descriu un sistema que té un nombre finit d’estats i que canvia d’un estat a un altre en funció de les entrades del circuit o dels seus estats. Un circuit seqüencial, amb la seva capacitat per guardar memòria, i que la seva sortida no depèn només de les entrades actuals, pot implementar un model de màquina d’estats.

Una màquina d’estats té les següents característiques:

+ El circuit té un conjunt finit d’estats possibles, que s’emmagatzemen en biestables.
+ Té un conjunt de senyals d’entrada. 
+ Segons les entrades i l’estat actual el circuit passa a un nou estat i genera una sortida.
+ Les transicions d’un estat a l’altre s’implementen amb lògica combinacional (portes lògiques)
+ El rellotge coordina l’actualització de l’estat del circuit.

Existeixen dos models principals de màquina d’estats, el **model de Moore** i el **model de Mealy**.

### Model de Moore:
Al model de Moore la sortida depèn únicament de l'estat actual. El comportament de les màquines d’estat es pot visualitzar amb un diagrama d’estats, que representa els estats de la màquina, les seves entrades i les seves sortides.

El diagrama d’estats de Moore representa:

+ Estats identificats amb cercles i amb noms com E0, E1, E2, E3…
+ Fletxes que indiquen el pas d’un estat a un altre.
+ Les entrades del circuit s’indiquen damunt les fletxes de canvi d’estat.
+ Les sortides s’indiquen dins el cercle de l’estat sota el nom de l’estat (Estat/Sortida).

<img src='./++++.png' alt="Diagrama d'estats, model de Moore" style="display:block; height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

### Model de Mealy:

La màquina de Mealy és el model on la sortida depèn tant de l'estat actual com de les entrades actuals. Quan la màquina és en cert estat, la sortida pot canviar si l'entrada canvia, sense esperar al següent canvi d’estat. Això pot generar impulsos transitoris entre canvis d’estat. Una màquina de Mealy generalment requereix menys estats que una màquina de Moore fent la mateixa tasca. Requereix doncs menys biestables i menys lògica combinacional.

El seu diagrama d’estats és com el següent:

+ Estats identificats amb cercles i amb noms com E0, E1, E2, E3…
+ Els canvis d’estat s’indiquen amb fletxes.
+ Les entrades i les sortides es representen junts al costat de les fletxes (entrada/sortida).

<img src='./++++.png' alt="Diagrama d'estats, model de Mealy" style="display:block; height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Les màquines d'estats són fonamentals per dissenyar components lògics que necessiten seguir una seqüència o un protocol. S'utilitzen en:

+ Controladors de protocols de comunicació (SPI, I2C, UART).
+ Seqüenciadors de passos d'operacions complexes (com en una unitat de control de CPU).
+ Detectors de seqüències de bits o patrons.
+ Semàfors digitals o sistemes de control de trànsit.



## Exemple: Seqüència de bits amb retards










<img src='../logos/enconstrucció.png' alt="HI estem treballant"  style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>En contrucció</i></center>






<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>