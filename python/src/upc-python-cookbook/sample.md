# Setting up

⚡ Recordeu que els mètodes `top()` i `pop()` tenen com a precondició que la pila no sigui buida.

## Pràctica

Escriviu un nou programa que llegeixi tres enters i n'escrigui la suma.
Editeu, compileu i executeu el vostre programa per comprovar que funciona
correctament. Si no us en sortiu, piqueu el botó "Mostra solució" per veure una solució.

<div id='quiz'></div>

<script type="text/coffeescript">

quiz = """
Aquesta és una possible solució:

```
/* Llegeix tres enters i n'escriu la seva suma. */

#include <iostream>
using namespace std;

int main() {
    int x, y, z;            // Declaració de les variables
    cin >> x >> y >> z;     // Lectura de les dades d'entrada
    int s = x + y + z;      // Càlcul del resultat
    cout << s << endl;      // Escriptura de la dada de sortida
}
```
"""

window.reveal quiz, "quiz"

</script>

## Exercicis

A continuació us donem uns fragments de codi. Per a cadascun,
marqueu les respostes correctes.

### Exercici 1

```
int a = 3;
int b = 4;
int c = a + 2 * b;
```

<div id='quiz1'></div>

<script type="text/coffeescript">

quiz1 =
  type: "MultipleChoice"
  text: "Al final del programa, quines de les afirmacions següents són correctes?"
  choices: [
      text: "`a` val 3, `b` val 4 i `c` val 11."
      correct: true
    ,
      text: "`a` val 3, `b` val 4 i `c` val 20."
      correct: false
    ,
      text: "`a` val 4, `b` val 3 i `c` val 11."
      correct: false
    ,
      text: "`a` val 4, `b` val 3 i `c` val 20."
      correct: false
    ,
      text: "El programa està mal escrit."
      correct: false
  ]

window.quiz quiz1, "quiz1"

</script>
