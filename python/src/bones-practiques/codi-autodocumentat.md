# La millor documentació és el codi mateix

> _A comment is a failure to express yourself in code._ — Robert C. Martin

Alguns programadors recorren a un ús compulsiu dels comentaris per intentar explicar què fa el seu codi. Però aquesta pràctica sovint amaga un problema més profund: el codi no és prou clar per si mateix.

La millor documentació no és la que s'escriu en comentaris, sinó que la es troba integrada en el propi codi.

Un codi ben escrit s'explica per si mateix: els noms de variables, funcions i classes són tan descriptius que qualsevol persona pot entendre la lògica sense llegir paràgrafs de comentaris. A continuació, veurem com fer que el vostre codi sigui autodocumentat, de manera que minimitzeu la necessitat de comentaris addicionals.

## Exemple 1

Considereu aquesta breu funció per trobar l’element més gran d’una llista.

```python
# Funció per trobar el màxim
def f(ll):
    m = None  # variable per guardar el màxim
    for x in ll:  # recorre tots els elements
        if m is None or x > m:  # si encara no tenim màxim o x és més gran
            m = x  # actualitza el màxim
    return m  # retorna el màxim
```

Els comentaris no aporten res: només descriuen literalment el que diu cada línia. Pijor, els noms `f`, `ll`, `m` i `x` no expliquen res sobre la seva funció o propòsit, fent que el codi sigui difícil d'entendre sense llegir-ne els comentaris.

Per esmenar això, podem millorar els noms i afegir anotacions de tipus per fer el codi autodocumentat:

```python
def trobar_valor_maxim(valors: list[int]) -> int | None:
    maxim_actual = None
    for valor in valors:
        if maxim_actual is None or valor > maxim_actual:
            maxim_actual = valor
    return maxim_actual
```

Les diferències clau són:

-   `trobar_valor_maxim` és molt més clar que `f`
-   `valors` i `maxim_actual` expliquen la seva funció sense comentaris
-   Les anotacions de tipus indiquen què rep i què pot retornar
-   Com que els noms són clars, **ja no cal cap comentari**

## Exemple 2

Aquí teniu un altre exemple d'una funció que processa una comanda d'un usuari, amb comentaris que expliquen cada pas:

```python
# Processa la comanda
def proc_cmd(u, items, cd):
    # Calcula total
    t = 0
    for i in items:
        t += i['p'] * i['q']  # preu * quantitat

    # Aplica codi descompte
    if cd:
        if cd == 'VIP10':
            t *= 0.9  # 10% descompte
        elif cd == 'NEW20':
            t *= 0.8  # 20% descompte

    # Comprova si l'usuari té prou saldo
    if u['saldo'] >= t:
        u['saldo'] -= t  # Resta el total
        return True
    return False
```

La veritat és que aquest codi es podria millorar molt simplement fent que expliqui per si mateix què fa, sense necessitat de comentaris. Aquí en teniu una versió millorada:

```python
@dataclass
class Client:
    nom: str
    saldo: float

@dataclass
class Article:
    nom: str
    preu: float
    quantitat: float


def processar_comanda_client(
    client: Client,
    articles: list[Article],
    codi_descompte: Optional[str] = None
) -> bool:
    preu_total = calcular_preu_total(articles)
    preu_amb_descompte = aplicar_descompte(preu_total, codi_descompte)

    if client_te_saldo_suficient(client, preu_amb_descompte):
        descomptar_del_saldo_client(client, preu_amb_descompte)
        return True
    return False

def calcular_preu_total(articles: list[Article]) -> float:
    return sum(article.preu * article.quantitat for article in articles)

def aplicar_descompte(preu: float, codi_descompte: Optional[str]) -> float:
    DESCOMPTES = {
        'VIP10': 0.10,
        'NEW20': 0.20
    }
    percentatge_descompte = DESCOMPTES.get(codi_descompte, 0)
    return preu * (1 - percentatge_descompte)

def client_te_saldo_suficient(client: Client, import_total: float) -> bool:
    return client.saldo >= import_total

def descomptar_del_saldo_client(client: Client, import_total: float) -> None:
    client.saldo -= import_total
```

Fixeu-vos en les diferències clau:

-   **Noms descriptius**: `processar_comanda_client` vs `proc_cmd`, `articles` vs `items`
-   **Ús de dataclasses**: `Client` vs `dict[str, float]`
-   **Anotacions de tipus**: Especifiquen clarament què espera i retorna cada funció
-   **Funcions petites**: Cada funció té una única responsabilitat clara
-   **Constants amb nom**: `DESCOMPTES` en lloc de valors màgics `0.9`, `0.8`
-   **No hi ha ni calen comentaris**: El codi explica què fa amb els seus noms i estructura

El fet que el codi sigui més llarg no és un problema; la claredat i mantenibilitat són molt més importants que l'extensió del codi. Aquest codi és més fàcil d'entendre, modificar, ampliar i testejar.

## Principis per escriure programes autodocumentats

-   **Trieu noms significatius:**
    Les variables, funcions i classes han d’expressar clarament la seva intenció. Uns bons noms redueixen la necessitat d’explicacions addicionals.

-   **Feu funcions curtes i amb una sola responsabilitat:**
    Quan una funció només fa una cosa, es pot descriure amb un nom concís i entenedor. Això en facilita la lectura i el testeig.

-   **Utilitzeu tipus i estructures de dades expressives:**
    Les anotacions de tipus, `dataclasses`, `enums` i altres eines us permeten expressar millor les intencions i les restriccions del vostre codi.

-   **Extreieu constants i valors màgics:**
    Donar nom a números o cadenes amb significat evita confusions i fa que el codi sigui autoexplicatiu.

-   **Encapsuleu la lògica complexa:**
    Si una part del vostre codi és difícil d’entendre, poseu-la en una funció amb un nom clar que expliqui què fa, no pas com ho fa.

-   **Escriviu codi que es llegeixi bé en veu alta:**
    Un bon indicador d’autodocumentació és que el codi "s’expliqui" a si mateix quan el llegiu. Si no sona natural, probablement cal repensar-lo.

-   **Prioritzeu la claredat per sobre de la llargada i l’optimització prematura:**
    Un codi clar es pot optimitzar més endavant si cal; un codi opac és difícil de mantenir i encara més difícil de corregir.

-   **Mantingueu una estructura consistent i coherent:**
    Un estil uniforme (noms, format, patrons arquitectònics) redueix la càrrega cognitiva i facilita que tothom entengui el comportament del programa.

## Recordeu

-   Procureu que el vostre codi s'expliqui per si mateix.
-   Utilitzeu noms descriptius i significatius per a variables, funcions i tipus que expliquin clarament la seva finalitat.
-   El codi hauria de llegir-se com un text en llenguatge natural.
-   Els comentaris poden quedar obsolets, però el codi autodocumentat sempre està actualitzat perquè és el propi codi.

<Autors autors="jpetit jordic"/>
