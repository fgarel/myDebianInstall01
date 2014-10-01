#!/bin/sh


# en cas de problème, il faut eventuellement nettoyé les listes
# qui ne peuvent pas etre mergées
echo "bfaptitudeupdate-preseed.sh :                 Update 1"

mkdir /var/log/bf 2> /dev/null

#aptitude clean
# si le problème est :
# Reading package lists... Error!
# E: Wow, you exceeded the number of versions this APT is capable of.
# E: Problem with MergeList /var/lib/apt/lists/archive.debian.org_debian-archive_debian_dists_sarge_main_binary-i386_Packages
# E: The package lists or status file could not be parsed or opened. 
# alors la solution est indiquée sur cette page :
# http://hydra.geht.net/tino/english/faq/debian/apt/aptlimit/

# mis dans un bloc if pour eviter de relancer cette install à chaque
#       fois...

# update
#aptitude update | grep -v "Ign" | grep -v "Atteint" 1> log.txt 2> erreur.txt
#cat log.txt | grep "Erreur"
#cat erreur.txt | grep ""
#aptitude update | grep -v "Ign" | grep -v "Atteint" &> /dev/null
#mkdir /var/log/fg
if [ ! -e /var/log/bf/bfaptitudeupdate-preseed-update.log ]
then
  echo "  Aptitude update"
  #rm -f /var/lib/apt/lists/partial/*
  #rmdir /var/lib/apt/lists/partial
  #rm -f /var/lib/apt/lists/*
  aptitude update 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeupdate-preseed-update.log
  echo "  ... tude update done"
fi


locale-gen en_US en_US.UTF-8 fr_FR fr_FR.UTF-8
dpkg-reconfigure locales


# installation du trousseau de clefs deb-multimedia-keyring
#if [ ! -e /var/log/fg/fgaptitudeupdate01-keyring.log ]
#then
#
#  echo "  Installation du trousseau de clefs deb-multimedia-keyring"
#  echo "Oui" | aptitude install deb-multimedia-keyring > /dev/null
#  #touch /var/log/fg/deb-multimedia-keyring.log
#  date +"%F %T" >> /var/log/fg/fgaptitudeupdate01-keyring.log
#
#  # apres avoir installe la clef, on refait un aptitude update
#  aptitude update 1> /dev/null 2> /dev/null
#  date +"%F %T" >> /var/log/fg/fgaptitudeupdate01-update.log
#
#fi

# resolution elegante du probleme d'installation du paquet man-db
#
# Le Probleme :
# D'après ce que je peux comprendre, a chaque fois qu'un paquet est installé
# la base de donnée "man" est mise à jour
# Pour une raison que j'ignore encore, (peut-etre tout simplement parce que
# cette base de données "man" ne peut pas être mise à jour ?),
# l'execution de preseed entraine plein d'erreurs provenant
# du paquet man-db
#
# La Solution :
# On retire donc ce paquet quand on execute à l'interieur du preseed : mandb01
# On l'installe quand on est à l'exterieur de preseed : mandb02
#
if [ ! -e /var/log/bf/bfaptitudeupdate00-mandb00.log ]
then
  # man-db est a installer apres reboot : ne fonctionne pas à l'interieur du preseed...
  # on le supprime donc dans un premier temps
  echo "  Suppression de man-db"
  echo y | aptitude remove man-db 1> /dev/null 2> /dev/null
  echo y | aptitude purge man-db 1> /dev/null 2> /dev/null
  echo y | aptitude purge "~c" > /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeupdate00-mandb00.log
  date +"%F %T" >> /var/log/bf/bfaptitudeupdate00-mandb01.log
fi

# Quand on est à l'interieur du preseed, on saute cette boucle
# 2 conditions : si (mandb_01 n existe pas et mandb_02 n existe pas) alors faire, sinon supprimer mandb_01
# la premiere fois, mandb_01 existe mais mandb_02 n existe pas donc, on supprime mandb_01
# la seconde fois, on cree mandb_02
# les fois suivantes, on ne fait rien

if [ ! -e /var/log/bf/bfaptitudeupdate00-mandb01.log -a ! -e /var/log/bf/bfaptitudeupdate00-mandb02.log ]
then
  # man-db est a installer apres reboot : ne fonctionne pas à l'interieur du preseed...
  # on l installe donc dans un deuxième temps
  echo "  Installation de man-db"
  echo y | aptitude install man-db 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeupdate00-mandb02.log
else
  rm -f /var/log/bf/bfaptitudeupdate00-mandb01.log
fi

#if [ ! -e /var/log/fg/fgaptitudeupdate-fontconfig.log ]
#then
#  echo y | aptitude install fontconfig-config/testing 1> /dev/null
#  echo y | aptitude install libfontconfig1/testing 1> /dev/null
#  echo y | aptitude install fbterm/testing 1> /dev/null
#  date +"%F %T" >> /var/log/fg/fgaptitudeupdate-fontconfig.log
#fi
