<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits seqüencials

Els circuits seqüencials són un tipus de circuits digitals en què el valor de la sortida no depèn únicament de les entrades actuals, sinó també de l’estat anterior del circuit. Això vol dir que tenen memòria.

A diferència dels circuits combinacionals, que només calculen resultats instantanis a partir d’una entrada, els circuits seqüencials guarden informació sobre el passat mitjançant elements de memòria.

Els circuits seqüencials són fonamentals en la construcció de memòries, comptadors, registres, unitats de control i processadors. 

## Sincronització i rellotge
Molts circuits seqüencials funcionen sincronitzats amb un senyal de rellotge (*clock*) que marca el ritme amb què es produeixen els canvis d’estat.
Els circuits seqüencials es poden classificar segons com gestionen el temps.

**Sistemes Seqüencials Síncrons**: Els canvis en l'estat (i les sortides) només es produeixen en instants de temps ben definits, marcats per un senyal de control periòdic anomenat rellotge (*clock*). El rellotge sincronitza el funcionament, fent que les variables internes canviïn només amb un pols o un flanc (ascendent o descendent) del senyal de rellotge. Són els més comuns i fàcils de dissenyar.

**Sistemes Seqüencials Asíncrons**: Actuen de manera contínua en el temps; un canvi en les entrades provoca canvis en les variables internes sense esperar un senyal de rellotge. Són més difícils de dissenyar a causa dels problemes de sincronització que poden patir.


## Funció

Segons la seva funció, els circuits seqüencials es poden classificar en:

**Comptadors**: Circuits que avancen per una seqüència predefinida d’estats segons els polsos del rellotge. S’utilitzen per comptar esdeveniments o generar patrons binaris.

**Registres**: Circuits que emmagatzemen i desplacen dades binàries. Serveixen per guardar valors temporals o transmetre informació entre diferents parts d’un sistema.

**Màquines d’estat**: Models que descriuen el comportament seqüencial d’un sistema, definint les transicions entre estats en funció de les entrades i el rellotge.

**Memòries**: Dispositius seqüencials dissenyats per emmagatzemar grans quantitats de dades binàries, essencials en ordinadors i sistemes digitals complexos.

### Memòria i estat
La capacitat de retenir un valor anterior s'aconsegueix mitjançant un element de memòria o estat.

**Estat**: És el conjunt d'informació que el circuit necessita per determinar el seu comportament futur. Representa la informació sobre la seqüència prèvia d'entrades.

**Realimentació** (*Feedback*): Els circuits seqüencials utilitzen llaços de realimentació, on les sortides es reintrodueixen com a entrades internes, cosa que permet preservar la informació anterior.

## El Biestable (*Flip-Flop*)

El component fonamental per construir la memòria en els circuits seqüencials és el biestable (o *flip-flop* en anglès).
La seva funció principal és emmagatzemar un bit d’informació. Pot estar en un dels dos estats estables possibles, 0 o 1, d’aquí el nom biestable.

A diferència d’una porta lògica, la sortida d’un biestable no depèn només de les entrades actuals, sinó també de l’estat anterior. Aquesta capacitat de recordar és la base de tots els dispositius de memòria i control dels sistemes digitals.

Hi ha diversos tipus de biestables.

### El biestable RS (*Reset-Set*) :
El biestable (*flip-flop*) RS (*Reset-Set*) o també anomenat SR (*Set-Reset*) és el tipus més senzill de biestable. Les dues entrades són $S$ (*Set*), que assigna un $1$ a la sortida, i $R$ (*Reset*), que reincialitza la sortida a $0$. Té, a més, una entrada de rellotge, que és habitual en els biestables.
La sortida principal és $Q$ (l'estat actual) i també proporciona el valor complementari $\bar{Q}$.

No s’ha d’activar $S$ i $R$ alhora (és una condició prohibida).

<img src='./flipflopRS.png' alt="El biestable RS" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Esquema funcional del biestable RS</i></center>

Aquest biestable és l’element bàsic de memòries, comptadors, registres i màquines d’estat i s’utilitza com a bloc fonamental per construir altres biestables més complexos (JK, D, T...).

### El biestable D (*Data*):
El biestable (*flip-flop*) D  té una única entrada $D$ (*Data*) i una entrada de rellotge (*Clock*). A cada pols del rellotge, el valor de $D$ es copia a la sortida. Les seves sortides són també l'estat actual $Q$ i el seu complementari $\bar{Q}$. És el més utilitzat per crear registres i memòries síncrones.

<img src='./flipflopD.png' alt="El biestable D" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Esquema funcional del biestable D</i></center>

### El biestable T (*Toggle*):
El biestable (*flip-flop*) T ($toggle$) canvia d'estat, commuta la seva sortida entre 0 i 1, cada cop que rep un pols de rellotge i la seva entrada $T$ està activada.

<img src='./flipflopT.png' alt="El biestable T" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Esquema funcional del biestable T</i></center>

### El biestable JK:
El biestable (*flip-flop*) JK es considera una versió millorada del biestable SR, que resol el problema de l’estat prohibit i pot funcionar en diversos modes segons el valor de les seves entrades. Per tant, és molt versàtil.

Té dues entrades de control ($J$ i $K$) i un senyal de rellotge ($CLK$). També té dues sortides complementàries $Q$ i $\bar{Q}$.

Quan el rellotge ($CLK$) activa el biestable:
+ Si $J=1$ i $K=0$, a la sortida $Q$ se li assigna 1.
+ Si $J=0$ i $K=1$, $Q$ es reinicialitza a 0.
+ Si $J=K=0$, no canvia, manté l’estat anterior.
+ Si $J=K=1$, commuta ($toggle$) l’estat de $Q$.

<img src='./flipflopJK.png' alt="El biestable JK" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Esquema funcional del biestable JK</i></center>


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>


<Autors autors="xcasas fmadrid"/>