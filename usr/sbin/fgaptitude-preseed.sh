#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "fgaptitude-preseed.sh :                 Actions commencées lors de l'installation automatique"

mkdir /var/log/fg 2> /dev/null

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate-preseed.sh
fgaptitudeclean-preseed.sh
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
fgaptitudeinstallsyscommun-preseed.sh
# framebuffer
fgaptitudeinstallsysframebuffer-preseed.sh
# X
#fgaptitudeinstallsysx01.sh

# installation de vim
fgaptitudeinstallvim01a.sh
#fgaptitudeinstallvim01b.sh
if [ ! -e /var/log/fg/fgaptitudeinstallvim01b-root.log ]
then
  echo "  vim pour root"
  sudo -u root fgaptitudeinstallvim01b.sh
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01b-root.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallvim01b-user.log ]
then
  echo "  vim pour user"
  sudo -u blueflamingo fgaptitudeinstallvim01b.sh
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01b-user.log
fi
sudo -u root fgaptitudeinstallvim01c.sh

fgaptitudeupgrade-preseed.sh
fgaptitudeinstallpython.sh
if [ ! -e /var/log/fg/fgaptitudeinstallpythonfabric-fabric.log ]
then
  echo "  python fabric"
  sudo -u blueflamingo fgaptitudeinstallpythonfabric.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonfabric-fabric.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonpyramid-pyramid.log ]
then
  echo "  python pyramid"
  sudo -u blueflamingo fgaptitudeinstallpythonpyramid.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonpyramid-pyramid.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonmapnik-mapnik.log ]
then
  echo "  python mapnik"
  sudo -u blueflamingo fgaptitudeinstallpythonmapnik.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonmapnik-mapnik.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythongeonode-geonode.log ]
then
  echo "  python geonode"
  sudo -u blueflamingo fgaptitudeinstallpythongeonode.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythongeonode-geonode.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythonckan-ckan.log ]
then
  echo "  python ckan"
  sudo -u blueflamingo fgaptitudeinstallpythonckan.sh ; cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpythonckan-ckan.log
fi
if [ ! -e /var/log/fg/fgaptitudeinstallpythongeopy-geopy.log ]
then
  echo "  python geopy"
  sudo -u blueflamingo fgaptitudeinstallpythongeopy.sh ; cd $OLDPWD
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
chown -R blueflamingo:blueflamingo /home/blueflamingo/
#sudo -u garel fgaptitudeinstallgis03.sh ; cd $OLDPWD
