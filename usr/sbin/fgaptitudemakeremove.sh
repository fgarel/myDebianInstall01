#!/bin/sh
#

# script pour creer un script de desinstallation reinstallation d'un ensemble de paquets
# en entree, on fournit un fichier contenant une liste de paquets
# chacun des paquets de cette liste est associé à un numero d''ordre'

# usage :
# fgaptitudemake.sh gis.txt
#

# si on a un 0 en 2d champ, aors on ne force pas
# si on a un 1 en 2d chammp, alors on accepte
# si on a un 0 en 4ème champ, alors on ne visualise pas
# si on a un 1 en 4ème champ, alors on visualise
#cut $1 -d, -f1,2,3,4,5 | sort -r | cut -d, -f2,3,4,5 | \
#    sed -r \
#        -e 's/;/ /g' \
#        -e 's/\/experimental//g' \
#        -e 's/^0,(.*),(0|1),(.*)$/  echo \"Suppression de \1\"\n  echo \"\3\"\n  aptitude -q2 remove \1\n  aptitude -q2 -y purge \1\n/'

# explication de l'expression reguliere
# [^;] signifie tous les caractères saus le ;
# ^([^;]*) le premier groupe va contenir tout le début de la chaine jusqu'a ce qu'il trouve un ;
# ;? le ; est optionnel : il y en a 0 ou 1
# (.*)$ le second groupe est le restant de la ligne
cut $1 -d";" -f1,2,3,4,5 | sort -r | cut -d";" -f2,3,4,5 | \
    sed -r \
        -e 's/\/experimental//g' \
        -e 's/^([^;]*);?(.*)$/  echo \"Suppression de \1\"\n  echo \"\2\"\n  echo y | aptitude remove \1 1> \/dev\/null\n  echo y | aptitude purge \1 1 > \/dev\/null\n/'
