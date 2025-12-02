# Ús d'identificadors

> _There are only two hard things in Computer Science: cache invalidation and naming things._ — **Phil Karlton**

> _You should name a variable using the same care with which you name a first-born child._ — **Robert C. Martin**

Els identificadors (noms de variables, funcions, classes, etc.) són el vocabulari del vostre codi. Són la primera línia de documentació i la més important: un bon nom pot fer que el codi s'expliqui per si mateix, mentre que un mal nom pot fer-lo incomprensible. Recordeu que el codi es llegeix moltes més vegades del que s'escriu, i uns identificadors clars faciliten enormement aquesta lectura.

## Importància dels bons identificadors

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

## Convencions de nomenclatura en Python

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

## Principis per escollir bons identificadors

Aquestes són algunes bones pràctiques per escollir noms d'identificadors clars i efectius:

-   **Sigueu descriptius, no críptics**: Preferiu `nombre_dies_vacances` sobre `ndv` o `n`.

-   **Useu noms pronunciables**: `data_creacio` és millor que `dtcr`. Si no podeu pronunciar-lo en una conversa, probablement és un mal nom.

-   **Eviteu abreviatures innecessàries**: `client` és millor que `cli`, `usuari` millor que `usr`. Les excepcions són abreviatures universalment acceptades com `id`, `url`, `html`.

-   **Useu noms cercables**: Els identificadors d'una sola lletra com `i`, `j`, `k` només són acceptables en bucles curts. Per a qualsevol altra cosa, useu noms que es puguin buscar fàcilment al codi.

-   **El context importa**: En un mètode `Client.obtenir_adreca()` podeu usar simplement `carrer` i `ciutat`, perquè el context (dins de Client) ja és clar. No cal dir `carrer_del_client`.

-   **Useu verbs infinitius per a accions**: Les funcions fan accions, així que els seus noms haurien de començar amb verbs infinitius: `calcular_preu()`, `obtenir_usuari()`, `validar_email()`, `guardar_dades()`, ...

-   **Useu verbs substatius per a funcions pures**: En el cas de funcions pures (que només calculin valors a partir de les seves entrades), també té substantius que representin el valor retornat: `sin()`, `preu_total()`, `mitjana()`, ...

-   **Useu substantius per a variables**: Les variables representen coses o valors: `preu_total`, `llista_clients`, `data_naixement`.

-   **Useu substantius per a classes**: Les classes representen entitats o conceptes: `Usuari`, `Factura`, `BaseDeDades`.

-   **Sigueu consistents**: Si useu `obtenir_` per a accessors en una classe, no utilitzeu `agafar_` o `recuperar_` en una altra. La consistència redueix la càrrega cognitiva.

De totes maneres, hi ha alguns casos especials on es poden violar les convencions anteriors per millorar la claredat:

-   **Longitud proporcional a l'abast**: Variables amb abast molt limitat (com comptadors de bucle) poden tenir noms curts (`i`, `j`). Els paràmetres de funcions curtes que tracten dades abstractes poden ser més curts (`L`, `xs`). En canvi, variables globals o amb abast ampli necessiten noms més descriptius.

-   **Booleans**: Useu prefixos com `es_`, `te_`, `pot_`, `esta_` per deixar clar que és una condició:

    ```python
    es_valid = True
    te_permisos = False
    pot_editar = user.es_administrador()
    esta_actiu = account.status == 'actiu'
    ```

    No useu noms negats per a booleans: En lloc de `no_fa_fred`, useu `fa_calor` i invertiu la lògica si cal.

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

    suma = sum([article.preu for article in articles])
    ```

## Recordeu

-   Els identificadors proporcionen informació: escolliu noms que expliquin clarament la seva intenció.
-   Seguiu les convencions de nomenclatura del llenguatge (PEP 8 per a Python).
-   Useu noms pronunciables i cercables que facilitin la comunicació i el manteniment.
-   Prioritzeu claredat sobre brevetat, però no ignoreu l'abast i el context per ajustar la longitud i detall dels noms.
-   Sigueu consistents en tot el projecte: si comenceu amb una convenció, mantingueu-la.
-   Useu verbs per a funcions i substantius per a variables i classes.
-   Adapteu la longitud del nom a l'abast: noms curts per a àmbits locals, noms descriptius per a àmbits amplis.

## Errors freqüents

-   **Usar abreviatures críptiques**: `calc_pt_c_imp` en lloc de `calcular_preu_total_amb_impostos`.
-   **Noms d'una sola lletra fora de context**: Usar `x`, `y`, `i`, `n` per a variables importants amb abast ampli.
-   **Noms massa genèrics**: `dades`, `info`, `valor`, `cosa`, `aux`, `temp` no diuen res sobre què contenen realment.
-   **Incloure el tipus en el nom**: `llista_usuaris`, `string_nom` (les anotacions de tipus ja indiquen el tipus).
-   **Noms enganyosos**: Un identificador que suggereix una cosa però fa una altra (per exemple, `obtenir_usuari()` que crea un usuari si no existeix).
-   **No seguir les convencions**: Barrejar `camelCase` i `snake_case`, o usar majúscules on no toca.
-   **Noms massa llargs**: `calcular_el_preu_total_de_la_comanda_incloent_tots_els_impostos_aplicables` és excessiu.
-   **Redundància innecessària**: `usuari_usuari`, `persona_nom` (si ja està dins d'un context de Persona).
-   **No actualitzar noms en refactoritzar**: Mantenir un nom antic que ja no reflecteix el que fa la variable o funció després de canvis.

<Autors autors="jpetit jordic"/>
