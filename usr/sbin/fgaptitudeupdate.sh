#!/bin/sh


# en cas de problème, il faut eventuellement nettoyé les listes
# qui ne peuvent pas etre mergées
echo "Nettoyage 1"
rm -f /var/lib/apt/lists/partial/*
rmdir /var/lib/apt/lists/partial
rm -f /var/lib/apt/lists/*

mkdir /var/log/fg 2> /dev/null
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
if [ ! -e /var/log/fg/fgaptitudeupdate-update.log ]
then
  echo "Aptitude update"
  aptitude update 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeupdate-update.log
  echo "... tude update done"
fi

# installation du trousseau de clefs deb-multimedia-keyring
if [ ! -e /var/log/fg/fgaptitudeupdate-keyring.log ]
then

  echo "  Installation du trousseau de clefs deb-multimedia-keyring"
  echo "Oui" | aptitude install deb-multimedia-keyring > /dev/null
  #touch /var/log/fg/deb-multimedia-keyring.log
  date +"%F %T" >> /var/log/fg/fgaptitudeupdate-keyring.log

  # apres avoir installe la clef, on refait un aptitude update
  aptitude update 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeupdate-update.log

fi


#aptitude reinstall man-db 1> /dev/null
# d'après ce que je peux comprendre, a chaque fois qu'un paquet est installé
# la base de donnée "man" est mise à jour
# pour une raison que j'ignore encore, (peut-etre tout simplement parce que
# cette base de données "man" ne peut pas être mise à jour ?),
# l'execution de preseed entraine plein d'erreaurs provenant
# du paquet man-db
# on retire donc ce paquet ...
if [ ! -e /var/log/fg/fgaptitudeupdate-mandb.log ]
then
  echo "  Suppression de man-db"
  aptitude remove man-db 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeupdate-mandb.log
fi
#aptitude reinstall libconfig1 1> /dev/null
#aptitude reinstall fontconfig-config 1> /dev/null

