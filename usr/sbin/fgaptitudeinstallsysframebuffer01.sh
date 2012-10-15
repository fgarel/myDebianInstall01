#!/bin/sh

# Première partie des applications "système framebuffer"

###########################################
echo "Installation de systeme-framebuffer (1ère partie)"


###############################################################
# modification de grub-pc pour lancer la console en 1152x864x32
echo "Modification de grub-pc pour lancer la console en 1152x864x32"
sed -i -e '/GRUB_GFXMODE=1/ d' /etc/default/grub   # suppression
sed -i -e '/#GRUB_GFXMODE=640x480/ a\GRUB_GFXMODE=1152x864,1152x864x32,1152x864x24,1152x864x16,1280x1024x16,1024x768x16,1152x864x32,1024x768x32,1024x768x24,800x600,640x480' /etc/default/grub # ajout
sed -i -e '/set gfxpayload=keep/ d' /etc/grub.d/00_header   # suppression de set gfxpayload
sed -i -e '/load_video/  i\  set gfxpayload=keep' /etc/grub.d/00_header # ajout de set gfxpayload
update-grub2


###########################################
# Installation d'utilitaires en framebuffer
# http://kmandla.wordpress.com/2010/04/16/a-quick-look-at-framebuffer-applications/

echo "Installation d'utilitaires divers" 

# ajout de l'utilitaire fim
# http://www.autistici.org/dezperado/fim/
echo "  Installation de fim"
echo y | aptitude install fim 1> /dev/null

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


#echo "Installationd de zathura"
#echo y | aptitude install zathura 1> /dev/null


