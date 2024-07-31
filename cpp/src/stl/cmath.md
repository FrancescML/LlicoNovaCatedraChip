# Funcions matemàtiques: `cmath`

## Introducció

<img src='./cmath.png' style='height: 10em; float: right; margin: 0 0 1em 1em;'/>

Sovint és necessari usar funcions matemàtiques com arrels quadrades,
exponenciacions, logaritmes o funcions trigonomètriques. Típicament, aquestes
funcions tenen com a entrada un (o dos) nombres reals i retornen un real. La
llibreria estàndard `<cmath>` proporciona accés a aquest tipus de funcions.

## Les funcions de `cmath`

Per utilitzar les funcions matemàtiques cal
fer un `#include <cmath>` i un `using namespace std;`.
A continuació enumerem algunes de les funcions més
habituals de `<cmath>` segons diferents famílies.

Càlculs sobre potències:

```c++
double pow(double x, double y); // Retorna x^y
double sqrt(double x);          // Retorna l'arrel quadrada de x
double cbrt(double x);          // Retorna l'arrel cúbica de x
```

Càlculs d'exponencials i logaritmes:

```c++
double exp(double x);           // Retorna e^x
double exp2(double x);          // Retorna 2^x
double log(double x);           // Retorna el logaritme de x en base e  (logaritme natural)
double log2(double x);          // Retorna el logaritme de x en base 2
double log10(double x);         // Retorna el logaritme de x en base 10
```

Càlculs trigonomètrics
(tots els angles es dónen en radians):

```c++
double sin(double a);                   // Retorna el sinus d'un angle a
double cos(double a);                   // Retorna el cosinus d'un angle a
double tan(double a);                   // Retorna la tangent d'un angle a
double asin(double x);                  // Retorna l'arcsinus de x
double acos(double x);                  // Retorna l'arccosinus de x
double atan(double x);                  // Retorna l'arctangent de x
double atan2(double x, double y);       // Retorna l'arctangent de y/x usant els signes dels arguments per determinar el quadrant correcte
```

Arrodoniments de diferents tipus:

```c++
double ceil(double x);          // Arrodoneix per dalt
double floor(double x);         // Arrodoneix per baix
double trunc(double x);         // Arrodoneix no sé com !!!
double round(double x);         // Arrodoneix normalment
```

A més, la constant `M_PI` defineix el valor de π (3,1415926...)
amb la màxima precisió possible:

```c++
const double M_PI;              // El valor de π
```

Evidentment, totes aquestes funcions tenen les precondicions
obvies sobre els seus paràmetres! ((!!! Cal parlar dels infinits i els NaN ???))

Totes aquestes funcions són eficients, en el sentit que la unitat de càlcul
del processador les du a terme. Ara bé, moltes d'aquestes funcions són
sensiblements més lentes que les operacions aritmétiques.

L'especificació completa es pot trobar a
[cppreference](http://en.cppreference.com/w/cpp/header/cmath). Allà veureu que
existeixen moltes altres funcions, i moltes variacions de les esmentades
anteriorment segons els tipus dels seus paràmetres. Com sempre, en general,
aconsellem que useu `double`s per als tipus reals.

## Exemple: Calcular la distància entre dos punts

Considerem que volem calcular la distància entre dos punts en el plà $p$ i
$q$. Es té que les coordenades de $p$ són $x_p$ i $y_p$ i que les coordenades
de $q$ són $x_q$ i $y_q$. Llavors, la seva distància
és

$$
    \sqrt{(x_p-x_q)^2 + (y_p-y_q)^2}.
$$

Podem escriure un programa que automatitzi aquesta tasca tot utilitzant les
funcions `sqrt()` i `pow()` de `<cmath>`. La primera calcula arrels quadrades, la
segona calcula exponents.

```c++
#include <iostream>
#include <cmath>
using namespace std;

int main() {
    double xp, yp, xq, yq;
    cin >> xp >> yp >> xq >> yq;
    cout << sqrt(pow(xp - xq, 2) + pow(yp - yq, 2)) << endl;
}
```

<Autors autors="jpetit roura"/>
