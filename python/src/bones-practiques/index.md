# Bones pràctiques per escriure programes

<img src='./bones-practiques.png' style='height: 8em; float: right; margin: 2em 0em 0em 2em;'/>

Aquesta lliçó presenta bones pràctiques per procurar escriure codi de qualitat més enllà de la seva correctesa.

Gràcies en aquestes bones pràctiques, aprendreu a organitzar millor els vostres programes, escollir bons noms per a variables i funcions, i escriure especificacions clares per tal que el vostre codi sigui llegible i mantenible en el futur.

## Importància de la qualitat del codi

> _Any fool can write code that a computer can understand. Good programmers write code that humans can understand._ — **Martin Fowler**

> _Code is read much more often than it is written, so plan accordingly._ — **Guido van Rossum**

Escriure codi no és només fer que l'ordinador faci el que volem. És crear quelcom que altres persones (inclòs el vostre jo del futur) hauran de llegir, entendre i modificar. Un programa que funciona però és difícil d'entendre és com un llibre escrit en un idioma que ningú no pot desxifrar: té informació valuosa però és pràcticament inútil.

En aquest sentit, és fonamental recordar que programem per a persones, no només per a màquines. El codi que escrivim avui serà llegit, revisat i transformat moltes vegades al llarg de la seva vida útil. Per això, la qualitat del codi es converteix en un pilar essencial del desenvolupament de programari sostenible.

Un codi de qualitat s'entén amb facilitat, permetent que qualsevol programador el pugui llegir com si fos un text ben escrit. Aquesta claredat facilita la col·laboració entre membres dels equips i accelera la incorporació de nous desenvolupadors als projectes. A més, un bon codi es modifica sense por: els canvis no provoquen errors inesperats gràcies a una estructura clara i ben organitzada i manca d'efectes secundaris.

La qualitat també es reflecteix en la capacitat d'extensió del codi. Un disseny ben pensat permet afegir noves funcionalitats de manera natural, sense haver de reescriure seccions senceres del projecte. Finalment, i potser més important, el codi de qualitat es manté al llarg del temps: no es converteix en un malson incomprensible després de sis mesos, sinó que roman llegible, mantenible i adaptat a les necessitats canviants del projecte.

## Continguts

-   [**Ús d'identificadors**](us-identificadors.md): Comencem pel més bàsic al nivell més petit: escollir bons noms. Els identificadors són el vocabulari del vostre codi i la primera línia de documentació. Aquest apartat us guiarà per les convencions de nomenclatura, els principis per crear noms descriptius i pronunciables, i com adaptar la longitud i detall dels noms segons el context. Descobrireu que invertir temps en trobar el nom perfecte és el primer pas per fer que el codi s'expliqui per si mateix.

-   [**La millor documentació és el codi mateix**](codi-autodocumentat.md): El següent pas és fer que tot el codi sigui tant autodocumentat com sigui possible. Descobrireu per què els noms descriptius combinats amb una estructura clara són més valuosos que pàgines de comentaris, i com transformar codi confús en codi que qualsevol persona pot entendre sense necessitat d'explicacions addicionals.

-   [**Ús de comentaris**](us-comentaris.md): Tot i que el codi hauria de ser autodocumentat, els comentaris tenen el seu lloc quan s'utilitzen correctament. Aquí aprendreu quan i com escriure comentaris que aportin valor real: explicant el "per què" de decisions complexes, documentant limitacions conegudes, o referenciant fonts externes. També veurem els errors més comuns que converteixen els comentaris en un problema en lloc d'una ajuda.

-   [**Estructuració**](estructuracio.md): Estructurar el codi correctament en diferents funcions és importantíssim. Aquest apartat se centra en com dividir la complexitat en peces manejables: funcions que fan una sola cosa, la fan tota i la fan bé. Aprendreu a identificar quan una funció és massa llarga, com mantenir nivells d'abstracció consistents, i per què evitar efectes secundaris ocults és crucial per a un codi predictible i testejable.

-   [**Especificacions**](especificacions.md): Les funcions ben dissenyades necessiten contractes clars. Les especificacions defineixen exactament què fa una funció sense revelar com ho fa, establint les responsabilitats entre qui l'utilitza i qui la implementa. Veureu com escriure precondicions i postcondicions completes i inequívoques, i per què una bona especificació és essencial per al treball en equip i el manteniment d'un porjecte de software a llarg termini.

Tots aquests principis treballen conjuntament per aconseguir el mateix objectiu: codi que sigui fàcil de llegir, entendre i mantenir. Recordeu que programar és, sobretot, comunicar-vos amb altres persones (inclòs el vostre jo del futur).

Evidentment, tots aquests principis són guies generals i poden haver-hi excepcions segons el context.

> _Learn the rules like a pro, so you can break them like an artist._ — **Pablo Ruiz Picasso**

<Autors autors="jpetit jordic"/>
