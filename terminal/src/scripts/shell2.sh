#En aquesta sessio experimentarem amb alguns programes molt utils per
#la lectura i escriptura de fitxers.

#El programa cat serveix per mostrar fitxers pel terminal
#
#Li hem de proporcionar un paràmetre amb el nom dels fitxers a mostrar.
ls

cat pelis

#Un altre programa util es wc, acrònim de word count. Aquest programa ens
#mostra el recompte de linies, paraules i lletres del text que li passem.
#
#Per exemple:
wc pelis

#Tambe podem fer servir els paràmetres l, w, c, per ensenyar només el nombre de
#linies, paraules i caràcters respectivament, de la seguent manera:
wc -l pelis


#Altres programes molt útils son head i tail, que ens mostren cert nombre de
#linies (10 per defecte) d'un fitxer.
#Els cridem de la següent manera:
head -5 pelis


tail -8 pelis


#Per mostrar les primeres 5 i últimes 8 línies del fitxer pelis.

#Un altre programa molt útil és sort. Aquest programa ens mostra per pantalla
#el text, similarment a cat, però amb les línies en ordre alfabètic.

sort pelis

#Per últim el programa grep, que ens permet buscar un patró dins un text i 
#mostra les línies on apareix.
#
#Per comprovar-ho buscarem el patró Star en el fitxer pelis

grep Star pelis

#Si volem que ignori la capitalitat de les lletres hi hem d'afegir el paràmetre
#-i

grep -i star pelis

#Podem veure com ens mostra resultats en majúscules tot i haver escrit el patró
#en minúscula.



#Unaltre manera de passar fitxers en els programes és amb la redirecció:
#
#Utilitzem els caràcters < i > per especificar fitxers d'entrada i sortida per
#als programes.
#
#Per llegir un fitxer he de redireccionar la entrada del programa al fitxer

grep Star < pelis

#Similarment per la sortida:

grep Star < pelis > resultat

#Ara sembla que no ha passat res, però si mirem dins el directori veiem
#que la redirecció ha creat un nou fitxer resultat, on ha escrit la sortida
#del programa grep

ls

cat resultat

#Una funció similar és el pipe, escrit amb un |
#
#Aquest caràcter li indica a la consola que ha de redireccionar
#la sortida d'un programa a l'entrada d'un altre programa.
#Els programes encadenats per pipes s'executen un radere l'altre
#d'esquerra a dreta fent servir com a entrada la sortida del programa anterior
#
#D'aquesta manera, podem fer servir la seguent comanda per contar el nombre
#de pelis que contenen la paraula Star:

cat pelis | grep "Star Wars" | wc -l

#La comanda que acabem d'executar fa el següent:
#El programa cat llegeix el fitxer pelis i el passa a l'entrada de grep
#

#El programa grep escriu només les línies que contenen
#les paraules Star Wars, i la seva sortida és utilitzada com a entrada de wc
#

#El programa wc amb paràmetre -l ens mostra el recompte de línies que té a
#la seva entrada. Com que no hem redireccionat la seva sortida,
#aquesta es mostra per pantalla.

#Així acaba la segona sessió de Terminal