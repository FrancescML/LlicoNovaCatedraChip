# Especificacions

> _A specification is a contract. Like any contract, it needs to be clear about the obligations of both parties._ — **Barbara Liskov**

> _Code tells you how; comments tell you why; specifications tell you what._ — **Jeff Atwood**

Una especificació de funció és un **contracte entre l'usuari i l'implementador**. Defineix clarament què fa una funció sense revelar com ho fa. Aquest contracte estableix les responsabilitats de cadascú: l'usuari ha de proporcionar entrades vàlides, i l'implementador ha de generar sortides correctes assumint que les entrades són vàlides.

L'especificació actua com una capa d'abstracció que separa la interfície de la implementació. L'usuari només necessita saber què fa la funció i com cridar-la, mentre que l'implementador és lliure de canviar els detalls interns sempre que respecti el contracte establert.

En Python, les especificacions es documenten mitjançant _docstrings_, que són cadenes de text col·locades just després de la definició d'una funció. Les funcions `help()` i eines de generació de documentació utilitzen aquestes docstrings per proporcionar informació útil als usuaris. Aquest és un exemple bàsic d'especificació:

```python
def mitjana(L: list[float]) -> float:
    """
    Calcula la mitjana aritmètica d'una llista de nombres.
    Precondició: L no és buida.
    """
```

Una especificació completa consta de dues parts fonamentals:

-   **Precondicions**: Descriuen les entrades vàlides que la funció espera rebre. Defineixen les assumpcions que l'implementador pot fer sobre els paràmetres d'entrada.

-   **Postcondicions**: Descriuen què retorna la funció i quin efecte té. Especifiquen el resultat garantit quan les precondicions es compleixen.

Addicionalment, una específica també pot incloure:

-   **Garanties d'eficiència**: Indiquen el rendiment esperat, com ara la complexitat temporal o espacial.

Una especificació de qualitat ha de ser:

-   **Completa**: Descriu tots els paràmetres i el valor retorna i cobreix tots els casos d'entrada vàlids.
-   **Inequívoca**: Especifica clarament el resultat per a cada entrada vàlida possible, sense deixar lloc a la interpretació.
-   **Clara i concisa**: Usa un llenguatge precís que qualsevol usuari pugui entendre sense ambigüitats.
-   **Abstracta**: No revela detalls d'implementació com variables internes, algorismes o estructures de dades utilitzades.

Per convenció, en Python, les especificacions assumeixen que els paràmetres no es modifiquen a menys que s'indiqui explícitament. Si una funció modifica un paràmetre, això ha d'estar clarament documentat a l'especificació. Si no es diu, s'entén que els paràmetres es mantenen inalterats. A l'exemple anterior, no cal doncs especificar que `L` no es modifica, ja que és l'assumpció per defecte.

## Formats d'especificació

Python té diversos formats estàndard per descriure docstrings. Per exemple, el format Google és popular i recomanat per la seva claredat. Aquí teniu un exemple d'especificació ben escrita utilitzant aquest format:

```python
def calcular_descompte(preu: float, percentatge: float) -> float:
    """Calcula el preu final després d'aplicar un descompte.

    Args:
        preu: Preu original del producte (ha de ser positiu).
        percentatge: Percentatge de descompte entre 0 i 100.

    Returns:
        Preu final després d'aplicar el descompte.

    Raises:
        ValueError: Si el preu és negatiu o el percentatge està fora del rang [0, 100].
    """
```

Ignoreu el `raises` si no useu excepcions.

Trieu un format (o seguiu el del vostre projecte) i sigueu consistents.

## Evolució cap a una bona especificació

Exemple d'en JordiC actualitzat

## Recordeu

-   Una especificació és un contracte: defineix responsabilitats clares entre usuari i implementador.
-   Descriviu **què** fa la funció, mai **com** ho fa.
-   Documenteu tots els paràmetres, el valor de retorn i les possibles excepcions.
-   Cobriu tots els casos possibles: entrades normals, casos límit i situacions d'error.
-   Sigueu inequívocs: no deixeu cap comportament sense especificar.
-   Utilitzeu un format estàndard i mantingueu-lo consistent en tot el projecte.

## Errors freqüents

-   **No mencionar tots els paràmetres**: Escriure una descripció genèrica sense fer referència explícita als noms dels paràmetres de la funció.
-   **No mencionar el resultat**: Escriure una descripció genèrica sense fer referència explícita al valor de retorn de la funció.
-   **Especificacions incompletes**: No cobrir tots els casos possibles, especialment casos límit, valors especials (zero, negatiu, buit) o situacions d'error.
-   **Ambigüitat en casos múltiples**: No especificar què passa quan hi ha diverses respostes possibles (per exemple, quan un element apareix múltiples vegades).
-   **Especificacions massa breus/massa llargues**: Escriure només una línia vaga que no aporta informació útil més enllà del nom de la funció o incloure exemples extensos, explicacions innecessàries o detalls que haurien d'estar en comentaris interns.
-   **Revelar detalls d'implementació**: Descriure l'algorisme, les variables internes o l'estructura de dades utilitzada en lloc de centrar-se en què fa la funció.

<Autors autors="jpetit jordic"/>
