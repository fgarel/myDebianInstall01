#!/bin/sh

# à partir d'une liste de paquets enregistrée dans le fichier gis.txt,
# on fabrique un script d'installation
#
#

echo "#!/bin/sh" > /usr/sbin/fgaptitudeinstallgis02arm.sh

echo "#" >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo 'echo "fgaptitudeinstallgis02arm.sh :          Installation de debian-gis (Partie 02arm)"' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo 'mkdir /var/log/fg 2> /dev/null' >>/usr/sbin/fgaptitudeinstallgis02arm.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo 'if [ ! -e /var/log/fg/fgaptitudeinstallgis02arm.log ]' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo 'then' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo '  ######' >> /usr/sbin/fgaptitudeinstallgis02arm.sh

/usr/sbin/fgaptitudemakeremove.sh /usr/sbin/gis.txt >> /usr/sbin/fgaptitudeinstallgis02arm.sh

echo '' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo '  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02arm.log' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo 'fi' >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02arm.sh
echo "# END" >> /usr/sbin/fgaptitudeinstallgis02arm.sh

chmod +x /usr/sbin/fgaptitudeinstallgis02arm.sh
#cat /usr/sbin/fgaptitudeinstallgis02arm.sh
