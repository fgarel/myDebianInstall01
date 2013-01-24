#!/bin/sh

# suppression des paquets debian
echo "fgaptitudeclean.sh :                    Nettoyage 2"

if [ ! -e /var/log/fg/fgaptitudeclean-clean.log ]
then
  echo "  Aptitude clean"
  echo y | aptitude clean 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeclean-clean.log
fi

if [ ! -e /var/log/fg/fgaptitudeclean-purge.log ]
then
  echo "  Aptitude purge"
  echo y | aptitude purge "~c" 1> /dev/null 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeclean-purge.log
fi

# on enleve quelques paquets qui ne seront pas utilisés
#echo "Suppression de quelques paquets debian (nano et fakeroot)"
#echo "y" | aptitude remove nano \
#                           fakeroot > /dev/null
#echo "y" | aptitude purge ~c > /dev/null
#aptitude install man-db

# reglage des update-alternatives
#update-alternatives --all
# par exemple, au lieu de désinstaller le paquet "util-linux" (qui contient pg et more)
# http://pwet.fr/man/linux/administration_systeme/update_alternatives
if [ ! -e /var/log/fg/fgaptitudeclean-alternatives.log ]
then
  echo "  Alternatives"
  update-alternatives --remove editor /bin/nano 1> /dev/null
  update-alternatives --remove editor /usr/bin/vim.basic 1> /dev/null
  update-alternatives --remove editor /usr/bin/vim.tiny 1> /dev/null
  update-alternatives --remove fakeroot /usr/bin/fakeroot-tcp 1> /dev/null
  update-alternatives --remove pager /usr/bin/pg 1> /dev/null
  update-alternatives --remove pager /bin/more 1> /dev/null
  update-alternatives --remove vi /usr/bin/vim.tiny 1> /dev/null
  update-alternatives --remove view /usr/bin/see 1> /dev/null
  update-alternatives --remove view /usr/bin/vim.tiny 1> /dev/null
  update-alternatives --remove vim /usr/bin/vim.basic 1> /dev/null
  update-alternatives --remove vimdiff /usr/bin/vim.basic 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeclean-alternatives.log
fi
