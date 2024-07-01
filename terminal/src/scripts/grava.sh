#!/usr/local/bin/bash

# Script per en Jordi per gravar vídeos.
# Com a paràmetre, el nom del vídeo (sense extensió)

cd
touch .llicons
~/Projectes/book/bin/asciiscript.py ~/Projectes/book/pages/scripts/$1.sh ~/Projectes/book/pages/cinema/$1.json
rm .llicons
