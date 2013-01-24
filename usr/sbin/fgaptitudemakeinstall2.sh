#!/bin/sh

# à partir d'une liste de paquets enregistrée dans le fichier gis.txt,
# on fabrique un script d'installation
#
#

echo "#!/bin/sh" > /usr/sbin/fgaptitudeinstallgis02a.sh

echo "#" >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo 'echo "fgaptitudeinstallgis02a.sh :            Installation de debian-gis (Partie 02a)"' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo 'mkdir /var/log/fg 2> /dev/null' >>/usr/sbin/fgaptitudeinstallgis02a.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo 'if [ ! -e /var/log/fg/fgaptitudeinstallgis02a.log ]' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo 'then' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo '  ######' >> /usr/sbin/fgaptitudeinstallgis02a.sh

#/usr/sbin/fgaptitudemakeinstall.sh /usr/sbin/gis_sav.txt >> /usr/sbin/fgaptitudeinstallgis02a.sh
/usr/sbin/fgaptitudemakeinstall.sh /usr/sbin/gis.txt >> /usr/sbin/fgaptitudeinstallgis02a.sh

echo '' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo '  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02a.log' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo 'fi' >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo "" >> /usr/sbin/fgaptitudeinstallgis02a.sh
echo "# END" >> /usr/sbin/fgaptitudeinstallgis02a.sh

chmod +x /usr/sbin/fgaptitudeinstallgis02a.sh
#cat /usr/sbin/fgaptitudeinstallgis02a.sh
