#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate.sh
fgaptitudeclean.sh
fgaptitudeinstallsys.sh
fgaptitudeinstallvim.sh
fgaptitudeupgrade.sh
fgaptitudeinstallpython.sh
sudo -u garel fgaptitudeinstallpythonfabric.sh ; cd $OLDPWD
sudo -u garel fgaptitudeinstallpythonpyramid.sh ; cd $OLDPWD
sudo -u garel fgaptitudeinstallpythonmapnik.sh ; cd $OLDPWD
sudo -u garel fgaptitudeinstallpythongeonode.sh ; cd $OLDPWD
fgaptitudeinstallgis.sh


# récupération de la suite des fichiers
# recopie de :
# - la configuration d'apt :
#    - le fichier de preferences,
#    - les differentes sources
# - quelques utilitiares
# - quelques fichiers de configurations
echo "Récupération des fichiers depuis la machine distante - clefUsb2"
git clone --progress --verbose http://github.com/fgarel/myDebianInstall02.git /root/myDebianInstall02
cp /root/myDebianInstall01/* /
#scp -q -r root@10.5.10.23:/media/clefUsb2/\* /
chown -R garel:garel /home/garel/
#sudo -u garel fgaptitudeinstallgis2.sh ; cd $OLDPWD
