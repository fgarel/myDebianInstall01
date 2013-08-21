#!/bin/sh

#
echo "fgaptitude-gisuser-preseed.sh :                 Actions commencées lors de l'installation automatique"

mkdir /var/log/fg 2> /dev/null

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
echo "fgaptitude-gisuser-preseed : fin"
