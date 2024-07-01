#% rm -rf ~/Programa1

#
# Hola!
#
# En aquesta primera demostració anem a compilar i executar
# el programa que hem escrit anteriorment.
#

# Sempre és un bon costum tenir un directori per cada projecte.
# Utilitzem la comanda 'mkdir' per crear un directori 'Programa1':
#

mkdir Programa1

#
# La comanda 'cd' serveix per canviar al directori especificat:
#

cd Programa1

#
# Per no haver de copiar a mà tot el programa,
# el descarragarem directament de la web de curs
# amb la comanda 'wget':
#

wget https://lliçons.jutge.org/programes/p1.cc

#
# La comanda 'ls' mostra els fitxers del directori actiu:
#

ls

#
# Com podeu veure, ja hi tenim el fitxer 'p1.cc'.
#


#
# Amb la comanda 'cat' podem veure el contingut d'un fitxer:
#

cat p1.cc

#
# Per compilar el programa p1.cc utilitzarem la comanda 'g++'
# de la forma següent:
#

g++ -Wall -std=c++11 -O2 p1.cc -o p1.exe

#
# Com que no hi ha hagut cap error, ja tenim el programa llest:
#

ls

#
# Per executar un programa cal escriure el seu nom precedit de ./
#

./p1.exe

3

12

#
# Ha funcionat!
#
# El programa ha esperat que li donguéssim dos valors (3 i 12)
# i n'ha escrit el seu producte (36).
#

# Tornem-ho a provar:
#

./p1.exe
2891
4591

#
# Això és tot! Ara proveu-ho de fer vosaltres.
#


