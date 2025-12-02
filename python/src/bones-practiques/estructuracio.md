# Estructuració

> _Controlling complexity is the essence of computer programming._ — Brian Kernighan

> _Functions should do one thing. They should do it well. They should do it only._ — Robert C. Martin (Uncle Bob)

Descompondre un programa en funcions petites i ben definides és un dels principis fonamentals de la programació de qualitat. Cada funció hauria de fer **una sola cosa**, **fer-la tota** i **fer-la bé**. Aquesta filosofia no només fa el codi més fàcil de llegir i entendre, sinó que també facilita la detecció d'errors, el testing i la reutilització.

Penseu en les funcions com en caixes negres que amaguen complexitat: l'usuari només necessita saber què fan, no com ho fan. Aquesta abstracció permet treballar en diferents nivells de detall i construir programes complexos a partir de peces simples i comprensibles.

Un programa ben descompost es llegeix com un text narratiu: les funcions de més alt nivell expliquen "què" es fa, mentre que les de més baix nivell expliquen "com" es fa. Aquesta jerarquia natural ajuda a entendre el codi de manera progressiva.

El mecanisme bàsic per aconseguir aquesta descomposició és definir funcions que encapsulin tasques específiques. A continuació, veurem alguns principis i bones pràctiques per estructurar el vostre codi mitjançant funcions.

## Qualitats que ha de tenir una bona funció

Aquesta és una llista de les característiques que hauria de tenir una funció ben dissenyada:

-   **Claredat i simplicitat:** La funció ha de ser fàcil d'entendre i fer només una cosa concreta.
-   **Nom descriptiu:** El nom ha d'explicar clarament què fa la funció sense necessitat de mirar el codi intern.
-   **Bona modularitat:** Ha d'estar ben separada d’altres funcionalitats i no dependre innecessàriament d’altres parts del codi.
-   **Paràmetres i retorn coherents:** Ha de rebre només els paràmetres estrictament necessaris i retornar un valor de manera clara i previsibile.
-   **Reutilitzabilitat:** Ha de ser prou general perquè es pugui utilitzar en diversos contexts sense duplicar codi.
-   **Sense efectes secundaris:** Ha de modificar només el que és necessari i evitar canvis inesperats en l'estat global o en els paràmetres d'entrada.
-   **Mida adequada:** Ha de ser prou curta perquè es pugui entendre d'un cop d'ull, idealment mai més de 20-30 línies.

## Funcions que no fan tot el que han de fer

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

## Principi de responsabilitat única

Cada funció hauria de tenir una única raó per existir, és a dir, una única responsabilitat. Si una funció fa més d'una cosa, probablement s'hauria de dividir en funcions més petites.

Aquest és un exemple d'una funció que fa massa coses:

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

A continuació teniu una versió millorada que segueix el principi de responsabilitat única:

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
    return validar_nom(nom) and validar_email(email) and validar_edat(edat)

def validar_nom(nom: str) -> bool:
    """Verifica que el nom sigui vàlid."""
    return nom is not None and len(nom) >= 2

def validar_email(email: str) -> bool:
    """Verifica que l'email tingui un format vàlid."""
    # TODO: millorar validació, això és molt simplista
    return '@' in email and '.' in email.

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

## Nivells d'abstracció

Barrejar operacions d'alt nivell amb detalls de baix nivell fa el codi difícil de seguir. És convenient mantenir nivells d'abstracció consistents dins d'una mateixa funció.

Aquí teniu un exemple d'una funció que genera un informe de vendes, però barreja la lògica d'alt nivell amb càlculs detallats:

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

Aquesta és una manera de millorar-la separant els càlculs detallats en funcions específiques i obtenir asbtraccions consistents:

```python
def generar_informe_vendes(data_inici: date, data_fi: date) -> str:
    """Genera un informe de vendes."""
    vendes = obtenir_vendes_periode(data_inici, data_fi)
    total = calcular_total_vendes(vendes)
    informe = crear_informe(data_inici, data_fi, total)
    informe += f"\nTotal vendes: {total:.2f}€"
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

## Paràmetres a les funcions

Les funcions amb molts paràmetres són difícils d'entendre i utilitzar. Si una funció necessita més de 3-4 paràmetres, repenseu-la o considereu agrupar-los en una estructura.

Per exemple, aquesta funció té massa paràmetres:

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

Però no resulta difícil de millorar agrupant les dades relacionades en dataclasses:

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

El fet d'agrupar dades relacionades millora la llegibilitat i facilita l'extensió futura.

## Paràmetres booleans

Els paràmetres booleans sovint indiquen que la funció fa dues coses diferents. És millor dividir-la en dues funcions.

Per exemple, aquesta funció processa una comanda de manera diferent segons si és urgent o no:

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

En aquest cas, és doncs millor oferir dues funcions separades:

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

## Funcions sense efectes secundaris

Un **efecte secundari** és qualsevol modificació que fa una funció fora del seu àmbit local, com canviar variables globals, modificar paràmetres, escriure a fitxers o mostrar informació per pantalla.

Els efectes secundaris fan el codi més difícil de comprendre, provar i depurar perquè el comportament d'una funció depèn o afecta elements externs que no són evidents en la seva crida. Per això, una funció hauria de fer exactament el que el seu nom indica, sense efectes secundaris ocults.

Per exemple, aquesta funció valida les credencials d'un usuari tal com promet, però també actualitza la data de l'última connexió, un efecte secundari inesperat:

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

Seria doncs millor separar les responsabilitats per evitar aquest efecte secundari:

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

## Longitud de les funcions

Les funcions haurien de ser curtes. Una bona regla és que haurien de caber en una pantalla sense necessitat de fer scroll. Si una funció és massa llarga, probablement fa massa coses i s'hauria de descompondre en més funcions.

Com a guia general:

-   **0-10 línies**: Ideal
-   **10-20 línies**: Acceptable si existeix una bona raó per gestionar la complexitat
-   **20-30 línies**: Revisar si es pot descompondre
-   **30+ línies**: Probablement fa massa coses

Evidentment, la longitud no és l'únic criteri. Una funció pot ser curta però confusa, o llarga però clara. Però en general, les funcions curtes són més fàcils de llegir i entendre.

## Exemple complet de bona estructuració

```python
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

def processar_compra(client: Client, articles: list[Article]) -> float:
    """Processa una compra i retorna l'import total."""
    if not validar_compra(articles):
        raise ValueError("Compra invàlida")

    subtotal = calcular_subtotal(articles)
    descompte = calcular_descompte(subtotal, client)
    total = subtotal - descompte

    enviar_confirmacio(client, articles, total)

    return total

def validar_compra(articles: list[Article]) -> bool:
    """Verifica que la compra sigui vàlida."""
    return len(articles) > 0 and all(es_article_valid(a) for a in articles)

def es_article_valid(article: Article) -> bool:
    """Verifica que un article sigui vàlid."""
    return article.quantitat > 0 and article.preu >= 0

def calcular_subtotal(articles: list[Article]) -> float:
    """Calcula el subtotal de la compra."""
    return sum(calcular_preu_article(a) for a in articles)

def calcular_preu_article(article: Article) -> float:
    """Calcula el preu total d'un article."""
    return article.preu * article.quantitat

def calcular_descompte(subtotal: float, client: Client) -> float:
    """Calcula el descompte aplicable al client."""
    return subtotal * client.descompte_vip

def enviar_confirmacio(client: Client, articles: list[Article], total: float) -> None:
    """Envia email de confirmació de compra al client."""
    missatge = crear_missatge_confirmacio(client, articles, total)
    enviar_email(client.email, missatge)

def crear_missatge_confirmacio(
    client: Client,
    articles: list[Article],
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

## Principis i bones pràctiques

-   Cada funció hauria de fer una sola cosa, fer-la tota, i fer-la bé (principi de responsabilitat única).
-   Manteniu les funcions curtes: si no cap en una pantalla, probablement fa massa coses.
-   Totes les operacions dins d'una funció haurien d'estar al mateix nivell d'abstracció.
-   Minimitzeu el nombre de paràmetres: més de tres o quatre indica que potser cal agrupar-los o és senyal d'un disseny deficient.
-   Eviteu paràmetres booleans que controlin el flux: millor dividir en dues funcions separades.
-   Les funcions han de fer exactament el que el seu nom indica, sense efectes secundaris ocults.
-   Un codi ben descompost es llegeix com un text narratiu de dalt a baix.
-   La descomposició facilita el testing: funcions petites són més fàcils de provar.

## Errors freqüents

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

<Autors autors="jpetit jordic"/>
