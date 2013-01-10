#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

mkdir /var/log/fg 2> /dev/null

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate01.sh
fgaptitudeclean.sh
# installation de quelques applications et utilitaires
# spécifiques à l'administration du système
# ces applications systèmes sont divisés en trois groupes
# en fonction du type d'install à effectuer
# - le groupe commun
# - le groupe des applis spécifiques à une install "Framebuffer"
# - le groupe des applis spécifiques à une install "Bureau X Minimal"
#
# sauvegarde
#fgaptitudeinstallsys.sh
# commun
fgaptitudeinstallsyscommun01.sh
# framebuffer
fgaptitudeinstallsysframebuffer01.sh
# X
#fgaptitudeinstallsysx01.sh

# installation de vim
fgaptitudeinstallvim01a.sh
#fgaptitudeinstallvim01b.sh
sudo -u root fgaptitudeinstallvim01b.sh
sudo -u garel fgaptitudeinstallvim01b.sh
fgaptitudeinstallvim01c.sh

fgaptitudeupgrade01.sh
fgaptitudeinstallpython.sh
if [ ! -e /var/log/fg/fgaptitudeinstallpythonfabric-fabric.log ]
then
  echo "  python fabric"
  sudo -u garel fgaptitudeinstallpythonfabric.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonfabric-fabric.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonpyramid-pyramid.log ]
then
  echo "  python pyramid"
  sudo -u garel fgaptitudeinstallpythonpyramid.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonpyramid-pyramid.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonmapnik-mapnik.log ]
then
  echo "  python mapnik"
  sudo -u garel fgaptitudeinstallpythonmapnik.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonmapnik-mapnik.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythongeonode-geonode.log ]
then
  echo "  python geonode"
  sudo -u garel fgaptitudeinstallpythongeonode.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythongeonode-geonode.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonckan-ckan.log ]
then
  echo "  python ckan"
  sudo -u garel fgaptitudeinstallpythonckan.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonckan-ckan.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythongeopy-geopy.log ]
then
  echo "  python geopy"
  sudo -u garel fgaptitudeinstallpythongeopy.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythongeopy-geopy.log
fi

# installation de quelques applications et utilitaires
# spécifiques au domaine du sig
#fgaptitudeinstallgis01.sh


# récupération de la suite des fichiers
# recopie de :
# - la configuration d'apt :
#    - le fichier de preferences,
#    - les differentes sources
# - quelques utilitiares
# - quelques fichiers de configurations
echo "fgaptitudedo01 : Récupération des fichiers du projet 'myDebianInstall02'"
git clone --progress --verbose http://github.com/fgarel/myDebianInstall02.git /root/myDebianInstall02 2> /dev/null
cd /root/myDebianInstall02
git fetch --progress --verbose
cd $OLDPWD
yes | cp -r -f /root/myDebianInstall02/* / 2> /dev/null
###scp -q -r root@10.5.10.23:/media/clefUsb2/\* /
chown -R garel:garel /home/garel/
#sudo -u garel fgaptitudeinstallgis03.sh ; cd $OLDPWD
