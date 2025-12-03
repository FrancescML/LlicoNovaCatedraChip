# Ús de comentaris

> _The proper use of comments is to compensate for our failure to express ourselves in code._ — Robert C. Martin

Com hem vist a l'apartat anterior, la millor documentació és el mateix codi. Tot i així, hi ha moltes situacions en què els comentaris són útils —i fins i tot necessaris— per millorar la comprensió del comportament, les decisions o el context en què es troba el codi.

Aquí teniu un exemple de mal ús dels comentaris:

```python
def calcular_suma(nombres: list[int]) -> int:
    """Calcula la suma dels nombres."""

    suma = 0                    # Inicialitzem la suma a 0
    for nombre in nombres:      # Recorrem tots els nombres
        suma += nombre          # Sumem cada nombre
    return suma                 # Retornem la suma
```

Aquests comentaris són redundants i no aporten valor: el codi ja és prou clar per si mateix.

Els comentaris haurien d’explicar sobretot el **perquè** d’una decisió de codi, no **què** fa el codi. Aquí en teniu alguns exemples:

```python
def calcular_preu_amb_impostos(preu_base: float) -> float:
    """Calcula el preu final incloent impostos."""
    # Utilitzem 1.21 en lloc de calcular el 21% perquè és més eficient
    # i evita errors d'arrodoniment en multiplicacions successives.
    return preu_base * 1.21
```

```python
def processar_dades_sensor(dades: list[float]) -> list[float]:
    """Processa les dades brutes d'un sensor."""
    # Descartem el primer valor perquè hem observat experimentalment
    # que el sensor triga a estabilitzar-se.
    dades = dades[1:]

    # Apliquem un filtre per eliminar pics anòmals (valors > 100)
    # segons les especificacions del fabricant del sensor.
    # (vegeu https://sensors.example.com/specs)
    dades_filtrades = [x for x in dades if x <= 100]

    return dades_filtrades
```

Quan el codi és inevitablement complex, un comentari que expliqui la lògica global pot ser molt útil:

```python
def analitzar_complexitat(text: str) -> dict[str, float]:
    """
    Analitza la complexitat lingüística d'un text.
    Retorna mètriques de llegibilitat.
    """

    # Algorisme de Flesch-Kincaid per calcular la llegibilitat:
    # 1. Comptem síl·labes per paraula (complexitat lèxica)
    # 2. Comptem paraules per frase (complexitat sintàctica)
    # 3. Apliquem la fórmula:
    #    206.835 - 1.015*(paraules/frases) - 84.6*(síl·labes/paraules)

    paraules = text.split()
    frases = text.count('.') + text.count('!') + text.count('?')
    sillabes = sum(comptar_sillabes(paraula) for paraula in paraules)

    if frases == 0 or len(paraules) == 0:
        return {'llegibilitat': 0.0}

    llegibilitat = (
        206.835
        - 1.015 * (len(paraules) / frases)
        - 84.6 * (sillabes / len(paraules))
    )

    return {'llegibilitat': llegibilitat}
```

Altres situacions on els comentaris són útils:

-   **Comentaris TODO i FIXME**: Marqueu tasques pendents o problemes coneguts.
-   **Comentaris de llicència i copyright**: Incloeu-los a l’inici dels fitxers quan calgui.
-   **Comentaris per deshabilitar warnings**: Justifiqueu per què ignoreu un avís del linter.
-   **Comentaris sobre limitacions conegudes**: Documenteu restriccions, casos extrems o condicions de fallada.
-   **Referències externes**: Citeu articles, especificacions o documentació oficial quan implementeu algoritmes o estàndards.

Un exemple que agrupa diversos d’aquests usos:

```python
# J. Petit i J. Cortadella, desembre 2025
# (c) 2025 Universitat Politècnica de Catalunya
# Llicència: MIT

def processar_imatge(imatge: np.ndarray) -> np.ndarray:
    """Aplica el nostre processament avançat a una imatge."""

    # TODO: Implementar suport per a imatges en escala de grisos
    # FIXME: Aquest algoritme falla amb imatges molt grans (>10MB)

    # Ignorem el warning de deprecació perquè la nova funció
    # encara no està disponible a totes les versions suportades.
    resultat = metode_antic(imatge)  # type: ignore

    return resultat
```

## Principis per a bons comentaris

-   Els comentaris han d’explicar el **perquè**, no el **què**.
-   Eviteu comentaris redundants.
-   Justifiqueu decisions no òbvies i referencieu fonts externes quan calgui.
-   Els comentaris TODO i FIXME són útils per marcar treball pendent o problemes oberts.
-   Mantingueu els comentaris actualitzats: un comentari obsolet és pitjor que cap comentari.

## Errors freqüents

-   **Comentaris redundants**: Repeteixen el que ja diu el codi de manera evident.
-   **Comentar el "què" en lloc del "perquè"**.
-   **Comentaris desactualitzats** que contradien el comportament actual.
-   **Excés de comentaris o comentaris massa llargs**.
-   **No comentar quan cal**: ometre explicacions sobre decisions complexes o solucions temporals.
-   **Comentar codi dolent**: els comentaris no haurien de substituir una bona refactorització.
-   **No justificar solucions poc convencionals**: cal explicar decisions sorprenents o contranaturals.

<Autors autors="jpetit jordic"/>
