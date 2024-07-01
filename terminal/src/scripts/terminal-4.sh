#% rm -rf ~/Demo
#% echo La còpia del directori 3 enlloc del 4 ÉS intencionada!
#% cp -r ~/Projectes/book/pages/scripts/terminal-3.dir ~/Demo

# Hola de nou!

# Aquesta sessió presenta com utilitzar redireccions al terminal.

cd Demo

#
# La majoria de programes del terminal es comuniquen a través
# de dos canals: el canal d'entrada i el canal de sortida.

#
# El canal d'entrada és per on els programes llegeixen les
# dades que han de tractar. Per defecte, és el teclat.

#
# El canal de sortida és per on els programes escriuen les
# dades que produeixen. Per defecte, és la finestra del terminal.

#
# Per indicar que un programa no ha de llegir o escriure pels
# canals per defecte, es poden utilitzar redireccions.
# Hi ha dos tipus de redireccions: redirecció a/desde fitxer
# i redirecció entre programes (`pipes`, canonades).

#
# Recordeu que la comanda `date` ens dóna l'hora i data actuals?

date

# Exacte!
#
# Si enlloc de voler veure la data i l'hora a la finestra del
# terminal, volem que ens quedin enmagatzemades en un fitxer anomenat
# `ara.txt` podem fer:

date > ara.txt

#
# En aquest cas, la sortida de la comanda `data` s'ha desat en el
# fitxer `ara.txt` perquè s'ha utilitzat l'operador `>` que
# redirecciona la sortida a un fitxer (penseu en > com una fletxa).
#
# Comprovem-ho:
#

ls

cat ara.txt

# Correcte: s'ha creat un fitxer que conté la sortida
# de la comanda que hem utilitzat.

#
# Això es pot fer amb qualsevol comanda:

cal > calendari.txt
ls
cat calendari.txt

# Falta extendre aques vídeo!!!

#
# Apa, adéu!
#
cowsay Adéu! | lolcat
