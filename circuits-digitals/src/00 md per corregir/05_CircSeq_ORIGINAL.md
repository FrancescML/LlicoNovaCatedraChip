<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
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

<img src='./flipflopRS.png' alt="El biestable RS" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Esquema funcional del biestable RS</i></center>

Aquest biestable és l’element bàsic de memòries, comptadors, registres i màquines d’estat i s’utilitza com a bloc fonamental per construir altres biestables més complexos (JK, D, T...).

### El biestable D (*Data*):
El biestable (*flip-flop*) D  té una única entrada $D$ (*Data*) i una entrada de rellotge (*Clock*). A cada pols del rellotge, el valor de $D$ es copia a la sortida. Les seves sortides són també l'estat actual $Q$ i el seu complementari $\bar{Q}$. És el més utilitzat per crear registres i memòries síncrones.

<img src='./flipflopD.png' alt="El biestable D" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Esquema funcional del biestable D</i></center>

### El biestable T (*Toggle*):
El biestable (*flip-flop*) T ($toggle$) canvia d'estat, commuta la seva sortida entre 0 i 1, cada cop que rep un pols de rellotge i la seva entrada $T$ està activada.

<img src='./flipflopT.png' alt="El biestable T" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Esquema funcional del biestable T</i></center>

### El biestable JK:
El biestable (*flip-flop*) JK es considera una versió millorada del biestable SR, que resol el problema de l’estat prohibit i pot funcionar en diversos modes segons el valor de les seves entrades. Per tant, és molt versàtil.

Té dues entrades de control ($J$ i $K$) i un senyal de rellotge ($CLK$). També té dues sortides complementàries $Q$ i $\bar{Q}$.

Quan el rellotge ($CLK$) activa el biestable:
+ Si $J=1$ i $K=0$, a la sortida $Q$ se li assigna 1.
+ Si $J=0$ i $K=1$, $Q$ es reinicialitza a 0.
+ Si $J=K=0$, no canvia, manté l’estat anterior.
+ Si $J=K=1$, commuta ($toggle$) l’estat de $Q$.

<img src='./flipflopJK.png' alt="El biestable JK" style="display:block; width:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Esquema funcional del biestable JK</i></center>


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>


<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Comptadors
Els circuits seqüencials comptadors són circuits digitals capaços de passar per una seqüència ordenada d’estats en resposta a una sèrie d’impulsos de rellotge. Cada estat representa un valor numèric binari, de manera que el circuit compta cap endavant o cap enrere, segons el disseny.

A diferència dels circuits combinacionals, l’estat actual del circuit depèn no només de les entrades, sinó també de l’estat anterior. Aquesta **memòria** s’implementa mitjançant biestables (normalment del tipus T o JK).

Les aplicacions més habituals dels comptadors són la mesura de temps, generació de seqüències, divisors de freqüència i formen part de rellotges digitals, cronòmetres i microprocessadors.

Els comptadors més comuns són els que segueixen una seqüència binària de valors binaris successius, s’anomenen comptadors binaris (binary counter).
Cada impuls de rellotge provoca un canvi d’estat del comptador. Els biestables s’activen de manera seqüencial, produint una successió binària (0000, 0001, 0010, 0011, etc.). En arribar al màxim valor, el comptador pot tornar a l’estat inicial (comptador cíclic o modular), o bé invertir el sentit i comptar cap enrere (comptador bidireccional).

## Comptador Binari (Binary Counter) MOD $2^n$

Un comptador binari MOD $2^n$ és un circuit seqüencial format per $n$ biestables que compta de $0$ a $2^n − 1$ en binari, i després torna a zero.
El terme MOD $2^n$ indica que el mòdul del comptador és $2^n$, és a dir, que **la seqüència té exactament  $2^n$ estats binaris únics abans de repetir-se**.

S’utilitza per comptar, generar seqüències binàries periòdiques i dividir freqüències.

### Comptador d’un sol bit MOD $2^1$
El següent comptador té un sol bit, utilitza un sol biestable. És, per tant, un comptador MOD $2^1$, i pot comptar de 0 a 1.


<img src='./comptadorMODdos1.png' alt="comptador MOD 2^1" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Aquest es compon d’un biestable D, un sumador complet (*full adder*) connectat a la sortida del biestable i un multiplexor. El sumador sumarà un valor constant $1$ a la sortida $Q$ del biestable.  Aquest senyal amb valor $Q+1$ es connectarà a l’entrada $D$ del biestable.

El multiplexor serveix per afegir la possibilitat de reiniciar el comptador. El senyal selector actua doncs com un senyal de reinici (*reset*). Quan aquest senyal s’activa, el multiplexor connecta un valor constant $0$ al biestable, tot reiniciant el comptador. 

Per entendre com funciona aquest comptador, comencem amb el biestable en un estat $Q=0$. La taula, més endavant, recull el resultat d’aquesta anàlisi.

**Estat inicial:**

El biestable es troba en un estat $Q=0$ que passarà al sumador, que hi sumarà el valor $1$.

Aquest senyal, amb valor $A+B=1$, s’aplica a l’entrada del biestable, l’entrada $D$ rep el senyal 1.

$D=1$ però encara no s’ha actualitzat l’estat del biestable amb un senyal de rellotge, en conseqüència, $Q$ no canvia encara de valor.

El comptador és a zero ($Count=0$)

**Primer pols:**

Quan s’aplica un pols de rellotge el valor de $D$ es copia a la sortida $Q$, que passa a tenir el valor $Q=1$.

El sumador hi suma el valor constant 1 i obtenim una sortida $A+B=0$.

El valor del bit de ròssec (carry) de sortida és $C_{sortida}=1$, però no el connectarem enlloc.

Ara l’entrada del biestable és $D=0$, però $Q$ no canvia encara de valor fins que no entri el següent pols de rellotge.

El comptador ha comptat fins a 1 ($Count=1$)

**Segon pols:**
El següent pols de rellotge actualitza còpia el valor $D=0$ a $Q$, i així hem tornat a la situació inicial, on $Count=0$.

|**Pols**|**$D$**|**$Q$**|**$Count$**
|------              |------ |------ |------   
|0  |1|0|0|
|1  |0|1|1|
|2  |1|0|0|
|3  |0|1|1|
|···|···|···|···|

Podem visualitzar el funcionament d’aquest comptador amb el cronograma següent:


<img src='./comptadorMODdos1cronograma.png' alt="comptador MOD 2^1" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Sigui quin sigui l’estat del comptador, en el moment que activem el senyal de reinici ($rst$), el multiplexor forçarà el comptador a retornar al seu estat inicial.

### Comptador de 3 bits MOD $2^3$

El següent comptador és de 3 bits, utilitza 3 biestables. És doncs un comptador MOD $2^3$, capaç de comptar de $0$ a $7$.

Aquest comptador es compon de 3 biestables D, 3 sumadors complets i, per tal d’afegir la possibilitat de reiniciar el comptador, 3 multiplexors.

Dels biestables n’obtindrem una sortida de 3 bits $Q=[Q_2​ Q_1​ Q_0​]$.
Les sortides $Q_i$ dels biestables es connecten als sumadors complets, que s’estructuren de manera equivalent al [sumador de n bits](../CircAritm/Aritmnbits#exemple-sumador-de--bits). Per aquesta raó el bit de ròssec (*carry*) de cada sumador $C_{sortida}$ es connecta al bit de ròssec d’entrada $C_{entrada}$ del següent.

Aquest conjunt de 3 sumadors complets, és a dir, aquest sumador de 3 bits, afegirà contínuament la constant $B=001$ a $Q$. Per això connectem $B_0=1$, $B_1=0$ i $B_2=0$.

El senyal de reinici (*reset*, o $rst$) crearà un reinici síncron del comptador, retornant-lo a zero.

<img src='./comptadorMODdos3.png' alt="comptador MOD $2^3$" style="display:block; width:700px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Comptador binari MOD 2^3</i></center>

Analitzem el funcionament d’aquest comptador, començant amb tots els biestables a zero. La taula, més endavant, recull el resultat d’aquesta anàlisi.

**Estat inicial:**

Els biestables estan en l’estat $Q_0=0$, $Q_1=0$ i $Q_2=0$.

El sumador 0 fa l'operació $0+1+0=1$, per tant, $D_0=1$.

El sumador 1 fa l'operació $0+0+0=0$, per tant, $D_1=0$.

El sumador 2 fa l'operació $0+0+0=0$, per tant, $D_2=0$.

No hi ha cap bit de ròssec ($C_{sortida}$) activat.

**Primer pols:**

El pols de rellotge fa que els bits de $Q$ s’actualitzin amb les entrades $D$, de manera que $Q_0=1$, $Q_1=0$ i $Q_2=0$.

Per tant, $D_0=1$, $D_1=1$ i $D_2=0$, i $C_{sortida 0}=1$

**Segon pols:**

El pols de rellotge fa que els bits de $Q$ s’actualitzin amb les entrades $D$, de manera que $Q_0=0$, $Q_1=1$ i $Q_2=0$

Per tant, $D_0=1$, $D_1=1$ i $D_2=0$, i no hi ha cap bit de ròssec activat.

**Tercer pols:**

El pols de rellotge fa que els bits de $Q$ s’actualitzin amb les entrades $D$, de manera que $Q_0=1$, $Q_1=1$ i $Q_2=0$.

Per tant, $D_0=0$, $D_1=0$ i $D_2=1$.

Dos bits de ròssec de sortida estan activats, $C_{sortida 0}=1$ i $C_{sortida1}=1$ 

Amb els següents polsos de rellotge, els biestables passen per totes les combinacions possibles, representant un nombre binari creixent fins a arribar al punt on tots els biestables són a l’estat 1. És a dir $Q=111$.

**Setè pols:**

Hem arribat al valor màxim del comptador, $Q_0=1$, $Q_1=1$ i $Q_2=1$.
El setè pols de rellotge durà el comptador altra vegada al seu estat inicial.


|**Pols**|**$D_2$**|**$D_1$**|**$D_0$**|**$C_{sortida2}$**|**$C_{sortida1}$**|**$C_{sortida0}$**|**$Q_2$**|**$Q_1$**|**$Q_0$**|**$Count$**
|------ |------ |------ |------ |------ |------ |------ |------ |------ |------ |------   
|0 |0|0|1|0|0|0|0|0|0|000|
|1 |0|1|0|0|0|1|0|0|1|001|
|2 |0|1|1|0|0|0|0|1|0|010|
|3 |1|0|0|0|1|1|0|1|1|011|
|4 |1|0|1|0|0|0|1|0|0|100|
|5 |1|1|0|0|0|1|1|0|1|101|
|6 |1|1|1|0|0|0|1|1|0|110|
|7 |0|0|0|1|1|1|1|1|1|111|
|8 |0|0|1|0|0|0|0|0|0|000|

Podem visualitzar el funcionament d’aquest comptador amb el cronograma següent:

<img src='./comptadorMODdos3cronograma.png' alt="comptador MOD $2^3$" style="display:block; width:700px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Sigui quin sigui l’estat del comptador, en el moment que activem el senyal de reinici (*rst*), el multiplexor forçarà el comptador a retornar al seu estat inicial.

### Comptador de n bits MOD $2^n$

Per implementar un comptador de n bits cal encadenar n biestables, n sumadors i n multiplexors de la mateixa manera. Amb aquest comptador es pot comptar de 0 fins a $2^n$ .

<img src='./comptadorMODdosn.png' alt="comptador MOD $2^n$" style="display:block; height:700px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Comptador binari MOD 2^n</i></center>

## Comptador Binari Asíncron (*Asynchronous Binary Counter* o *Ripple Counter*):
Un comptador binari asíncron (*Asynchronous Binary Counter*), o comptador en cascada (*Ripple Counter*), s’implementa amb una sèrie de biestables, normalment del tipus JK.
El primer biestable representa el bit menys significatiu *LSB*, que és controlat pel rellotge, i cadascun dels següents pel senyal de sortida de l’anterior, de manera que aquests biestables canvien d’estat **en cascada**.

<img src='./comptadorasincronn.png' alt="comptador asíncron n" style="display:block; width:700px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Comptador asíncron</i></center>

+ Els biestables JK estan connectats de manera que $J=K=1$ i, per tant, l’estat de $Q$ es commuta entre 0 i 1 quan entra un senyal de rellotge.
+ Els biestables capten un senyal de rellotge **només** en el moment que aquest bit passa de 0 a 1. No es considerarà que entra senyal de rellotge mentres aquest es mantingui a 1, a 0 o commuti de 1 a 0.
+ La sortida $Q_0$ correspon al bit menys significatiu *LSB* la sortida $Q_n$ correspon al bit més significatiu *MSB*.
+ El senyal de rellotge extern s’aplica solament a l’entrada del primer biestable.
+ La sortida $\bar{Q}$ de cada biestable es connecta a l’entrada de rellotge del següent biestable.

  + Això significa que quan un biestable commuti Q de 1 a 0, Q’ passarà de 0 a 1, estimulant l’entrada de rellotge del biestable següent. I això produirà una commutació de l’estat al biestable següent.

  + Dit breument: un biestable commutarà d’estat només en el moment que el biestable anterior passa de 1 a 0.

Per entendre com funciona aquest comptador, comencem amb tots els biestables a ‘0’. 

**Primer pols**:

El primer biestable $Q_0$ commuta de 0 a 1, $\bar{Q_0}$ passa de 1 a 0.

El segon biestable no detecta impuls a l’entrada de rellotge, no canvia d’estat i per tant $Q_1$ continua a 0.

El tercer biestable i tots els següents continuen a 0.

**Segon pols**:

El primer biestable $Q_0$ passa de 1 a 0, $\bar{Q_0}$ passa de 0 a 1.

El segon biestable detecta impuls a l’entrada de rellotge,  $Q_1$ passa de 0 a 1 i $\bar{Q_1}$ passa de 1 a 0.

El tercer biestable i tots els següents continuen a 0.

Amb els **següents polsos** de rellotge. Les commutacions es van propagant de manera que els biestables passen per totes les combinacions possibles, representant un nombre binari creixent fins a arribar al punt on tots els biestables són a l’estat 1.
En aquest punt, el següent pols de rellotge commuta el primer biestable de 1 a 0, el segon també, i així tots els biestables passen de 1 a 0 en cadena, tornant al punt de partida.

Aquesta taula mostra la seqüència dels diferents bits del comptador.

|**Pols**|**$Q_3$**|**$Q_2$**|**$Q_1$**|**$Q_0$**|**$Count$**
|------              |------   |------   |------   |------   |------
|0  |0|0|0|0|0000
|1  |0|0|0|1|1000
|2  |0|0|1|0|0100
|3  |0|0|1|1|1100
|4  |0|1|0|0|0010
|···|···|···|···|···|···
|14 |1|1|1|0|0111
|15 |1|1|1|1|1111
|16 |0|0|0|0|0000

La figura següent mostra el cronograma d’aquest comptador.


<img src='./comptadorasincronncronograma.png' alt="comptador asíncron n" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Aquest tipus de comptadors acumulen retards de tots els biestables a l’hora de passar d’un estat al següent, per tant, no és adequat per a freqüències de rellotge altes.

Els comptadors són també **divisors de freqüència**.
Cada bit s’activa a la meitat de la freqüència del bit anterior de manera natural. És doncs un dispositiu que divideix successivament per 2 la freqüència de rellotge.

## Comptador Binari Síncron (*Synchronous Binary Counter*):

Un comptador binari síncron és molt similar als comptadors asíncrons, però en aquest cas tots els biestables reben el mateix senyal de rellotge i canvien d'estat simultàniament.

Utilitza biestables de tipus JK i té la següent estructura:

<img src='./comptadorsincron4.png' alt="comptador síncron n" style="display:block; width:700px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Comptador síncron</i></center>

Al biestable 0 les entrades $J$ i $K$ estan connectades de manera que $J=K=1$ i, per tant, la seva sortida $Q_0$ commuta entre 0 i 1 sempre que entri un senyal de rellotge $CLK$.

La sortida del biestable 0 ($Q_0$) està connectada directament a les entrades J i K del biestable 1. D’aquesta manera, quan  $Q_0=1$, l’estat del biestable 1 ($Q_1$) commutarà entre 0 i 1 sempre que entri un senyal de rellotge.

Les entrades $J$ i $K$ del biestable 2, i els següents biestables a partir d’aquest, estan controlades amb una porta $AND$, que rep les sortides dels dos biestables anteriors. Si les sortides dels dos biestables anteriors són iguals a 1 simultàniament, la porta $AND$ s’activarà i les entrades del biestable rebran el senyal 1. En aquest cas, el biestable commutarà entre 0 i 1.

A partir del biestable 2, aquesta estructura es va repetint fins a completar el comptador.



Per entendre com funciona aquest comptador, comencem amb tots els biestables a ‘0’.  

**Estat inicial:**

Tots els biestables estan a zero, $count=0000$.

**Primer pols:**

El primer biestable $Q_0$ commuta a $Q_0=1$.
La resta de biestables no commuten perque les seves entrades són 0.
En aquest pols el comptador ha passat a ser $count=0001$.

**Segon pols:**

Com que $Q_0=1$ o $Q_1=0$ el biestable 2 no commutarà.
El biestable 1 commuta a 1 perque la seva entrada és 1.
El biestable 0 commutarà a 0.
En aquest pols el comptador ha passat a ser $count=0010$.

**Tercer pols:**

Com que $Q_0=0$ i $Q_1=1$ el biestable 2 no commutarà.
El biestable 1 no commuta perque la seva entrada és 0.
El biestable 0 commutarà a 1.
En aquest pols el comptador ha passat a ser $count=0011$.

**Quart pols:**

Per primera vegada, la porta AND s’activa al rebre $Q_0=1$ i $Q_1=1$, per tant el biestable 2 commuta a 1.
El biestable 1 commuta a 0 perque la seva entrada és 1.
El biestable 0 commutarà a 0.
En aquest pols el comptador ha passat a ser $count=0100$.

Amb els següents polsos de rellotge, els biestables passen per totes les combinacions possibles, representant un nombre binari creixent fins a arribar al punt on tots els biestables són a l’estat 1.

Tant la taula, com el cronograma amb la seqüència del comptador són idèntiques al comoptador anterior.

|**Pols**|**$Q_3$**|**$Q_2$**|**$Q_1$**|**$Q_0$**|**$Count$**
|------              |------   |------   |------   |------   |------
|0  |0|0|0|0|0000
|1  |0|0|0|1|1000
|2  |0|0|1|0|0100
|3  |0|0|1|1|1100
|4  |0|1|0|0|0010
|···|···|···|···|···|···
|14 |1|1|1|0|0111
|15 |1|1|1|1|1111
|16 |0|0|0|0|0000

<img src='./comptadorasincronncronograma.png' alt="comptador síncron 4bits" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>



## EXEMPLE: Comptador de 4 bits
En aquest exemple veurem com realitzar un comptador de 4 bits.

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./sequentialelements1.png' style="display:block;    height:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./sequentialelements2.png' style="display:block;    height:250px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

Les connexions del biestable que ens interessen són la **D** i **Q**, que marquen l'entrada i sortida de l'element de memòria, i també **CLK**, que és l’entrada del senyal de rellotge.
L'entrada de rellotge representa sovint amb un triangle a l'interior de l'element. 

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./D1.png' style="display:block;    width:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./D2.png' style="display:block;    height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./D3.png' style="display:block;    height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

El biestable D també compta amb altres entrades com *enables* i *resets* que permeten reiniciar o eliminar estats d’informació. També té una sortida negada $\bar{Q}$ per si cal operar amb valors de sortida inversos.

Volem un comptador que segueixi una seqüència binària de 4 bits, de valors successius entre el 0000 i el 1111. També volem incloure un senyal de reset que retorni la sortida a 0000. Aquest comportament es pot aconseguir amb un sumador, un multiplexor i un biestable de 4 bits com a la figura.

<img src='./comptador4bits1.png' alt="Seqüència comptador" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

El pols de rellotge farà que el sumador afegeixi una constant 0001 al valor de sortida del biestable. En aquest exemple passant d'un valor 0100 a 0101.

<img src='./comptador4bits2.png' alt="Seqüència comptador" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

El multiplexor forçarà el reinici. Al entrar un senyal **rst** l'estat del biestable passarà a ser 0000.

<img src='./comptador4bits3.png' alt="Seqüència comptador" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

[CircuitVerse](https://circuitverse.org/simulator) inclou una entrada *Asyncronous reset* als biestables. Per fer un reinici asíncron cal eliminar el multiplexor i connectar el senyal $rst$ a l'entrada *Asyncronous reset* del biestable.

<img src='./asyncronousreset.png' alt="Seqüència comptador" style="display:block; height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>



## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Toggle](https://jutge.org/problems/X15508_en)

[2-bit counter](https://jutge.org/problems/X81362_en)

[Mod-3 counter](https://jutge.org/problems/X05944_en)

[4-bit counter](https://jutge.org/problems/X35277_en)

[Unconventional cyclic counter](https://jutge.org/problems/X97508_en)

[Up-down counter](https://jutge.org/problems/X53256_en)

[Mod-7 up-down counter](https://jutge.org/problems/X47159_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>


<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Màquines d'estats
Una màquina d’estats (en anglès *Finite State Machine* o *FSM*) és un model matemàtic que descriu un sistema que té un nombre finit d’estats i que canvia d’un estat a un altre en funció de l'estat actual, unes entrades i d'unes regles determinades. Un circuit seqüencial, amb la seva capacitat per guardar memòria, i que la seva sortida no només depèn de les entrades actuals, pot implementar una màquina d’estats.

Un circuit digital que implementa una màquina d’estats té les següents característiques:

+ El circuit té un conjunt finit d’estats possibles, que s’emmagatzemen en biestables.
+ Té un conjunt de senyals d’entrada. 
+ Les transicions d’un estat a l’altre s’implementen amb lògica combinacional (portes lògiques). Aquestes depenen de l'estat actual i dels senyals d'entrada.
+ El senyal de rellotge coordina l’actualització de l’estat del circuit.

Existeixen dos models principals de màquina d’estats, el **model de Moore** i el **model de Mealy**.

## Màquina de Moore
En una màquina de Moore **la sortida depèn únicament de l'estat actual**.

El comportament de les màquines d'estats es pot visualitzar amb un **diagrama d’estats**, que representa els estats de la màquina, les seves entrades i les seves sortides.

El diagrama d’estats d'una màquina de Moore representa:

+ Estats identificats amb cercles i amb noms com E0, E1, E2, E3…
+ Fletxes que indiquen el pas d’un estat a un altre.
+ Les entrades del circuit s’indiquen damunt les fletxes de canvi d’estat.
+ Les sortides s’indiquen també dins el cercle sota el nom de l’estat (Estat/Sortida).

<img src='./diagramaMoore.png' alt="Diagrama d'estats, model de Moore" style="display:block; height:300px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Diagrama d'estats d'una màquina de Moore</i></center>


La taula següent ens ajudarà a navegar per aquest exemple de diagrama d’estats. La primera columna representa l’estat actual de la màquina i la seva sortida corresponent. Quan el senyal de rellotge provoca un canvi d’estat, l’estat següent dependrà de l’entrada. Si $Entrada=0$ la màquina canviarà a l’estat de la segona  columna, si $Entrada=1$ canviarem a l’estat de la tercera columna.

<table>
  <thead>
    <tr>
      <th rowspan="2">Estat actual/Sortida</th>
      <th colspan="2">Estat Següent</th>
    </tr>
    <tr>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>E0 / 0</td>
      <td>E1</td>
      <td>E0</td>
    </tr>
    <tr>
      <td>E1 / 0</td>
      <td>E1</td>
      <td>E2</td>
    </tr>
    <tr>
      <td>E2 / 0</td>
      <td>E1</td>
      <td>E3</td>
    </tr>
    <tr>
      <td>E3 / 1</td>
      <td>E1</td>
      <td>E0</td>
    </tr>
  </tbody>
</table>


## Màquina de Mealy:

La màquina de Mealy és el model on la sortida depèn tant de l'estat actual com de les entrades actuals. Quan la màquina és en cert estat, la sortida pot canviar si l'entrada canvia, sense esperar al següent canvi d’estat. Això pot generar impulsos transitoris entre canvis d’estat. Una màquina de Mealy generalment requereix menys estats que una màquina de Moore per fer la mateixa tasca. El circuit digital que l'implementa requereix doncs menys biestables i menys lògica combinacional.

El diagrama d’estats d'una màquina de Mealy és com el següent:

+ Estats identificats amb cercles i amb noms com E0, E1, E2, E3…
+ Els canvis d’estat s’indiquen amb fletxes.
+ Les entrades i les sortides es representen junts al costat de les fletxes (entrada/sortida).

<img src='./diagramaMealy.png' alt="Diagrama d'estats, model de Mealy" style="display:block; height:300px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Diagrama d'estats d'una màquina de Mealy</i></center>


La taula a continuació ens ajudarà a entendre el diagrama d’estats.
La primera columna representa l’estat actual de la màquina, la seva sortida també dependrà de l’entrada en aquell moment i es representa a les columnes segona i tercera. Només quan el senyal de rellotge ho indica, hi haurà un canvi, que ens durà a l’estat indicat a les columnes quarta i cinquena.


<table>
  <thead>
    <tr>
      <th rowspan="2">Estat actual</th>
      <th colspan="2">Sortida</th>
      <th colspan="2">Estat Següent</th>
    </tr>
    <tr>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>E0</td>
      <td>0</td>
      <td>0</td>
      <td>E1</td>
      <td>E0</td>
    </tr>
    <tr>
      <td>E1</td>
      <td>0</td>
      <td>0</td>
      <td>E1</td>
      <td>E2</td>
    </tr>
    <tr>
      <td>E2</td>
      <td>0</td>
      <td>1</td>
      <td>E1</td>
      <td>E0</td>
    </tr>

  </tbody>
</table>




Les màquines d'estats són fonamentals per dissenyar components lògics que necessiten seguir una seqüència o un protocol. S'utilitzen en:

+ Controladors de protocols de comunicació (SPI, I2C, UART).
+ Seqüenciadors de passos d'operacions complexes (com en una unitat de control de CPU).
+ Detectors de seqüències de bits o patrons.
+ Semàfors digitals o sistemes de control de trànsit.



## EXEMPLE: retardador (*delay line*) de 2 cicles.

En aquest exemple veurem un circuit capaç de llegir una seqüència binària concreta i replicar-la amb un retard de dos cicles, és a dir, dos senyals de rellotge. A l’inici de la seqüència, durant els dos cicles d’espera inicials, volem que la sortida sigui 0.

Prenem per exempla la següent seqüència inicial de nombres:

$S_{entrada}: 1,1,0,0,1,1,1,1,0,0,0,1,0,1 …$

Per tant, amb un retard de 2 cicles, la nostra seqüència de sortida serà la següent:

$S_{sortida}: 0,0,1,1,0,0,1,1,1,1,0,0,0,1,0,1 …$

Per causar un retard de dos cicles ens cal utilitzar dos biestables de tipus D connectats en sèrie com a la figura.

<img src='./exemple_0circuit.png' alt="Retardador de 2 cicles" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>


A cada pols de rellotge passarà el següent:
+ El valor que tenia el biestable 1 és llegit com a sortida $S_{sortida}$.
+ El valor que tenia el biestable 0 ($Q_0$) passa al biestable 1 ($Q_1$).
+ L’entrada $S_{entrada}$ es copia al Biestable 0.

D’aquesta manera, un senyal entrant per $S_{entrada}$ passarà per l'estructura i sortirà dos cicles més tard com a $S_{sortida}$.

Al fer servir dos biestables D la màquina té $2^2$ combinacions diferents, és a dir, 4 estats possibles que anomenarem $E0$,$E1$,$E2$ i $E3$:

|**Estat**|**[$Q_1$, $Q_0$]**| |
|------   |------            |------   |
|E0       |00    | Estat inicial (Buit)
|E1       |01    | L’últim bit que ha entrat a $Q_0$ és 1 el bit més antic $Q_1$ és 0
|E2       |10    | L’últim bit que ha entrat a $Q_0$ és 0 el bit més antic $Q_1$ és 1
|E3       |11    | Els dos darrers bits que han entrat són 1

La taula a continuació especifica els canvis d’estat possibles segons l’entrada $S_{entrada}$.


<table>
  <thead>
    <tr>
      <th rowspan="2">Estat actual</th>
      <th colspan="2">Estat Següent</th>
    </tr>
    <tr>
      <th>S<sub>entrada</sub>=0</th>
      <th>S<sub>entrada</sub>=1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>00 (E0)</td>
      <td>00 (E0)</td>
      <td>01 (E1)</td>
    </tr>
    <tr>
      <td>01 (E1)</td>
      <td>10 (E2)</td>
      <td>11 (E3)</td>
    </tr>
    <tr>
      <td>10 (E2)</td>
      <td>00 (E0)</td>
      <td>01 (E1)</td>
    </tr>
    <tr>
      <td>11 (E3)</td>
      <td>10 (E2)</td>
      <td>11 (E3)</td>
    </tr>
  </tbody>
</table>

A aquest circuit li afegirem més endavant un senyal de reinici $rst$ (*reset*) que retorni tot el circuit a zero. Si $rst=1$ els dos biestables seran reiniciats a 0, situant-nos a l’estat inicial $E0$. Si $rst=0$, el passatge de bits queda inalterat.

El diagrama d’estats queda així definit.

<img src='./exemple_0diagrama.png' alt="Diagrama estats retardador de 2 cicles" style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Diagrama d'estats del delay line de 2 cicles, incloent un senyal de reinici rst</i></center>

Veient que la sortida $S_{sortida}$ depèn únicament de l’estat on ens trobem, podem afirmar que aquest circuit **és una màquina de Moore**.

Una vegada fet el diagrama d’estats, passem a muntar el circuit a [CircuitVerse](https://circuitverse.org/simulator). Muntem els dos biestables D en sèrie compartint el mateix senyal de rellotge i el mateix senyal de reinici (*rst*).

<img src='./exemple_0biestables.png' alt="Circuit exemple" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

En els exercicis de jutge els senyals de reinici són sempre síncrons, per tant, així ho farem en aquest exemple, connectant els dos biestables al mateix *reset* síncron. 

Cal connectar doncs el senyal *rst* a l’entrada *Preset* del biestable D i no a l'entrada *Asynchronous reset* (reinici asíncron). 


<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./exemple_1elementCV1.png' style="display:block;    height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
    <img src='./exemple_1elementCV2.png' style="display:block;    height:180px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
</div>

Per tal d’inicialitzar els valors dels biestables a 0 cal afegir multiplexors on el senyal selector sigui el senyal de reinici *rst*:

El primer multiplexor tindrà com a entrades el senyal d’entrada $S_{entrada}$ i una constant 0. La seva sortida estarà connectada a l’entrada $D$ del primer biestable.

El segon multiplexor tindrà com a entrades la sortida $Q$ del primer biestable i la mateixa constant 0. La seva sortida estarà connectada a l’entrada $D$ del segon biestable.

<img src='./exemple_2multiplexors.png' alt="Circuit exemple" style="display:block; width:450px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

Comprovarem el seu funcionament amb una seqüència inicial d'exemple:

$S_{entrada}$: 1, 1, 1, ··· 

Després d'un reinici *rst=1*, tots els biestables es troben a $0$. Ens trobem doncs en l’estat inicial $E0$. El valor inicial de $S_{sortida}$ és $0$.

<img src='./exemple_3estatinicial.png' alt="Circuit exemple" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

A partir d'ara fixem $rst=0$ per permetre al circuit evolucionar.

En el **primer flanc de rellotge** el valor de $S_{entrada}=1$ es carrega al primer biestable. L’estat 0 del primer biestable passa al segon biestable i $S_{sortida}$ continua tenint un valor de 0. Hem passat doncs a l'estat $E1$.

<img src='./exemple_4primerflanc.png' alt="Circuit exemple" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

En el **segon flanc de rellotge**, el valor de $S_{entrada}=1$ es carrega al primer biestable, el valor del primer biestable 1 es carrega al segon biestable i per tant $S_{sortida}=1$. Ens trobem a l'estat $E2$.

<img src='./exemple_5segonflanc.png' alt="Circuit exemple" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>

En aquest punt del procés, el primer valor de $S_{entrada}$ s'ha traslladat des de l'entrada fins a la sortida passant pels dos biestables. Els dos valors següents estan carregats als biestables i els senyals de rellotge successius els aniràn traslladant cap a la sortida.
Aquest circuit implementa doncs una cua entre $S_{entrada}$ i $S_{sortida}$ que el senyal d'entrada triga dos cicles en travessar.

En aquests dos primers senyals de rellotge, les seqüències d'entrada i de sortida han implementat efectivament un retard de dos cicles:

$S_{entrada}$: 1, 1, 1, ··· 

$S_{sortida}$: 0, 0, 1, ··· 


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)


[Last two equal](https://jutge.org/problems/X71700_en)

[Delayed sequence](https://jutge.org/problems/X32741_en)

[Even number of 0's and 1's](https://jutge.org/problems/X02999_en)

[Circuit from state diagram](https://jutge.org/problems/X76378_en)

[Sequence 110](https://jutge.org/problems/X02122_en)

[Recognizing sequences](https://jutge.org/problems/X49909_en)

[Is it divisible by 3?](https://jutge.org/problems/X80381_en)

[Simple state machine](https://jutge.org/problems/X78930_en)

[Traffic-light controller](https://jutge.org/problems/X88681_en)

[Vending machine](https://jutge.org/problems/X77254_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>











<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/><!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius:8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius:8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Miscel·lània

La secció [Miscellaneous](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Sequential) del curs [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits/lists/JordiCortadella:Sequential) inclou diferents exercicis relacionats amb els temes tractats fins ara. Poden ser més complicats que els que hem vist fins ara. T'hi animes?. 

## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)

[Fibonacci](https://jutge.org/problems/X95484_en)

[Greatest Common Divisor](https://jutge.org/problems/X64579_en)

[FIFO](https://jutge.org/problems/X67970_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al [curs](https://jutge.org/courses/JordiCortadella:IntroCircuits)*. Troba totes les instruccions [aqui](../Inici/instruccions.md)</small>

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>



<Autors autors="xcasas fmadrid"/>