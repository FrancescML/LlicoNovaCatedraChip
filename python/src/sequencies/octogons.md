# Aplicació: Octògons facilets

<img src='./octogons.png' style='height: 8em; float: right; margin: 2em 0 1em 1em;'/>

Aquesta lliçó mostra una possible solució pel problema
[P87198](https://jutge.org/problems/P87198) (Octògons facilets) del Jutge. La
solució fa ús d'accions i utilitza disseny descendent, una metodologia de
programació que descompon un problema complex en subproblemes menys complexos
que l'original.

## Exercici P87198 (Octògons facilets)

L'enunciat és senzill: Cal fer un programa que per a cada `n` donada escrigui
"un octàgon de mida `n`", segons el patró que es pot veure en els exemples.
Per exemple, quan `n` val 2,
cal escriure

```text
 XX
XXXX
XXXX
 XX
```

i quan `n` val 3,
cal escriure

```text
  XXX
 XXXXX
XXXXXXX
XXXXXXX
XXXXXXX
 XXXXX
  XXX
```

Com ho podem resoldre?

Primer de tot, podem escriure directament i
sense dubtar el programa principal d'aquesta forma:

```python
from yogi import tokens

def main() -> None:
    for n in tokens(int):
        escriure_octogon(n)
        print()

if __name__ == '__main__':
    main()
```

Que fàcil, oi? Senzillament hem escrit el codi habitual per llegir una seqüència
d'enters i, per a cadascun d'ells, hem relegat la feina d'escriure l'octògon
correponent a una acció `escriure_octogon` que deixem per més tard. També
afegim un salt de línia darrera de cada octògon, tal com prescriu l'enunciat.

D'aquesta forma ens queda un `main` petit i senzill, sense cap complexitat que
ens pugui induïr a cometre cap error. A més, hem encapsulat la idea d'escriure
un octògon en una acció, una idea molt recomanable, ja que ens aporta senzilles, estructuració i permetrà reciclar
directament el codi per pintar aquesta figura si mai ens cal en el futur.

Ara, ja només ens hem de preocupar d'escriure un sol octògon, i ho hem de fer dins
de l'acció `escriure_octogon`, que reb un enter amb la seva mida. La seva capçalera
és doncs:

```python
def escriure_octogon(n: int) -> None:
    """Acció que escriu un octògon de mida n."""
```

Per definir el cos d'aquesta acció, del patró dels exemples, podem veure que
un octògon es descompon en tres parts: la part superior, la part del mig i la
part inferior:

```text
  XXX      part superior
 XXXXX     part superior
XXXXXXX    part superior
XXXXXXX    part del mig
XXXXXXX    part inferior
 XXXXX     part inferior
  XXX      part inferior
```

Així, escollim definir `escriure_octogon` utilitzant aquestes tres parts:

```python
def escriure_octogon(n: int) -> None:
    """Acció que escriu un octògon de mida n."""
    escriure_part_superior(n)
    escriure_part_del_mig(n)
    escriure_part_inferior(n)
```

De nou, releguem la tasca d'escriure un octògon a tres altres accions que definim
a continuació:

```python
def escriure_part_superior(n: int) -> None:
    for i in range(n):
        escriure_linia(n - i - 1, n + 2 * i)

def escriure_part_inferior(n: int) -> None:
    for i in range(n - 1, 0, -1):
        escriure_linia(n + 2 * i, n - i - 1)

def escriure_part_del_mig(n: int) -> None:
    for i in range(n - 2):
        escriure_linia(0, 3 * n - 2)
```

Aquí, un altre cop hem introduït una nova acció `escriure_linia` que
utilitzen les tres accions. El propòsit d'`escriure_linia(n, m)` és escriure
una línia amb `n` espais en blanc seguits de `m` ics. L'elecció dels valors precisos dels
inicis i finals dels bucles us els deixem pensar perquè els treballeu vosaltres.

Per fi, el codi d'`escriure_linia` és aquest:

```python
def escriure_linia(n: int, m: int) -> None:
    """Acció que escriu n espais, m ics i un salt de línia."""
    print(' ' * n, 'X' * m, sep='')
```

Fixeu-vos que per resoldre aquest problema hem utilitzat la metodologia
del disseny descendent, de manera que hem anat descomponent la complexitat
del problema del nivell més general al més concret. El següent diagrama
mostra la relació de les accions les unes amb les altres:

<noscript type="text/coffeenoscript" src="./octogons.coffee"></noscript>

<div id="div-octogons" style="height: 300px; ">
</div>

<Autors autors="jpetit roura"/>
