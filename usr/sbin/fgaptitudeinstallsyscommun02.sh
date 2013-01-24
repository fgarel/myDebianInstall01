#!/bin/sh

# 2de partie des applications "système"

###########################################
echo "fgaptitudeinstallsyscommun02.sh :       Installation d'outils systeme communs au mode console et au mode graphique (partie 02)"


###########################################
#echo "  Installation de man-db"
#echo y | aptitude install man-db 1> /dev/null


########################
# installation de elinks
echo "Installation de elinks"
echo y | aptitude install elinks 1> /dev/null

echo 'set mime.extension.jpg="image/jpeg"' >> /etc/elinks/elinks.conf
echo 'set mime.extension.jpeg="image/jpeg"' >> /etc/elinks/elinks.conf
echo 'set mime.extension.png="image/png"' >> /etc/elinks/elinks.conf
echo 'set mime.extension.gif="image/gif"' >> /etc/elinks/elinks.conf
echo 'set mime.extension.bmp="image/bmp"' >> /etc/elinks/elinks.conf
echo '' >> /etc/elinks/elinks.conf
echo 'set mime.handler.image_viewer.unix.ask = 1' >> /etc/elinks/elinks.conf
echo 'set mime.handler.image_viewer.unix-xwin.ask = 0' >> /etc/elinks/elinks.conf
echo 'set mime.handler.image_viewer.unix.block = 1' >> /etc/elinks/elinks.conf
echo 'set mime.handler.image_viewer.unix-xwin.block = 0' >> /etc/elinks/elinks.conf
echo 'set mime.handler.image_viewer.unix.program = "fim %"' >> /etc/elinks/elinks.conf
echo '#set mime.handler.image_viewer.unix-xwin.program = "ida %"' >> /etc/elinks/elinks.conf
echo '' >> /etc/elinks/elinks.conf
echo 'set mime.type.image.jpg = "image_viewer"' >> /etc/elinks/elinks.conf
echo 'set mime.type.image.jpeg = "image_viewer"' >> /etc/elinks/elinks.conf
echo 'set mime.type.image.png = "image_viewer"' >> /etc/elinks/elinks.conf
echo 'set mime.type.image.gif = "image_viewer"' >> /etc/elinks/elinks.conf
echo 'set mime.type.image.bmp = "image_viewer"' >> /etc/elinks/elinks.conf


