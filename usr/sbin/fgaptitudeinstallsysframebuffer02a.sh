#!/bin/sh

# Première partie des applications "système framebuffer"

###########################################
echo "fgaptitudeinstallsysframebuffer02a.sh : Installation d'outils pour le mode console (Partie 02a)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer00-grubcfg.log ]
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
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer00-grubcfg.log

  # update-grub2 a l'interieur de preseed...
  update-grub2 2> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer00-grub01.log
fi

# Quand on est à l'interieur du preseed, on saute cette boucle
# 2 conditions : si (grub_01 n existe pas et grub_02 n existe pas) alors faire, sinon supprimer grub_01
# la premiere fois, grub_01 existe mais grub_02 n existe pas donc, on supprime grub_01
# la seconde fois, on cree grub_02
# les fois suivantes, on ne fait rien
if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer00-grub01.log -a ! -e /var/log/fg/fgaptitudeinstallsysframebuffer00-grub02.log ]
then
  # update-grub2 est a relancer apres reboot : ne fonctionne pas à l'interieur du preseed...
  # on l execute donc dans un deuxième temps
  echo "  Modification de grub-pc pour lancer la console en 1152x864x32 : update-grub2"
  update-grub2 2> /dev/null
  # les lignes suivantes ont été commentées : dorénavant, avec spf13-vim3, la largeur de colonne
  # n'a plus besoin d'ètre définie
  #echo "  Modification de vimrc.fg pour modifier la largeur de colonne"
  #sed -i -r -e 's/^set columns=80$/\"set columns=80/' /etc/vim/vimrc.fg   # substitution : desactivation de 80
  #sed -i -r -e 's/^\"set columns=144$/set columns=144/' /etc/vim/vimrc.fg # substitution : activation de 144
  #sed -i -r -e 's/^set columns=164$/\"set columns=164/' /etc/vim/vimrc.fg # substitution : desactivation de 164
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer00-grub02.log
else
  rm -f /var/log/fg/fgaptitudeinstallsysframebuffer00-grub01.log
fi
