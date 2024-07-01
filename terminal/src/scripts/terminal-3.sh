#% rm -rf ~/Demo
#% cp -r ~/Projectes/book/pages/scripts/terminal-3.dir ~/Demo

# Hola de nou!

#
# Aquesta sessió presenta algunes comandes per processar fitxers de
# text.
#

cd Demo

ls

#
# Com ja hem vist, el programa 'cat' mostra fitxers.
#

cat pelis.txt

#
# El programa 'tac' ('cat' del revés) mostra fitxers del revés:
#

tac pelis.txt

#
# El programa 'wc' (word count) mostra el recompte de línies,
# paraules i caràcters d'un o més fitxers:
#

wc pelis.txt

#
# Així doncs, 'pelis.txt' conté 15 línies, 57 paraules i
# 300 caràcters.

#
# 'wc' pot rebre les opcions '-l', '-w', i/o '-c' per ensenyar
# només el nombre de línies, paraules i caràcters, respectivament.
#
# Per exemple:
#

wc -l pelis.txt

#
# El programa 'head' (display first lines) mostra les primeres
# línies (10, per defecte) dels fitxers que li donem.
# El nombre de línies a mostrar es pot passar com una opció:
#

head -5 pelis.txt


#
# El programa 'tail' (display last lines) fa el mateix pel final:
#

tail -5 pelis.txt


#
# Per mostrar en ordre alfabètic les línies d'un fitxer de text es
# pot usar la comanda 'sort' (sort lines of text):
#

sort pelis.txt


#
# El fitxer 'pelis.txt' no s'ha modificat, només
# s'han mostrat les seves línies en ordre.

#
# Per últim, el programa 'grep' (pattern searcher) cerca un patró
# dins d'un fitxer i en mostra les línies on apareix.
#
# Per exemple, busquem el patró 'War' al fitxer de pel·licules:
#

grep War pelis.txt


#
# Si volem ignorar majúscules i minúscules, usem la opció '-i':
#

grep -i THE pelis.txt

#
# Els patrons de 'grep' poden ser expressions regulars molt més
# complexes. Feu 'man grep' per saber-ne més.


#
# A reveure!
#


