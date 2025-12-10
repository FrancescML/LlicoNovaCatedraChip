<img src='../logos/illustracio1.png' alt="Circuits digitals" style="float: left; border-radius: 8px; height: 120px;"/>
<img src='../logos/LogoCatedraCHIPBlanc.jpg' alt="Logo Càtedra Chip" style="float: right; border-radius: 8px; height: 120px;"/>
<div style="clear: both;"></div>
<br>

# BCD digits

En circuits digitals, un nombre Decimal Codificat a Binari (en anglès *Binary Coded Decimal*, o *BCD*) és una forma de representar nombres decimals utilitzant un codi binari. La idea és codificar cada dígit decimal individualment amb un nombre binari, generalment de 4 bits.


|**Dígit decimal**|**BCD**
|------ |------
|0 | 0000
|1 | 0001
|2 | 0010
|3 | 0011
|4 | 0100
|5 | 0101
|6 | 0110
|7 | 0111
|8 | 1000
|9 | 1001

## EXEMPLE: Disseny d'un Circuit Controlador de Display de 7 segments

Aquest circuit rebrà un dígit BCD de 4 bits que representa un dígit del 0 al 9.

$D[3:0]=[D_3 \; D_2 \; D_1 \; D_0]$

Produirà set senyals de sortida que controlaran els segments d'un display de 7 segments. Cadascun dels set senyals de sortida s'ha d'activar quan el segment corresponent hagi d'estar il·luminat. Estem utilitzant, doncs, un display de 7 segments de càtode comú.

<img src='./Seven_segment_01_Pengo.jpg' alt="Display de 7 segments" style="display:block; height:200px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Display de 7 segments</i></center>
<center>
<a href="https://creativecommons.org/licenses/by-sa/3.0" title="Creative Commons Attribution-Share Alike 3.0">CC BY-SA 3.0</a>, <a href="https://commons.wikimedia.org/w/index.php?curid=2550282">Link</a>
</center>

La figura següent representa la disposició estàndard dels set segments, que farem servir de referència per dissenyar el nostre circuit.

<img src='./segments.png' alt="Disposició dels 7 segments" style="display:block; height:350px; margin:0 auto; border-radius:8px; background-color: rgba(255, 255, 255, 1); padding:4px;"/>
<center><i>Disposició dels 7 segments</i></center>
...