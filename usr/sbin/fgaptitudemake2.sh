#!/bin/sh

# à partir d'une liste de paquets enregistrée dans le fichier gis.txt,
# on fabrique un script d'installation
#
/root/myDebianInstall01/usr/sbin/fgaptitudemake.sh /root/myDebianInstall01/usr/sbin/gis.txt > /root/myDebianInstall01/usr/sbin/fgaptitudeinstallgis02y.sh
chmod +x /root/myDebianInstall01/usr/sbin/fgaptitudeinstallgis02y.sh
rm /usr/sbin/fgaptitudeinstallgis02y.sh
cp /root/myDebianInstall01/usr/sbin/fgaptitudeinstallgis02y.sh /usr/sbin/
#cat /usr/sbin/fgaptitudeinstallgis02y.sh
#
#/usr/sbin/fgaptitudemake.sh /usr/sbin/gis.txt > /usr/sbin/fgaptitudeinstallgis02y.sh
/usr/sbin/fgaptitudeinstallgis02y.sh
