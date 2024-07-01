# Hola!

# El terminal (o cònsola) és un programa que executa les 
# nostres comandes en el sistema operatiu.
# 
# Cada programa del nostre ordinador té un nom, i podem executar els programes
# escrivint el seu nom en el terminal.
#
# Per exemple, 'mkdir' (make directories) és el programa que crea directoris.
# Per executar-lo, cal escriure el seu nom seguit del nom del directori
# que volem crear:

mkdir hola
 
# També podem executar el programa 'ls' (list directory contents) per veure 
# tots els fitxers i directoris del directori actual.

ls

# Com podem veure, entre d'altres, hi ha la nova carpeta que hem creat.
# 
# Els directoris o directoris tenen el caràcter / al final del nom.
# Els que no ho tenen son fitxers, com per exemple programes o documents.
#
# Podem moure'ns a una carpeta amb el programa "cd" (change directory).

cd hola

# Ara veiem que el text que hi ha a l'esquerra d'on escrivim, el prompt
# ha canviat. Això es degut a que el prompt ens indica el directori on
# ens trobem actualment.

# En linux, el directori per defecte on s'obre el terminal es el HOME,
# des del qual podem accedir a la carpeta Desktop, Downloads, Documents, etc.

# El directori anterior, el pare, sempre té el nom '..'. Per tant si executo
cd ..
# puc comprovar que el prompt ha anat cap amunt en la jerarquia de directoris
# i torna a ser al directori anterior. Comprovem-ho:
ls

# Puc esborrar un directori, si és buit, utilitzant la comanda rmdir

rmdir hola

ls

# D'acord. 

# Hi ha molts programes que podem fer servir en el terminal.
#
# Per exemple, el programa 'cal' (displays a calendar) ensenya el 
# calendari del mes actual:

cal

# Cada programa sol tenir una documetació que explica com es pot fer servir
# i quines opcions accepta.
#
# Per veure el manual de qualsevol programa hem dexecutar el programa
# man i indicar el nom del programa que volem veure. Per exemple:

man cal






q

# Mirant el manual hem vist que el programa cal també accepta un mes concret
# com a paràmetre, per exemple, si volem veure el calendari de
# Setembre de 1714 hem d'executar

cal 9 1714



# Des del terminal també es poden llegir i escriure fitxers.
#
# De moment veurem com es llegeixen. Utilitzarem el programa 'cat'
# (concatenate and print files)
# Si em moc a la carpeta Prog podre llegir algun programa.

cd Prog

ls


# Ara que he vist els continguts d'aquesta carpeta uc utilitzar el programa cat
# per llegir el contingut del fitxers que no son directoris


cat hola.cc

# Ara veiem que l'arxiu hola.cc conte el codi en c++ de "Hello World".
# Si volguessim copiar aquest fitxer faríem servir la comanda "cp", de copy.
# Aquest programa espera dos paràmetres, el nom de l'arxiu que volem copiar
# i la localització on el volem copiar. Per exemple:

cp hola.cc ../hola2.cc

# Amb aquesta comanda li hem dit que volem copiar l'arxiu hola.cc a la carpeta
# pare, amb el nom de hola2.cc. Ho comprovem

cd ..

cat hola2.cc



# Sembla que l'arxiu es el mateix. Si volem comprovar que dos arxius siguin
# iguals podem fer servir la comanda diff, de differences.
# Aqeusta comanda que espera el nom del dos arxius que volem comparar.

diff hola2.cc Prog/hola.cc

# Com que no hi ha cap diferència entre els fitxers el programa no diu res.

# Si volem canviar el nom d'un fitxer hem de fer servir la comanda mv, de move.
# Aquest programa mou els continguts del fitxer especificat a un nou fitxer
# amb el nom desitjat.

mv hola2.cc hola3.cc

ls

cat hola3.cc


# Hem comprovat que el fitxer hola2.cc ha desaparegut i ha aparegut l'hola3.cc

# Si volem esborrar aquest fitxer hem fer servir el programa "rm", de remove.
# Aquest programa esborra un arxiu PERMANENTMENT, no l'envia a la paperera.
# S'ha de anar amb cura perque les seves accions son irreversibles.

rm hola3.cc

ls

# Així conclou la primera sessio de terminal.
