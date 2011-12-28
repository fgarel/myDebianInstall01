#!/bin/sh


# en cas de problème, il faut eventuellement nettoyé les listes
# qui ne peuvent pas etre mergées
echo "Nettoyage 1"
rm -f /var/lib/apt/lists/partial/*
rmdir /var/lib/apt/lists/partial
rm -f /var/lib/apt/lists/*
#aptitude clean
# si le problème est :
# Reading package lists... Error!
# E: Wow, you exceeded the number of versions this APT is capable of.
# E: Problem with MergeList /var/lib/apt/lists/archive.debian.org_debian-archive_debian_dists_sarge_main_binary-i386_Packages
# E: The package lists or status file could not be parsed or opened. 
# alors la solution est indiquée sur cette page :
# http://hydra.geht.net/tino/english/faq/debian/apt/aptlimit/


# update
echo "Aptitude update"
#aptitude update | grep -v "Ign" | grep -v "Atteint" 1> log.txt 2> erreur.txt
#cat log.txt | grep "Erreur"
#cat erreur.txt | grep ""
#aptitude update | grep -v "Ign" | grep -v "Atteint" &> /dev/null
echo "==============================="
echo "1"
apt-cache policy git
echo "==============================="
aptitude update 1> /dev/null 2> /dev/null
echo "==============================="
echo "2"
apt-cache policy git
echo "==============================="
#aptitude update 
echo "... tude update done"


aptitude reinstall man-db 1> /dev/null
echo "==============================="
echo "3"
apt-cache policy git
echo "==============================="
aptitude reinstall man-db
echo "==============================="
echo "4"
apt-cache policy git
echo "==============================="
#aptitude reinstall libconfig1 1> /dev/null
#aptitude reinstall fontconfig-config 1> /dev/null

# TODO: à mettre dans un bloc if pour eviter de relancer cette install à chaque
#       fois...
# installation du trousseau de clefs debian-multimedia-keyring
echo "Oui" | aptitude install debian-multimedia-keyring > /dev/null
echo "==============================="
echo "5"
apt-cache policy git
echo "==============================="
echo "Oui" | aptitude install debian-multimedia-keyring
echo "==============================="
echo "6"
apt-cache policy git
echo "==============================="

