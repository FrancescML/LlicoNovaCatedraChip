# Bones pràctiques per escriure programes

<img src='./bones-practiques.png' style='height: 8em; float: right; margin: 2em 0em 0em 2em;'/>

Aquesta lliçó presenta bones pràctiques per procurar escriure codi de qualitat més enllà de la seva correctesa.

Gràcies en aquestes bones pràctiques, aprendreu a organitzar millor els vostres programes, escollir bons noms per a variables i funcions, escriure especificacions clares per tal que el vostre codi sigui llegible i mantenible en el futur.

## Per què és important la qualitat del codi?

> _Any fool can write code that a computer can understand. Good programmers write code that humans can understand._ — **Martin Fowler**

> _Code is read much more often than it is written, so plan accordingly._ — **Guido van Rossum**

Escriure codi no és només fer que l'ordinador faci el que volem. És crear quelcom que altres persones (inclòs el vostre jo del futur) hauran de llegir, entendre i modificar. Un programa que funciona però és difícil d'entendre és com un llibre escrit en un idioma que ningú no pot desxifrar: té informació valuosa però és pràcticament inútil.

En aquest sentit, és fonamental recordar que programem per a persones, no només per a màquines. El codi que escrivim avui serà llegit, revisat i transformat moltes vegades al llarg de la seva vida útil. Per això, la qualitat del codi es converteix en un pilar essencial del desenvolupament de programari sostenible.

Un codi de qualitat s'entén amb facilitat, permetent que qualsevol programador el pugui llegir com si fos un text ben escrit. Aquesta claredat facilita la col·laboració entre membres dels equips i accelera la incorporació de nous desenvolupadors als projectes. A més, un bon codi es modifica sense por: els canvis no provoquen errors inesperats gràcies a una estructura clara i ben organitzada i manca d'efectes secundaris.

La qualitat també es reflecteix en la capacitat d'extensió del codi. Un disseny ben pensat permet afegir noves funcionalitats de manera natural, sense haver de reescriure seccions senceres del projecte. Finalment, i potser més important, el codi de qualitat es manté al llarg del temps: no es converteix en un malson incomprensible després de sis mesos, sinó que roman llegible, mantenible i adaptat a les necessitats canviants del projecte.

### Recordeu

-   Programeu per a persones, no només per a màquines: el vostre codi serà llegit moltes més vegades del que serà escrit.
-   La claredat és essencial: un bon codi es llegeix com un text ben escrit i facilita la col·laboració entre l'equip.
-   El codi de qualitat permet fer canvis amb confiança, sense por d'introduir errors inesperats.
-   Un bon disseny facilita l'extensió: afegir noves funcionalitats no ha de requerir reescriure tot el projecte.
-   La qualitat del codi és una inversió de futur: el que escriviu avui determina si el projecte serà mantenible l'endemà.

## La millor documentació és el codi mateix

> _A comment is a failure to express yourself in code._ — Robert C. Martin

Alguns programadors recorren a un ús compulsiu dels comentaris per intentar explicar què fa el seu codi. Però aquesta pràctica sovint amaga un problema més profund: el codi no és prou clar per si mateix.

La millor documentació no és la que s'escriu en comentaris, sinó que la es troba integrada en el propi codi.

Un codi ben escrit s'explica per si mateix: els noms de variables, funcions i classes són tan descriptius que qualsevol persona pot entendre la lògica sense llegir paràgrafs de comentaris. Quan el codi necessita explicacions constants, el problema és la seva qualitat.

Els comentaris tenen el seu lloc, evidentment! Però massa sovint els comentaris esdevenen obsolets. El codi evoluciona, però els comentaris rarament s'actualitzen, creant confusió. Un codi autodocumentat no pot quedar desactualitzat perquè la documentació i la implementació són el mateix. Reserveu els comentaris per explicar decisions de disseny complexes o el "per què" quan no és obvi, no per repetir el que el codi ja diu o allò que podria dir per ell mateix.

### Exemple

Aquí teniu un exemple d'una funció que processa una comanda d'un usuari, amb comentaris que expliquen cada pas:

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
from typing import TypeAlias, Optional

Client: TypeAlias = dict[str, float]
Article: TypeAlias = dict[str, float]  # preu i quantitat

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
    return sum(article['preu'] * article['quantitat'] for article in articles)

def aplicar_descompte(preu: float, codi_descompte: Optional[str]) -> float:
    DESCOMPTES = {
        'VIP10': 0.10,
        'NEW20': 0.20
    }
    percentatge_descompte = DESCOMPTES.get(codi_descompte, 0)
    return preu * (1 - percentatge_descompte)

def client_te_saldo_suficient(client: Client, import_total: float) -> bool:
    return client['saldo'] >= import_total

def descomptar_del_saldo_client(client: Client, import_total: float) -> None:
    client['saldo'] -= import_total
```

Fixeu-vos en les diferències clau:

-   **Noms descriptius**: `processar_comanda_client` vs `proc_cmd`, `articles` vs `items`
-   **Anotacions de tipus**: Especifiquen clarament què espera i retorna cada funció
-   **Funcions petites**: Cada funció té una única responsabilitat clara
-   **Constants amb nom**: `DESCOMPTES` en lloc de valors màgics `0.9`, `0.8`
-   **Cap comentari és necessari**: El codi explica què fa amb els seus noms i estructura

El fet que el codi sigui més llarg no és un problema; la claredat i mantenibilitat són molt més importants que l'extensió del codi. Aquest codi és més fàcil d'entendre, modificar, ampliar i testejar.

### Recordeu

-   Procureu que el vostre codi s'expliqui per si mateix.
-   Utilitzeu noms descriptius i significatius per a variables, funcions i classes que expliquin clarament la seva finalitat.
-   El codi hauria de llegir-se com un text en llenguatge natural, no com una sopa d'abreviatures i sigles.
-   Els comentaris poden quedar obsolets, però el codi autodocumentat sempre està actualitzat perquè és el propi codi.
-   Reserveu els comentaris per explicar decisions de disseny complexes o el "per què" quan no és obvi, no el "què" que ja fa el codi.
-   Si necessiteu molts comentaris per explicar què fa el vostre codi, probablement hàgiu de refactoritzar-lo (reorganitzar-lo) per fer-lo més clar.

## Ús de comentaris

> _The proper use of comments is to compensate for our failure to express ourselves in code._ — Robert C. Martin

Com hem vist a l'apartat anterior, la millor documentació és el codi mateix. No obstant això, hi ha moltes situacions on els comentaris són útils i fins i tot necessaris per millorar la comprensió del codi.

Aquí teniu un exemple de mal ús de comentaris:

```python
def calcular_suma(nombres: list[int]) -> int:
    """Calcula la suma dels nombres."""

    suma = 0                    # Inicialitzem la suma a 0
    for nombre in nombres:      # Recorrem tots els nombres
        suma += nombre          # Sumem cada nombre
    return suma                 # Retornem la suma
```

Aquests comentaris són redundants i no aporten cap valor addicional, ja que el codi és prou clar per si mateix.

Els comentaris haurien d'explicar el **perquè** d'una decisió de codi, no **què** fa el codi. Aquí en teniu dos exemples:

```python
def calcular_preu_amb_impostos(preu_base: float) -> float:
    """Calcula el preu final incloent impostos."""
    # Utilitzem 1.21 en lloc de calcular 21% perquè és més eficient
    # i evita errors d'arrodoniment en multiplicacions successives
    return preu_base * 1.21
```

```python
def processar_dades_sensor(dades: list[float]) -> list[float]:
    """Processa les dades brutes d'un sensor."""
    # Descartem el primer valor perquè hem trobat experimentalment que el sensor triga a estabilitzar-se
    dades = dades[1:]

    # Apliquem un filtre per eliminar pics anòmals (valors > 100)
    # segons les especificacions del fabricant del sensor
    # (vegeu https:://sensors.example.com/specs)
    dades_filtrades = [x for x in dades if x <= 100]

    return dades_filtrades
```

Quan el codi és inevitablement complex, un comentari que expliqui la lògica global ajuda:

```python
def analitzar_complexitat(text: str) -> dict[str, float]:
    """
    Analitza la complexitat lingüística d'un text.
    Retorna mètriques de llegibilitat.
    """
    # Algoritme de Flesch-Kincaid per calcular llegibilitat:
    # 1. Comptem síl·labes per paraula (factor de complexitat lèxica)
    # 2. Comptem paraules per frase (factor de complexitat sintàctica)
    # 3. Apliquem la fórmula: 206.835 - 1.015*(paraules/frases) - 84.6*(síl·labes/paraules)

    paraules = text.split()
    frases = text.count('.') + text.count('!') + text.count('?')
    sillabes = sum(comptar_sillabes(paraula) for paraula in paraules)

    if frases == 0 or len(paraules) == 0:
        return {'llegibilitat': 0.0}

    llegibilitat = 206.835 - 1.015 * (len(paraules) / frases) - 84.6 * (sillabes / len(paraules))

    return {'llegibilitat': llegibilitat}
```

Hi ha altres situacions on els comentaris són útils:

-   **Comentaris TODO i FIXME**: Marqueu tasques pendents o problemes coneguts que cal resoldre en el futur.

-   **Comentaris de llicència i copyright**: Incloeu-los a l'inici dels fitxers en projectes de codi obert o entorns professionals.

-   **Comentaris per deshabilitar warnings**: Justifiqueu per què ignoreu un avís del linter quan teniu una bona raó per fer-ho.

-   **Comentaris sobre limitacions conegudes**: Advertiu sobre restriccions, casos extrems o condicions sota les quals el codi pot fallar.

-   **Referències externes**: Citeu papers científics, especificacions o documentació oficial quan implementeu algoritmes o seguiu estàndards concrets.

L'exemple següent mostra diversos d'aquests usos:

```python
# J. Petit i J. Cortadella, desembre 2025
# (c) 2025 Universitat Politècnica de Catalunya
# Llicència: MIT

def processar_imatge(imatge: np.ndarray) -> np.ndarray:
    """Aplica el nostre processament avançat a una imatge."""

    # TODO: Implementar suport per imatges en escala de grisos
    # FIXME: Aquest algoritme falla amb imatges molt grans (>10MB)

    # Ignorem el warning de deprecació perquè la nova funció
    # encara no està disponible a totes les versions que donem suport
    resultat = metode_antic(imatge) # type: ignore

    return resultat
```

### Recordeu

-   Els comentaris han d'explicar el **perquè**, no el **què** fa el codi.
-   Eviteu comentaris redundants.
-   Useu comentaris per justificar decisions no òbvies, advertir sobre limitacions o referenciar fonts externes.
-   Els comentaris TODO i FIXME són útils per marcar tasques pendents o problemes coneguts.
-   Mantingueu els comentaris actualitzats: un comentari obsolet és pitjor que cap comentari.

### Errors freqüents en l'ús de comentaris

-   **Comentaris redundants**: Escriure comentaris que només repeteixen exactament el que el codi ja diu de manera obvia.

-   **Comentar el "què" en lloc del "perquè"**: Explicar què fa cada línia de codi en lloc d'explicar la raó o motivació darrere d'una decisió.

-   **Comentaris desactualitzats**: Mantenir comentaris antics que ja no reflecteixen el que fa el codi actual, creant confusió.

-   **Massa comentaris, comentaris massa llargs i comentaris obvis**.

-   **No comentar quan cal**: Oblidar explicar decisions complexes, algoritmes no trivials o solucions temporals.

-   **Comentar codi dolent**: Usar comentaris per explicar codi confús en lloc de refactoritzar-lo per fer-lo més clar.

-   **No justificar solucions contranaturals**: Ometre explicacions quan es fa alguna cosa poc convencional o que sembla estranya a primera vista.

## Disseny i descomposició de funcions

> _Controlling complexity is the essence of computer programming._ — Brian Kernighan

> _Functions should do one thing. They should do it well. They should do it only._ — Robert C. Martin (Uncle Bob)

Descompondre un programa en funcions petites i ben definides és un dels principis fonamentals de la programació de qualitat. Cada funció hauria de fer **una sola cosa**, **fer-la tota** i **fer-la bé**. Aquesta filosofia no només fa el codi més fàcil de llegir i entendre, sinó que també facilita la detecció d'errors, el testing i la reutilització.

Penseu en les funcions com en caixes negres que amaguen complexitat: l'usuari només necessita saber què fan, no com ho fan. Aquesta abstracció permet treballar en diferents nivells de detall i construir programes complexos a partir de peces simples i comprensibles.

Un programa ben descompost es llegeix com un text narratiu: les funcions de més alt nivell expliquen "què" es fa, mentre que les de més baix nivell expliquen "com" es fa. Aquesta jerarquia natural ajuda a entendre el codi de manera progressiva.

### Funcions que no fan tot el que han de fer

Les funcions han de gestionar tots els casos que els poden afectar. No han de delegar responsabilitats als usuaris de la funció que haurien de ser seves.

Per exemple, aquesta funció comprova si un nombre és primer però per alguna raó, assumeix que el nombre és sempre major que 1 i no gestiona aquest cas:

```python
def es_primer(n: int) -> bool:
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d += 1
    return True
```

Els usuaris s'han d'encarregar ells mateixos dels casos particulars, fent que la funció sigui menys útil i més propensa a errors.

```python
if n <= 1:
    print(f"{n} no és primer")
elif es_primer(n):
    print(f"{n} és primer")
else:
    print(f"{n} no és primer")
```

Una millor versió gestiona tots els casos:

```python
def es_primer(n: int) -> bool:
    """Comprova si un nombre és primer."""
    if n <= 1:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d += 1
    return True
```

### Principi de responsabilitat única

Cada funció hauria de tenir una única raó per existir, és a dir, una única responsabilitat. Si una funció fa més d'una cosa, probablement s'hauria de dividir en funcions més petites.

**❌ Funció que fa massa coses:**

```python
def processar_usuari(nom: str, email: str, edat: int) -> bool:
    """Valida, registra i envia email de benvinguda a un usuari."""

    # Validació
    if not nom or len(nom) < 2:
        return False
    if '@' not in email or '.' not in email:
        return False
    if edat < 18:
        return False

    # Connexió a base de dades
    conn = sqlite3.connect('usuaris.db')
    cursor = conn.cursor()

    # Inserció
    try:
        cursor.execute(
            "INSERT INTO usuaris (nom, email, edat) VALUES (?, ?, ?)",
            (nom, email, edat)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        conn.close()
        return False

    conn.close()

    # Enviar email
    msg = f"Benvingut/da {nom}! Gràcies per registrar-te."
    smtp = smtplib.SMTP('smtp.example.com', 587)
    smtp.starttls()
    smtp.login('admin@example.com', 'password')
    smtp.sendmail('admin@example.com', email, msg)
    smtp.quit()

    return True
```

**✅ Descomposició en funcions amb responsabilitat única:**

```python
def processar_usuari(nom: str, email: str, edat: int) -> bool:
    """Processa el registre complet d'un nou usuari."""
    if not validar_dades_usuari(nom, email, edat):
        return False

    if not guardar_usuari_bd(nom, email, edat):
        return False

    enviar_email_benvinguda(nom, email)
    return True

def validar_dades_usuari(nom: str, email: str, edat: int) -> bool:
    """Valida les dades d'un nou usuari."""
    return (validar_nom(nom) and
            validar_email(email) and
            validar_edat(edat))

def validar_nom(nom: str) -> bool:
    """Verifica que el nom sigui vàlid."""
    return nom is not None and len(nom) >= 2

def validar_email(email: str) -> bool:
    """Verifica que l'email tingui un format vàlid."""
    return '@' in email and '.' in email

def validar_edat(edat: int) -> bool:
    """Verifica que l'usuari sigui major d'edat."""
    return edat >= 18

def guardar_usuari_bd(nom: str, email: str, edat: int) -> bool:
    """Guarda un nou usuari a la base de dades."""
    try:
        conn = obtenir_connexio_bd()
        inserir_usuari(conn, nom, email, edat)
        tancar_connexio_bd(conn)
        return True
    except sqlite3.IntegrityError:
        return False

def enviar_email_benvinguda(nom: str, email: str) -> None:
    """Envia un email de benvinguda al nou usuari."""
    missatge = crear_missatge_benvinguda(nom)
    enviar_email(email, missatge)
```

### Nivells d'abstracció

Les funcions dins d'una altra funció haurien de mantenir-se al mateix nivell d'abstracció. Barrejar operacions d'alt nivell amb detalls de baix nivell fa el codi difícil de seguir.

**❌ Nivells d'abstracció barrejats:**

```python
def generar_informe_vendes(data_inici: date, data_fi: date) -> str:
    """Genera un informe de vendes."""
    vendes = obtenir_vendes_periode(data_inici, data_fi)

    # Càlcul directe barrejat amb lògica d'alt nivell
    total = 0
    for venda in vendes:
        preu = venda['preu']
        quantitat = venda['quantitat']
        descompte = venda.get('descompte', 0)
        total += preu * quantitat * (1 - descompte / 100)

    informe = crear_capçalera_informe(data_inici, data_fi)
    informe += f"\nTotal vendes: {total:.2f}€"

    return informe
```

**✅ Nivells d'abstracció consistents:**

```python
def generar_informe_vendes(data_inici: date, data_fi: date) -> str:
    """Genera un informe de vendes."""
    vendes = obtenir_vendes_periode(data_inici, data_fi)
    total = calcular_total_vendes(vendes)
    informe = crear_informe(data_inici, data_fi, total)
    return informe

def calcular_total_vendes(vendes: list[dict]) -> float:
    """Calcula el total de vendes aplicant descomptes."""
    return sum(calcular_preu_venda(v) for v in vendes)

def calcular_preu_venda(venda: dict) -> float:
    """Calcula el preu d'una venda individual."""
    preu_base = venda['preu'] * venda['quantitat']
    descompte = venda.get('descompte', 0)
    return aplicar_descompte(preu_base, descompte)
```

### Paràmetres de funció

Les funcions amb molts paràmetres són difícils d'entendre i utilitzar. Si una funció necessita més de 3-4 paràmetres, considereu agrupar-los en un objecte o estructura.

**❌ Massa paràmetres:**

```python
def crear_factura(
    client_nom: str,
    client_email: str,
    client_adreca: str,
    client_ciutat: str,
    client_cp: str,
    num_factura: int,
    data: date,
    import_total: float,
    iva: float
) -> Factura:
    """Crea una nova factura."""
    ...
```

**✅ Paràmetres agrupats:**

```python
@dataclass
class DadesClient:
    nom: str
    email: str
    adreca: str
    ciutat: str
    codi_postal: str

@dataclass
class DadesFactura:
    numero: int
    data: date
    import_base: float
    iva: float

def crear_factura(client: DadesClient, factura: DadesFactura) -> Factura:
    """Crea una nova factura."""
    ...
```

Els paràmetres booleans sovint indiquen que la funció fa dues coses diferents. És millor dividir-la en dues funcions.

**❌ Flag booleà:**

```python
def processar_comanda(comanda: Comanda, es_urgent: bool) -> None:
    """Processa una comanda normal o urgent."""
    if es_urgent:
        # Processament urgent
        validar_rapidament(comanda)
        enviar_immediatament(comanda)
    else:
        # Processament normal
        validar_completament(comanda)
        afegir_a_cua(comanda)
```

**✅ Funcions separades:**

```python
def processar_comanda_normal(comanda: Comanda) -> None:
    """Processa una comanda amb el flux normal."""
    validar_completament(comanda)
    afegir_a_cua(comanda)

def processar_comanda_urgent(comanda: Comanda) -> None:
    """Processa una comanda amb prioritat urgent."""
    validar_rapidament(comanda)
    enviar_immediatament(comanda)
```

### Funcions sense efectes secundaris

Un **efecte secundari** és qualsevol modificació que fa una funció fora del seu àmbit local, com canviar variables globals, modificar paràmetres, escriure a fitxers o mostrar informació per pantalla. Els efectes secundaris fan el codi més difícil de comprendre, provar i depurar perquè el comportament d'una funció depèn o afecta elements externs que no són evidents en la seva crida. Per això, una funció hauria de fer exactament el que el seu nom indica, sense efectes secundaris ocults.

**❌ Efectes secundaris ocults:**

```python
def validar_usuari(usuari: Usuari) -> bool:
    """Valida les credencials d'un usuari."""
    if usuari.password == usuari.password_hash:
        # Efecte secundari ocult!
        usuari.ultima_connexio = datetime.now()
        guardar_usuari(usuari)
        return True
    return False
```

**✅ Sense efectes secundaris:**

```python
def validar_credencials(usuari: Usuari) -> bool:
    """Verifica si les credencials són correctes."""
    return usuari.password == usuari.password_hash

def registrar_connexio(usuari: Usuari) -> None:
    """Actualitza la data d'última connexió de l'usuari."""
    usuari.ultima_connexio = datetime.now()
    guardar_usuari(usuari)

# Ús explícit
if validar_credencials(usuari):
    registrar_connexio(usuari)
```

### Longitud de les funcions

Les funcions haurien de ser curtes. Una bona regla és que haurien de caber en una pantalla sense necessitat de fer scroll. Si una funció és massa llarga, probablement fa massa coses i s'hauria de descompondre.

**Guia general**:

-   **0-10 línies**: Ideal
-   **10-20 línies**: Acceptable si existeix una bona raó per gestionar la complexitat
-   **20-30 línies**: Revisar si es pot descompondre
-   **30+ línies**: Probablement fa massa coses

### Exemple complet de bona descomposició

```python
from dataclasses import dataclass
from typing import List
from datetime import date

@dataclass
class Article:
    nom: str
    preu: float
    quantitat: int

@dataclass
class Client:
    nom: str
    email: str
    descompte_vip: float = 0.0

def processar_compra(client: Client, articles: List[Article]) -> float:
    """Processa una compra i retorna l'import total."""
    if not validar_compra(articles):
        raise ValueError("Compra invàlida")

    subtotal = calcular_subtotal(articles)
    descompte = calcular_descompte(subtotal, client)
    total = subtotal - descompte

    enviar_confirmacio(client, articles, total)

    return total

def validar_compra(articles: List[Article]) -> bool:
    """Verifica que la compra sigui vàlida."""
    return len(articles) > 0 and all(es_article_valid(a) for a in articles)

def es_article_valid(article: Article) -> bool:
    """Verifica que un article sigui vàlid."""
    return article.quantitat > 0 and article.preu >= 0

def calcular_subtotal(articles: List[Article]) -> float:
    """Calcula el subtotal de la compra."""
    return sum(calcular_preu_article(a) for a in articles)

def calcular_preu_article(article: Article) -> float:
    """Calcula el preu total d'un article."""
    return article.preu * article.quantitat

def calcular_descompte(subtotal: float, client: Client) -> float:
    """Calcula el descompte aplicable al client."""
    return subtotal * client.descompte_vip

def enviar_confirmacio(client: Client, articles: List[Article], total: float) -> None:
    """Envia email de confirmació de compra al client."""
    missatge = crear_missatge_confirmacio(client, articles, total)
    enviar_email(client.email, missatge)

def crear_missatge_confirmacio(
    client: Client,
    articles: List[Article],
    total: float
) -> str:
    """Crea el missatge de confirmació de compra."""
    linies = [f"Hola {client.nom},", "", "Has comprat:"]
    linies.extend(formatar_article(a) for a in articles)
    linies.append(f"\nTotal: {total:.2f}€")
    return "\n".join(linies)

def formatar_article(article: Article) -> str:
    """Formata un article per mostrar."""
    return f"- {article.nom}: {article.quantitat} x {article.preu:.2f}€"
```

**Recordeu:**

-   Cada funció hauria de fer una sola cosa, fer-la tota, i fer-la bé (principi de responsabilitat única).
-   Manteniu les funcions curtes: si no cap en una pantalla, probablement fa massa coses.
-   Totes les operacions dins d'una funció haurien d'estar al mateix nivell d'abstracció.
-   Minimitzeu el nombre de paràmetres: més de 3-4 indica que potser cal agrupar-los.
-   Eviteu paràmetres booleans que controlin el flux: millor dividir en dues funcions separades.
-   Les funcions han de fer exactament el que el seu nom indica, sense efectes secundaris ocults.
-   Un codi ben descompost es llegeix com un text narratiu de dalt a baix.
-   La descomposició facilita el testing: funcions petites són més fàcils de provar.

### Errors freqüents en disseny de funcions

-   **Funcions massa llargues**: Funcions de 50, 100 o més línies que fan massa coses i són difícils d'entendre.

-   **Barrejar nivells d'abstracció**: Combinar operacions d'alt nivell (com "processar comanda") amb detalls de baix nivell (com manipular bits).

-   **No extreure codi duplicat**: Repetir la mateixa lògica en lloc de crear una funció reutilitzable.

-   **Funcions amb massa responsabilitats**: Una funció que valida, processa, guarda i envia emails ho fa tot alhora.

-   **Massa paràmetres**: Funcions amb 5, 7 o més paràmetres que són difícils de recordar i utilitzar correctament.

-   **Efectes secundaris ocults**: Funcions que modifiquen estat global o tenen efectes que no són evidents pel seu nom.

-   **Noms que no reflecteixen el que fa**: Una funció anomenada `obtenir_usuari()` que també crea l'usuari si no existeix.

-   **No separar consultes de comandes**: Barrejar funcions que retornen informació amb funcions que modifiquen estat.

-   **Funcions massa genèriques**: Crear funcions "fes-ho-tot" que accepten massa opcions i tenen massa branques condicionals.

-   **Acoblament excessiu**: Funcions que depenen de massa detalls interns d'altres classes o mòduls.

## Especificacions

> _A specification is a contract. Like any contract, it needs to be clear about the obligations of both parties._ — Barbara Liskov

> _Code tells you how; comments tell you why; specifications tell you what._ — Jeff Atwood

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
-   **Abstracta**: No revela detalls d'implementació com variables internes, algorismes o estructures de dades utilitzades.
-   **Clara i concisa**: Usa un llenguatge precís que qualsevol usuari pugui entendre sense ambigüitats.

Per convenció, les especificacions assumeixen que els paràmetre no es modifiquen a menys que s'indiqui explícitament. Si una funció modifica un paràmetre d'entrada, això ha d'estar clarament documentat a l'especificació. Si no es diu, s'entén que els paràmetres es mantenen inalterats.

### Formats d'especificació

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

Trieu un format (o seguiu el del vostre projecte) i sigueu consistents.

### Evolució cap a una bona especificació

Exemple d'en JordiC actualitzat

### Recordeu

-   Una especificació és un contracte: defineix responsabilitats clares entre usuari i implementador.
-   Descriviu **què** fa la funció, mai **com** ho fa.
-   Documenteu tots els paràmetres, el valor de retorn i les possibles excepcions.
-   Cobriu tots els casos possibles: entrades normals, casos límit i situacions d'error.
-   Sigueu inequívocs: no deixeu cap comportament sense especificar.
-   Utilitzeu un format estàndard i mantingueu-lo consistent en tot el projecte.

### Errors freqüents en escriure especificacions

-   **No mencionar tots els paràmetres**: Escriure una descripció genèrica sense fer referència explícita als noms dels paràmetres de la funció.

-   **Revelar detalls d'implementació**: Descriure l'algorisme, les variables internes o l'estructura de dades utilitzada en lloc de centrar-se en què fa la funció.

-   **Especificacions incompletes**: No cobrir tots els casos possibles, especialment casos límit, valors especials (zero, negatiu, buit) o situacions d'error.

-   **Ambigüitat en casos múltiples**: No especificar què passa quan hi ha diverses respostes possibles (per exemple, quan un element apareix múltiples vegades).

-   **Especificacions massa breus/massa llargues**: Escriure només una línia vaga que no aporta informació útil més enllà del nom de la funció o incloure exemples extensos, explicacions innecessàries o detalls que haurien d'estar en comentaris interns.

-   **No especificar el valor de retorn**: Descriure els paràmetres d'entrada però oblidar explicar clarament què retorna la funció.

## Ús d'identificadors

> _There are only two hard things in Computer Science: cache invalidation and naming things._ — Phil Karlton

> _You should name a variable using the same care with which you name a first-born child._ — Robert C. Martin

Els identificadors (noms de variables, funcions, classes, etc.) són el vocabulari del vostre codi. Són la primera línia de documentació i la més important: un bon nom pot fer que el codi s'expliqui per si mateix, mentre que un mal nom pot fer-lo incomprensible. Recordeu que el codi es llegeix moltes més vegades del que s'escriu, i uns identificadors clars faciliten enormement aquesta lectura.

Un bon identificador revela la intenció sense necessitat de comentaris addicionals. Quan algú llegeix `calcular_preu_total_amb_impostos()` entén immediatament què fa la funció, però amb `calc_pt()` necessitarà buscar l'especificació (si hi és) o llegir codi o comentaris per entendre-ho.

Aquí teniu un exemple amb identificadors poc descriptius:

```python
def f(x, y, z):
    """Processa una comanda."""
    t = 0
    for i in x:
        t += i['p'] * i['q']

    if z:
        if z == 'V10':
            t *= 0.9
        elif z == 'N20':
            t *= 0.8

    if y['s'] >= t:
        y['s'] -= t
        return True
    return False

# Ús
resultat = f(lst, u, cd)
```

I aquí teniu la mateixa funció amb identificadors clars i descriptius:

```python
def processar_comanda_client(articles, client, codi_descompte):
    """Processa una comanda de client."""
    preu_total = 0
    for article in articles:
        preu_total += article['preu'] * article['quantitat']

    if codi_descompte:
        if codi_descompte == 'VIP10':
            preu_total *= 0.9
        elif codi_descompte == 'NEW20':
            preu_total *= 0.8

    if client['saldo'] >= preu_total:
        client['saldo'] -= preu_total
        return True
    return False

# Ús
comanda_processada = processar_comanda_client(articles_cistella, dades_client, codi_promocio)
```

### Convencions de nomenclatura en Python

Python segueix una sèrie de [convencions](https://peps.python.org/pep-0008/) per anomenar els identificadors segons el seu context. Aquí teniu les més importants:

-   **Variables i funcions**: Useu `snake_case` (minúscules amb guions baixos)

    ```python
    nombre_complet = "Anna Garcia"
    preu_amb_descompte = 19.99

    def calcular_area_cercle(radi: float) -> float:
        return math.pi * radi ** 2
    ```

-   **Constants**: Useu `SCREAMING_SNAKE_CASE` (majúscules amb guions baixos)

    ```python
    VELOCITAT_LLUM = 299792458  # m/s
    IVA_GENERAL = 0.21
    MAX_INTENTS_LOGIN = 3
    ```

-   **Classes**: Useu `PascalCase` (cada paraula comença amb majúscula)

    ```python
    class Graf: ...
    class CompteBancari: ...
    ```

-   **Variables privades**: Comenceu amb un guió baix

    ```python
    class Persona:
        def __init__(self, nom: str) -> None:
            self._edat = 0  # Variable "privada"
            self.nom = nom  # Variable pública
    ```

### Principis per escollir bons identificadors

Aquestes són algunes bones pràctiques per escollir noms d'identificadors clars i efectius:

-   **Sigueu descriptius, no críptics**: Preferiu `nombre_dies_vacances` sobre `ndv` o `n`.

-   **Useu noms pronunciables**: `data_creacio` és millor que `dtcr`. Si no podeu pronunciar-lo en una conversa, probablement és un mal nom.

-   **Eviteu abreviatures innecessàries**: `client` és millor que `cli`, `usuari` millor que `usr`. Les excepcions són abreviatures universalment acceptades com `id`, `url`, `html`.

-   **Useu noms cercables**: Els identificadors d'una sola lletra com `i`, `j`, `k` només són acceptables en bucles curts. Per a qualsevol altra cosa, useu noms que es puguin buscar fàcilment al codi.

-   **El context importa**: En un mètode `Client.obtenir_adreca()` podeu usar simplement `carrer` i `ciutat`, perquè el context (dins de Client) ja és clar. No cal dir `carrer_del_client`.

-   **Useu infinitius per a accions**: Les accions fan coses, així que els seus noms haurien de començar amb verbs: `escriure_preu`, `obtenir_usuari`, `validar_email`, `guardar_dades`.

-   I per les funcions???

-   **Useu substantius per a variables**: Les variables representen coses: `preu_total`, `llista_clients`, `data_naixement`.

-   **Useu substantius per a classes**: Les classes representen entitats o conceptes: `Usuari`, `Factura`, `BaseDeDades`.

-   **Sigueu consistents**: Si useu `obtenir_` per a accessors en una classe, no utilitzeu `agafar_` o `recuperar_` en una altra. La consistència redueix la càrrega cognitiva.

De totes maneres, hi ha alguns casos especials on es poden seguir convencions específiques per millorar la claredat:

-   **Longitud proporcional a l'abast**: Variables amb abast molt limitat (com comptadors de bucle) poden tenir noms curts (`i`, `j`). Els paràmetres de funcions curtes que tracten dades abstractes poden ser més curts (`L`, `xs`). En canvi, variables globals (ai!) o amb abast ampli necessiten noms més descriptius.

-   **Booleans**: Useu prefixos com `es_`, `te_`, `pot_`, `esta_` per deixar clar que és una condició:

    ```python
    es_valid = True
    te_permisos = False
    pot_editar = user.es_administrador()
    esta_actiu = account.status == 'actiu'
    ```

-   **Col·leccions**: Useu plurals per indicar que contenen múltiples elements:

    ```python
    usuaris = []
    preus = [10.5, 20.0, 15.75]
    codis_postals = {'08001', '08002'}
    ```

-   **Iteradors**: En bucles, el singular de la col·lecció és ideal:

    ```python
    for usuari in usuaris:
        print(usuari.nom)

    for preu in preus:
        total += preu
    ```

**Recordeu:**

-   Els identificadors són documentació: escolliu noms que expliquin clarament la seva intenció.
-   Seguiu les convencions de nomenclatura del llenguatge (PEP 8 per a Python).
-   Useu noms pronunciables i cercables que facilitin la comunicació i el manteniment.
-   Prioritzeu claredat sobre brevetat.
-   Però no ignoreu l'abast i el context per ajustar la longitud i detall dels noms.
-   Sigueu consistents en tot el projecte: si comenceu amb una convenció, mantingueu-la.
-   Useu verbs per a funcions i substantius per a variables i classes.
-   Adapteu la longitud del nom a l'abast: noms curts per a àmbits locals, noms descriptius per a àmbits amplis.

### Errors freqüents en identificadors

-   **Usar abreviatures crípticas**: `calc_pt_c_imp` en lloc de `calcular_preu_total_amb_impostos`.

-   **Noms d'una sola lletra fora de contexte**: Usar `x`, `y`, `z` per a variables importants amb abast ampli.

-   **Noms massa genèrics**: `dades`, `info`, `valor`, `cosa`, `aux`, `temp` no diuen res sobre què contenen realment.

-   **Incloure el tipus en el nom**: `llista_usuaris`, `string_nom` (les anotacions de tipus ja indiquen el tipus).

-   **Noms enganyosos**: Un identificador que suggereix una cosa però fa una altra (per exemple, `obtenir_usuari()` que crea un usuari si no existeix).

-   **No seguir les convencions**: Barrejar `camelCase` i `snake_case`, o usar majúscules on no toca.

-   **Noms massa llargs**: `calcular_el_preu_total_de_la_comanda_incloent_tots_els_impostos_aplicables` és excessiu.

-   **Redundància innecessària**: `usuari_usuari`, `persona_nom` (si ja està dins d'un context de Persona).

-   **No actualitzar noms en refactoritzar**: Mantenir un nom antic que ja no reflecteix el que fa la variable o funció després de canvis.

## Resum

Vet aquí un resum dels principis clau que s'han tractat en aquesta lliçó i que són importants de retenir per escriure codi net i mantenible:

-   Programar per a persones: el codi es llegeix més vegades que s'escriu, prioritzant claredat per facilitar col·laboració i manteniment.

-   Codi autodocumentat: utilitzar noms descriptius i estructures clares per evitar comentaris innecessaris i fer que el codi s'expliqui sol.

-   Comentaris per al "per què": reservar-los per decisions complexes, limitacions o referències externes, evitant redundàncies amb el codi.

-   Responsabilitat única en funcions: cada funció ha de fer una sola cosa, tota i bé, sense efectes secundaris ocults.

-   Nivells d'abstracció consistents: mantenir operacions al mateix nivell dins d'una funció per millorar la llegibilitat.

-   Funcions curtes: idealment menys de 10-20 línies, descomponent-les si són massa llargues per facilitar el testing.

-   Especificacions com a contractes: incloure precondicions (entrades vàlides) i postcondicions (resultats esperats), sense revelar implementació.

-   Identificadors descriptius: utilitzar verbs per funcions, substantius per variables, evitant abreviatures i seguint convencions com snake_case.

-   Evitar paràmetres excessius: agrupar-los en objectes si n'hi he més de tres o quatre, i evitar booleans que indiquin fluxos diferents.

-   Consistència en nomenclatura: mantenir uniformitat en tot el projecte per reduir confusió i millorar la cerca i comunicació.

Evidentment, tots aquests principis són guies generals i poden haver-hi excepcions segons el context.

> _Learn the rules like a pro, so you can break them like an artist._ — Pablo Ruiz Picasso

<Autors autors="jpetit jordic"/>
