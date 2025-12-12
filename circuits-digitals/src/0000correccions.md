<!-- Posar aquesta imatge al començament de cada lliçó -->

<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>

# Màquines d'estats

Una màquina d’estats (*Finite State Machine*, FSM) és un model matemàtic que descriu un sistema amb un nombre finit d’estats que canvia d’un estat a un altre en funció de l’estat actual, les entrades i unes regles determinades. Un circuit seqüencial pot implementar una FSM perquè té **memòria** i la seva sortida no depèn només de les entrades actuals.

Un circuit digital que implementa una màquina d’estats presenta aquestes característiques:

* Té un conjunt finit d’estats possibles, emmagatzemats en biestables.
* Té un conjunt de senyals d’entrada.
* Les transicions entre estats s’implementen amb lògica combinacional i depenen de l’estat actual i de les entrades.
* El senyal de rellotge coordina l’actualització de l’estat.

Hi ha dos models principals: **màquina de Moore** i **màquina de Mealy**.

---

## Màquina de Moore

En una màquina de Moore **la sortida depèn únicament de l’estat actual**.

En el diagrama d’estats d’una màquina de Moore:

* Els estats s’indiquen amb cercles: E0, E1, E2…
* Les fletxes indiquen les transicions.
* Les entrades apareixen a les fletxes.
* La sortida s’indica dins del cercle (Estat/Sortida).

<img src='./diagramaMoore.png' alt="Diagrama d'estats, model de Moore" style="display:block; height:300px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Diagrama d'estats d'una màquina de Moore</i></center>

La taula següent resumeix els canvis d’estat del diagrama. La primera columna indica l’estat actual i la sortida. Si $Entrada = 0$ anem a la columna “Entrada=0”, i si $Entrada = 1$ anem a “Entrada=1”.

<table>
  <thead>
    <tr>
      <th rowspan="2">Estat actual/Sortida</th>
      <th colspan="2">Estat següent</th>
    </tr>
    <tr>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>E0 / 0</td><td>E1</td><td>E0</td></tr>
    <tr><td>E1 / 0</td><td>E1</td><td>E2</td></tr>
    <tr><td>E2 / 0</td><td>E1</td><td>E3</td></tr>
    <tr><td>E3 / 1</td><td>E1</td><td>E0</td></tr>
  </tbody>
</table>

---

## Màquina de Mealy

En una màquina de Mealy, **la sortida depèn de l’estat actual i de les entrades actuals**. Canvis a les entrades poden modificar la sortida immediatament, fins i tot entre transicions.

Avantatges:

* Sovint requereix menys estats que una màquina de Moore.
* Menys biestables i menys lògica combinacional.

En el diagrama d’estats:

* Els estats són cercles.
* Les fletxes indiquen transicions.
* Les etiquetes de fletxa mostren *entrada/sortida*.

<img src='./diagramaMealy.png' alt="Diagrama d'estats, model de Mealy" style="display:block; height:300px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Diagrama d'estats d'una màquina de Mealy</i></center>

La taula següent resumeix la informació del diagrama:

<table>
  <thead>
    <tr>
      <th rowspan="2">Estat actual</th>
      <th colspan="2">Sortida</th>
      <th colspan="2">Estat següent</th>
    </tr>
    <tr>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
      <th>Entrada=0</th>
      <th>Entrada=1</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>E0</td><td>0</td><td>0</td><td>E1</td><td>E0</td></tr>
    <tr><td>E1</td><td>0</td><td>0</td><td>E1</td><td>E2</td></tr>
    <tr><td>E2</td><td>0</td><td>1</td><td>E1</td><td>E0</td></tr>
  </tbody>
</table>

---

Les màquines d’estats són fonamentals per a:

* controladors de protocols digitals (SPI, I2C, UART),
* seqüenciadors d’operacions complexes (unitats de control),
* detectors de patrons o seqüències,
* semàfors digitals o sistemes de control.

---

# EXEMPLE: Retardador (*delay line*) de 2 cicles

Aquest circuit llegeix una seqüència binària i la replica amb un retard de dos cicles. Durant els dos primers cicles, la sortida val 0.

Seqüència d’entrada:

$S_{entrada}: 1,1,0,0,1,1,1,1,0,0,0,1,0,1,…$

Seqüència de sortida (retardada 2 cicles):

$S_{sortida}: 0,0,1,1,0,0,1,1,1,1,0,0,0,1,0,1,…$

Per causar el retard utilitzem **dos biestables D en sèrie**:

<img src='./exemple_0circuit.png' alt="Retardador de 2 cicles" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

A cada pols de rellotge:

* La sortida és el valor del segon biestable.
* $Q_0$ passa a $Q_1$.
* L’entrada $S_{entrada}$ passa a $Q_0$.

Aquesta estructura retarda qualsevol entrada dos cicles.

La màquina té $2^2 = 4$ estats: $E0$, $E1$, $E2$, $E3$, associats als valors de $(Q_1,Q_0)$:

| Estat | [$Q_1$, $Q_0$] | Descripció                  |
| ----- | -------------- | --------------------------- |
| E0    | 00             | Estat inicial               |
| E1    | 01             | Últim bit entrat = 1        |
| E2    | 10             | Últim bit = 0, anterior = 1 |
| E3    | 11             | Darrers dos bits = 1        |

La taula de transicions és:

<table>
  <thead>
    <tr><th rowspan="2">Estat actual</th><th colspan="2">Estat següent</th></tr>
    <tr><th>$S_{entrada}=0$</th><th>$S_{entrada}=1$</th></tr>
  </thead>
  <tbody>
    <tr><td>00 (E0)</td><td>00 (E0)</td><td>01 (E1)</td></tr>
    <tr><td>01 (E1)</td><td>10 (E2)</td><td>11 (E3)</td></tr>
    <tr><td>10 (E2)</td><td>00 (E0)</td><td>01 (E1)</td></tr>
    <tr><td>11 (E3)</td><td>10 (E2)</td><td>11 (E3)</td></tr>
  </tbody>
</table>

A aquest circuit li afegirem un senyal de reinici $rst$ (*reset*) que retorni tots els biestables a 0. Si $rst=1$, els dos biestables es reinicien i tornem a l’estat inicial E0. Si $rst=0$, el circuit continua funcionant amb normalitat.

El diagrama d’estats complet és:

<img src='./exemple_0diagrama.png' alt="Diagrama d'estats retardador de 2 cicles" style="display:block; height:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
<center><i>Diagrama d'estats del retardador de 2 cicles, amb senyal de reinici rst</i></center>

Com que la sortida $S_{sortida}$ depèn únicament de l’estat actual, aquest circuit és una **màquina de Moore**.

---

## Implementació a CircuitVerse

Muntem dos biestables D en sèrie, compartint rellotge i senyal de reinici.

<img src='./exemple_0biestables.png' alt="Implementació amb biestables" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

En els exercicis del Jutge, els senyals de reinici són **síncrons**, per tant connectarem *rst* a l’entrada *Preset* del biestable, no al *Asynchronous reset*.

<div style="display: flex; justify-content: center; align-items:center; gap: 16px;">
    <img src='./exemple_1elementCV1.png' style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
    <img src='./exemple_1elementCV2.png' style="display:block; height:180px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>
</div>

Per inicialitzar els valors, afegim dos multiplexors. El senyal *rst* és el selector:

* El primer multiplexor tria entre $S_{entrada}$ i 0.
* El segon tria entre $Q_0$ i 0.

<img src='./exemple_2multiplexors.png' alt="Multiplexors per al reinici" style="display:block; width:450px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

---

## Exemple de funcionament

Comprovem el circuit amb:

$S_{entrada} : 1, 1, 1, …$

Amb *rst = 1*, els biestables són a 0 (estat E0) i $S_{sortida}=0$.

<img src='./exemple_3estatinicial.png' alt="Estat inicial" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

Amb *rst=0*, deixem evolucionar el circuit.

### Primer flanc de rellotge

$S_{entrada}=1$ entra a $Q_0$.
$Q_0$ (que era 0) passa a $Q_1$.
$S_{sortida}$ continua sent 0 → estat E1.

<img src='./exemple_4primerflanc.png' alt="Primer flanc" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

### Segon flanc de rellotge

$S_{entrada}=1$ entra a $Q_0$.
$Q_0$ (ara 1) passa a $Q_1$.
$S_{sortida}=1$ → estat E2.

<img src='./exemple_5segonflanc.png' alt="Segon flanc" style="display:block; width:550px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;"/>

A partir d’aquí, els bits van avançant pels biestables com una **cua**. El senyal d’entrada triga dos cicles a sortir.

$S_{entrada}$ : 1, 1, 1, …

$S_{sortida}$ : 0, 0, 1, …


## Exercicis a Jutge.org: [Introduction to Digital Circuit Design](https://jutge.org/courses/JordiCortadella:IntroCircuits)
* [Last two equal](https://jutge.org/problems/X71700_en)
* [Delayed sequence](https://jutge.org/problems/X32741_en)
* [Even number of 0's and 1's](https://jutge.org/problems/X02999_en)
* [Circuit from state diagram](https://jutge.org/problems/X76378_en)
* [Sequence 110](https://jutge.org/problems/X02122_en)
* [Recognizing sequences](https://jutge.org/problems/X49909_en)
* [Is it divisible by 3?](https://jutge.org/problems/X80381_en)
* [Simple state machine](https://jutge.org/problems/X78930_en)
* [Traffic-light controller](https://jutge.org/problems/X88681_en)
* [Vending machine](https://jutge.org/problems/X77254_en)

<small>*Recorda que per accedir als exercicis i que el **Jutge** valori les teves solucions has d'estar inscrit al curs. Trobaràs totes les instruccions [aquí](../Inici/instruccions.md).* </small>

<br><br> <img src='../logos/TotsLogosBlanc.png' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>
