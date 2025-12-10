<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits digitals

En aquestes lliçons aprendràs què són els circuits digitals i els seus diferents tipus. Hi trobaràs exemples i exercicis per entendre els circuits combinacionals, els circuits seqüencials i els circuits aritmètics.

Els **circuits digitals** processen informació representada en format binari, que utilitza només dos estats elèctrics: voltatge baix i voltatge alt, els quals representen els valors binaris 0 i 1. Els components fonamentals dels circuits digitals són les portes lògiques. Aquestes són la base dels microprocessadors, memòries, controladors i de qualsevol altre circuit digital complex.

Les **portes lògiques** són petits circuits que efectuen operacions lògiques bàsiques sobre un o més senyals binaris d'entrada i produeixen un únic senyal binari de sortida. Per utilitzar les portes lògiques i crear circuits digitals, cal conèixer els conceptes d'àlgebra de Boole i les taules de veritat. En molts exemples i exercicis de circuits digitals utilitzarem les taules de veritat o una expressió booleana per descriure el comportament lògic d’un circuit.

|**Porta lògica**|**Símbol** |**Expressió Lògica** |**Descripció**|
|------          |------     |:---:                |------        |
|Buffer |<img src="./Buffer_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>   |$A$                        |Retorna el mateix bit|
|NOT    |<img src="./NOT_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$\bar{A}$                  |Inverteix el bit|
|AND    |<img src="./AND_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$A·B$                      |1 si les dues entrades són 1|
|OR     |<img src="./OR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>       |$A+B$                      |1 si almenys una entrada és 1|
|NAND   |<img src="./NAND_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>     |$\overline{A·B}$           |AND invertit (combinació d'AND i NOT)|
|NOR    |<img src="./NOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$\overline{A+B}$           |OR invertit (combinació d'OR i NOT)|
|XOR    |<img src="./XOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>      |$A·\bar{B}+\bar{A}·B$      |1 si les entrades són diferents|
|XNOR   |<img src="./XNOR_ANSI_Labelled.png" style="background-color: rgba(255, 255, 255, 1); height:80px;"/>     |$(A·B)+(\bar{A}·\bar{B})$  |1 si les entrades són iguals|


<br>

Les portes lògiques bàsiques són AND, OR i NOT. Una **taula de veritat** mostra totes les possibles combinacions d’entrades d’un circuit lògic o d’una funció booleana, i el resultat corresponent a la sortida per a cadascuna d’aquestes combinacions.

Un [**circuit combinacional**](../CircCombin/intro.md) és un tipus de circuit digital en què el valor de la seva sortida en un instant depèn únicament dels valors actuals de les seves entrades. Construïts únicament amb portes lògiques simples, no tenen retroalimentació ni memòria. El seu comportament es pot descriure amb taules de veritat i funcions booleanes.

<img src='./combinacional.png' alt="Circuit combinacional" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit combinacional</i></center>

Els [**circuits aritmètics**](../CircAritm/intro.md) són una subclasse important dels circuits digitals combinacionals. La seva funció és efectuar operacions matemàtiques bàsiques amb nombres binaris.

<img src='./aritmetic.png' alt="Circuit aritmètic" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Aquest exemple és un circuit aritmètic sumador</i></center>

Els [**circuits seqüencials**](../CircSeq/intro.md) són un tipus de circuit digital que, a diferència dels circuits combinacionals o aritmètics, incorporen retroalimentació i tenen memòria. En conseqüència, la seva sortida no només depèn de les entrades actuals, sinó també del seu estat previ o historial d’entrades. Molts d’ells utilitzen un rellotge per coordinar els canvis d'estat.

<img src='./sequencial.png' alt="Circuit seqüencial" style="display:block; width:500px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Circuit seqüencial</i></center>

La lliçó [**Tiny Micro**](../TinyMicro/intro.md) és un recull d’exercicis avançats sobre el funcionament d’un petit ordinador.

<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>

<Autors autors="xcasas fmadrid"/>