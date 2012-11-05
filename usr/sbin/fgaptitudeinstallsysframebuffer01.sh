#!/bin/sh

# Première partie des applications "système framebuffer"

###########################################
echo "fgaptitudeinstallsysframebuffer01 : Installation d'outils pour le mode console (1ere partie)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer01-grubcfg.log ]
then
  ###############################################################
  # modification de grub-pc pour lancer la console en 1152x864x32
  echo "  Modification de grub-pc pour lancer la console en 1152x864x32 : configuration"
  # dans le fichier /etc/default/grub, definition de GFXMODE
  sed -i -r -e '/^GRUB_GFXMODE=1/ d' /etc/default/grub   # suppression
  sed -i -r -e '/^#GRUB_GFXMODE=640x480/ a\GRUB_GFXMODE=1152x864,1152x864x32,1152x864x24,1152x864x16,1280x1024x16,1024x768x16,1152x864x32,1024x768x32,1024x768x24,800x600,640x480' /etc/default/grub # ajout
  # dans le fichier /etc/grub.d/00_header, ajout du parametre gfxpayload=keep
  sed -i -r -e '/^  set gfxpayload=keep/ d' /etc/grub.d/00_header   # suppression de set gfxpayload=keep
  sed -i -r -e '/^  load_video/  i\  set gfxpayload=keep' /etc/grub.d/00_header # ajout de set gfxpayload=keep
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer01-grubcfg.log

  # update-grub2 a l'interieur de preseed...
  update-grub2 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer01-grub01.log
fi

# Quand on est à l'interieur du preseed, on saute cette boucle
# 2 conditions : si (grub_01 n existe pas et grub_02 n existe pas) alors faire, sinon supprimer grub_01
# la premiere fois, grub_01 existe mais grub_02 n existe pas donc, on supprime grub_01
# la seconde fois, on cree grub_02
# les fois suivantes, on ne fait rien
if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer01-grub01.log -a ! -e /var/log/fg/fgaptitudeinstallsysframebuffer01-grub02.log ]
then
  # update-grub2 est a relancer apres reboot : ne fonctionne pas à l'interieur du preseed...
  # on l execute donc dans un deuxième temps
  echo "  ...Modification de grub-pc pour lancer la console en 1152x864x32 : update-grub2"
  update-grub2 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer01-grub02.log
else
  rm -f /var/log/fg/fgaptitudeinstallsysframebuffer01-grub01.log
fi

###########################################
# Installation d'utilitaires en framebuffer
# http://kmandla.wordpress.com/2010/04/16/a-quick-look-at-framebuffer-applications/

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer01-divers.log ]
then

  echo "  Installation d'utilitaires divers"
  # ajout de l'utilitaire fim
  # http://www.autistici.org/dezperado/fim/
  echo "  Installation de fim"
  echo y | aptitude install fim 1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer01-divers.log
fi


#cd /usr/local/bin
#wget -nv -q -N  http://www.autistici.org/dezperado/fim/fim-0.3-beta-prerelease-20110702.tar.gz
#tar xzf fim-0.3-beta-prerelease-20110702.tar.gz
#cd fim-0.3-beta-prerelease-20110702
#./configure -q
#make -s
#make -s install
#cd $OLDPWD


#echo "  Installation de fbida"
#
# http://www.kraxel.org/cgit/fbida/
#git clone git://git.kraxel.org/fbida /usr/local/bin/fbida
#cd /usr/local/bin/fbida
#./configure
#make
#make install
#cd $OLDPWD


#echo "  Installationd de zathura"
#echo y | aptitude install zathura 1> /dev/null




