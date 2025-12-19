<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src="../logos/illustracio1.png" alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src="../logos/LogoCatedraCHIPBlanc.jpg" alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>



# Introducció als circuits aritmètics

Els circuits aritmètics són una subclasse fonamental dels **circuits digitals combinacionals**. La seva funció principal és efectuar operacions matemàtiques amb nombres binaris.

Les operacions bàsiques més habituals que implementen són:


**Semisumador (*Half Adder*)**: Circuit que suma dos bits i produeix una sortida de suma $S$ i un bit de ròssec (*carry*) $C$.

<img src="./blochalfadder.png" alt="Semisumador (Half Adder)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Semisumador (Half Adder)</i></center>

**Sumador complet (*Full Adder*)**: Suma tres bits (dos d’entrada i el ròssec de l’etapa anterior). És el bloc bàsic per construir sumadors de diversos bits mitjançant la connexió en cascada.

<img src="./blocfulladder.png" alt="Sumador complet (Full Adder)" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Sumador complet (Full Adder)</i></center>

**Sumador de n bits**: 
Amb semisumadors i sumadors complets es poden construir sumadors de $n$ bits. Aquest circuit realitza la suma binària de dos nombres $A$ i $B$.

<img src="./blocsumador4bits.png" alt="Sumador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Sumador de 4 bits</i></center>


**Restador**: 
La resta binària es resol habitualment emprant sumadors i la representació en **complement a dos**.
Així, la resta $A - B$ es transforma en la suma:

$$A + (-B)$$

<img src="./blocrestador4bits.png" alt="Restador de 4 bits" style="display:block; width:600px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Restador de 4 bits</i></center>

**Comparadors**:
Circuits que determinen si un nombre binari és **major**, **menor** o **igual** que un altre.

<img src="./bloccomparador.png" alt="Comparador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Comparador</i></center>

**Multiplicadors i divisors**:
Circuits més complexos que s’implementen mitjançant algorismes basats en sumes repetides i desplaçaments.

<img src="./blocmultiplicador.png" alt="Multiplicador" style="display:block; width:200px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Multiplicador</i></center>

Els circuits aritmètics constitueixen el nucli de les **Unitats Aritmètico-Lògiques (UAL)**, el cor de qualsevol microprocessador.
L’UAL és l’encarregada d’executar tant les operacions aritmètiques com les operacions lògiques necessàries per a l’execució dels programes.

L'Unitat Aritmètica Lògica (**UAL**) s'anomena *Aritmetic Logic Unit (**ALU**)* en anglès.

<img src="./ALU.png" alt="UAL" style="display:block; width:400px; margin:0 auto; border-radius:8px; background-color:white; padding:4px;" />
<center><i>Unitat Aritmètica Lògica (UAL)</i></center>

## Contingut de la lliçó

* Al tema [**Circuits bàsics**](./CircBasics.md) es presenten el semisumador, el sumador complet i els comparadors.
* Al tema [**Aritmètica de 4 bits**](./Aritm4bits.md) es treballen incrementadors, sumadors de 4 bits i un exemple de UAL.
* Al tema [**Aritmètica de n bits**](./Aritmnbits.md) es generalitzen incrementadors, sumadors i comparadors per a $n$ bits.
* Finalment, al tema de [**Miscel·lània**](./miscellania.md) es recullen exercicis més avançats com multiplicadors, acumuladors de bits i circuits seqüencials *adders*.


<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br><br><img src="../logos/TotsLogosBlanc.png" alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius:8px;"/>
<Autors autors="xcasas fmadrid"/>
