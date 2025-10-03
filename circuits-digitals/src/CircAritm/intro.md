<!-- Posar aquesta imatge al començament de cada lliçó -->
<img src='../logos/illustracio1.png' alt="Circuits digitals" style=" float: left; border-radius: 8px; height: 120px; text-align: right;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px; text-align: right;"/>
<div style="clear: both;"></div>
<br>

# Introducció als circuits aritmètics

Els circuits aritmètics són una subclasse fonamental dels circuits digitals combinacionals. La seva funció principal és efectuar operacions matemàtiques bàsiques amb nombres binaris.


Les operacions més habituals que implementen són:

**Semisumador (*Half Adder*)**: Circuit que suma dos bits i produeix una sortida de suma $S$ i un ròssec (*carry*) $C$.

<img src='../logos/enconstrucció.png' alt="---" style="display:block; width:100px; margin:0 auto; border-radius: 8px;"/>
<center><i>---</i></center>

<img src='../logos/enconstrucció.png' alt="---" style="display:block; width:100px; margin:0 auto; border-radius: 8px;"/>
<center><i>---</i></center>

**Sumador complet (*Full Adder*)**: Suma tres bits (dos d’entrada i el ròssec de l’etapa anterior). És el bloc bàsic per construir sumadors de diversos bits mitjançant la connexió en cascada.

<img src='../logos/enconstrucció.png' alt="---" style="display:block; width:100px; margin:0 auto; border-radius: 8px;"/>
<center><i>---</i></center>

**Restador**: La resta binària es resol habitualment emprant sumadors i la representació de nombres en complement a dos, de manera que la resta $A − B$ es transforma en una suma $A + (−B)$.

<img src='../logos/enconstrucció.png' alt="---" style="display:block; width:100px; margin:0 auto; border-radius: 8px;"/>
<center><i>---</i></center>

**Comparadors**: Circuits capaços de determinar si un nombre binari és major, menor o igual que un altre.

<img src='../logos/enconstrucció.png' alt="---" style="display:block; width:100px; margin:0 auto; border-radius: 8px;"/>
<center><i>---</i></center>

**Multiplicadors i divisors**: Circuits més complexos que s’implementen mitjançant algorismes basats en sumes repetides i desplaçaments.

Els circuits aritmètics constitueixen també el nucli de les Unitats Aritmètico-Lògiques (UAL), que són el cor de qualsevol microprocessador. L’UAL és l’encarregada d’executar tant les operacions aritmètiques com les operacions lògiques necessàries per a l’execució dels programes.

L'Unitat Aritmètica Lògica (**UAL**) s'anomena *Aritmetic Logic Unit (**ALU**)* en anglès.

En aquesta lliçó trobaràs els següents temes:

En el tema de [**Circuits bàsics**](./CircBasics.md) veurem els circuits de half adder, full adder i els comparadors
En el tema [**Aritmètica de 4 bits**](./Aritm4bits.md) veurem els circuits incrementadors i sumadors de 4 bits. Veurem també un exercici de UAL.
En el tema [**Aritmètica de n bits**](./Aritmnbits.md) veurem circuits incrementadors, sumadors i comparadors per a un nombre de n bits.
Finalment, en el tema de [**Miscel·lània**](./miscellania.md) es recull una sèrie d'exercicis de circuits aritmètics més avançats com els multiplicadors, els acumuladors de bits i els circuits seqüencial adders.



<!-- Aquesta imatge ha d'anar al final de cada lliçó, ja sigui amb aquesta línia o dins la signatura. Deixar comentat si ja està a la signatura-->
<br>
<br>
<img src='../logos/TotsLogosBlanc.png ' alt="Logos Càtedra Chip" width="100%" style="display:block; margin:0 auto; border-radius: 8px;"/>


<Autors autors="xcasas fmadrid jordic"/>