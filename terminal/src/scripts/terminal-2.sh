#% rm -rf ~/Demo
#% cp -r ~/Projectes/book/pages/scripts/terminal-2.dir ~/Demo

# Hola de nou!

#
# En informàtica, és molt habitual manegar directoris i fitxers.

#
# Potser esteu acostumats a veure els directoris com a carpetes i
# els arxius com a icones, i a moure'ls amunt i avall amb el ratolí
# en entorns gràfics com el Finder (Mac) o l'Explorer (Windows).
# Però tenir desimboltura a gestionar-los des de la línia de comandes
# us serà molt útil quan programeu.

#
# Per moure'ns per la jerarquia de directoris fem servir la comanda
# 'cd' (change directory) donant-li com a paràmetre el nom del
# directori on ens volem moure.

#
# Provem-ho amb un directori 'Demo' que ja hem preparat per a
# aquesta demostració:
#

cd Demo

#
# Veieu com el prompt ha canviat? Ara el directori actiu ja no és
# el directori principal (~) sinó el directori Demo.

#
# Amb la comanda 'ls' (list directory contents) podem veure el
# contingut d'un directori:
#

ls


#
# Si a la comanda 'ls' li afegim la opció '-la', ens donarà més
# informació, incloses les mides i hores de creació de cada fitxer:
#

ls -la

#
# És molt habitual que l'efecte de les comandes es puguin modificar
# amb paràmetres precedits per un guió (opcions). Si executeu
# 'man ls' podreu trobar totes les opcions de 'ls'.

#
# Anem a tafanejar en el directori 'Documents':

#
# Es pot fer des del directori actual, usant 'ls' amb el nom del
# directori que volem inspeccionar:

ls Documents

#
# Una manera alternativa és entrar en el directori 'Documents' i
# després mirar què hi ha:

cd Documents

ls


#
# Aquí trobem encara més directoris;
# entrem en el directori 'Cartes':
#

cd Cartes

ls

#
# Vaja... no hi ha res!

#
# Com podem pujar al directori superior a l'actual?
# Usant '..':
#

cd ..

#
# Lògicament, podem pujar un altre cop:
#

cd ..

ls

#
# Ja tornem a ser al directori 'Demo'.

#
# Els directoris es poden crear amb la comanda 'mkdir'
# (make directory) seguida del nom del directori a crear:
#

mkdir Escola

ls

#
# Els directoris es poden esborrar -si són buits- utilitzant la
# comanda 'rmdir' (remove directories):
#

rmdir Escola

ls


#
# Per veure el contingut d'un o més fitxers es pot usar
# la comanda 'cat' (concatenate and print files):
#

cat pelis.txt

cat llibres.txt

cat pelis.txt llibres.txt


#
# Quan es mostren diversos fitxers, es fa en ordre un rera
# l'altre.

#
# Per no haver d'escriure tant, ens podem referir a més d'un
# fitxer amb el comodí '*', que representa qualsevol text:
#

cat *.txt


#
# Esborrar fitxers és fàcil -potser massa!!! Es fa amb la
# comanda 'rm' (remove entries):
#

ls

rm pelis.txt

ls


#
# Compte: Amb 'rm' els fitxers no es poden recuperar, es perden
# definitivament!

#
# Què passaria si féssiu 'rm *'? Penseu-ho, però no ho proveu!!!

#
# 5 . . . . . 4  . . . . . 3  . . . . . 2  . . . . . 1 . . . . . 0!

#
# Doncs sí: esborraríeu tots els fitxers del directori actual.
#

#
# Els fitxers es poden copiar amb la comanda 'cp' (copy files).
# Aquesta comanda té dos paràmetres: el primer és el nom del fitxer
# original, i el segon és el nom del fitxer destí.
#

ls

cat llibres.txt

cp llibres.txt copia.txt

ls


cat copia.txt


#
# Compte: si el fitxer destí ja existeix, serà sobreescrit per la
# còpia del fitxer original.

#
# Ja veieu que la línia de comandes del terminal és per a valents!

#
# Es pot canviar el nom d'un fitxer amb la comanda 'mv' (move files):
#

ls

mv copia.txt llibres2.txt

ls


#
# L'anterior fitxer 'copia.txt' ara es diu 'llibres2.txt'.

#
# La comanda 'mv' també serveix per moure un fitxer de directori.
# Per fer-ho, s'ajunten els noms dels directoris amb barres (/):
#

ls

ls Documents/Cartes


#
# Com podem veure, al directori 'Documents/Cartes' (és a dir, al
# directori 'Cartes' dins del directori 'Documents') no hi ha cap
# fitxer de nom 'llibres2.txt'.

#
# Si ara fem
#

mv llibres2.txt Documents/Cartes

ls

#
# Aquí ja no hi ha el fitxer 'llibres2.txt'!
#

ls Documents/Cartes

#
# Està a 'Documents/Cartes'!


#
# Ara el tornarem a posar on estem:
#

mv Documents/Cartes/llibres2.txt .

ls


#
# El '.' vol dir "aquí", similarment a com '..'
# vol dir "el directori a sobre d'on estem".
# I recordeu que "~" vol dir el directori principal
# del vostre usuari.


#
# Doncs bé, això és tot per ara!
# Practiqueu aquestes comandes una mica pel vostre compte.
#
# Mireu de no esborrar cap fitxer important :-)
#
# I recordeu que podeu llegir el manual de cada comanda amb 'man'.
#


