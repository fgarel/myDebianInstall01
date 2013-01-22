#!/bin/sh

# Première partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02arm.sh : Suppression de debian-gis (Partie 2a)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallgis02arm-mainmapnik.log ]
then
  ######
  # main
  echo "  main"
  echo "    Suppression de mapnik-utils"
  echo y | aptitude remove mapnik-utils 1> /dev/null
  echo "    Suppression de python-lxml"
  echo y | aptitude remove python-lxml 1> /dev/null
  echo "    Suppression de python-mapnik2"
  echo y | aptitude remove python-mapnik2 1> /dev/null
  echo "    Suppression de python-cairo"
  echo y | aptitude remove python-cairo 1> /dev/null
  echo "    Suppression de python-gdal"
  echo y | aptitude remove python-gdal 1> /dev/null
  echo "    Suppression de gdal-bin"
  echo y | aptitude remove gdal-bin 1> /dev/null
  echo "    Suppression de python-numpy"
  echo y | aptitude remove python-numpy 1> /dev/null
  echo "    Suppression de libmapnik2"
  echo y | aptitude remove libmapnik2-2.0 1> /dev/null
  echo "    Suppression de proj-bin"
  echo y | aptitude remove proj-bin 1> /dev/null
  echo "    Suppression des librairies *-dev : libxml2, libgeos, libproj et libgdal"
  echo "      libproj-dev"
  echo y | aptitude remove libproj-dev 1> /dev/null
  echo "      libgdal-dev"
  echo y | aptitude remove libgdal-dev 1> /dev/null
  echo "      libgeos-dev"
  echo y | aptitude remove libgeos-dev 1> /dev/null
  echo "      libxml2-dev"
  echo y | aptitude remove libxml2-dev 1> /dev/null
  echo "    Suppression de imagemagick"
  echo y | aptitude remove imagemagick 1> /dev/null
  echo "    Suppression de libmagickcore5"
  echo y | aptitude remove libmagickcore5 \
                           libmagickcore5-extra \
                           libmagickwand5 1> /dev/null
  echo "    Suppression de libgeos-c1"
  echo y | aptitude remove libgeos-c1 1> /dev/null
  echo "    Suppression de libltdl7"
  echo y | aptitude remove libltdl7 \
                           libltdl-dev 1> /dev/null
  echo "    Suppression de libgfortran"
  echo y | aptitude remove libgfortran3 1> /dev/null
  echo "    Suppression de mysql-common"
  echo y | aptitude remove mysql-common 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02arm-mainmapnik.log
fi

