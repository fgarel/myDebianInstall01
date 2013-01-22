#!/bin/sh

# Seconde partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02zrm.sh : Suppression de debian-gis (Partie 2z)"

if [ ! -e /var/log/fg/fgaptitudeinstallgis02zrm-librairiesgeo.log ]
then
  ######
  # main
  echo "  librairiesgeo"
  echo "    Suppression des librairies *-dev : libxml2, libgeos, libproj et libgdal"
  echo "      libproj-dev"
  echo y | aptitude remove libproj-dev #1> /dev/null
  echo "      libgdal-dev"
  echo y | aptitude remove libgdal-dev #1> /dev/null
  echo "      libgeos-dev"
  echo y | aptitude remove libgeos-dev #1> /dev/null
  echo "      libxml2-dev"
  echo y | aptitude remove libxml2-dev #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02zrm-librairiesgeo.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallgis02zrm-apache.log ]
then
  #######
  # other
  echo "  apache"
  /etc/init.d/apache2 stop
  a2dismod userdir
  echo "    Suppression d'apache"
  echo y | aptitude remove libapache2-mod-ldap-userdir #1> /dev/null
  echo y | aptitude remove apache2 #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02zrm-apache.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallgis02zrm-postgis.log ]
then
  ######
  # main
  echo "  postgis"
  echo "    Suppression de postgresql et des librairies libpq"
  echo "      Suppression de postgresql-server-dev"
  echo y | aptitude remove postgresql-server-dev-9.2 #1> /dev/null
  echo "      Suppression de postgresql"
  aptitude remove postgresql-common \
                  postgresql-client-common \
                  postgresql-9.2 \
                  postgresql-client-9.2 #1> /dev/null
  echo "      Suppression de libpq5"
  aptitude remove libpq5 \
                  libpq-dev #1> /dev/null

  echo "    Suppression des librairies pour le support du raster dans postgis2"
  echo "      Suppression de libarmadillo-dev"
  echo y | aptitude remove libarmadillo-dev ##1> /dev/null
  echo "      Suppression de libpoppler-dev"
  aptitude remove libpoppler-dev ##1> /dev/null
  echo "      Suppression de libfreexl-dev"
  echo y | aptitude remove libfreexl-dev ##1> /dev/null
  echo "      Suppression de libepsilon-dev"
  echo y | aptitude remove libepsilon-dev ##1> /dev/null
  echo "      Suppression de libkml-dev"
  echo y | aptitude remove libkml-dev ##1> /dev/null
  echo "      Suppression de libzip-dev"
  echo y | aptitude remove libzip-dev ##1> /dev/null
  echo "      Suppression de liburiparser-dev"
  echo y | aptitude remove liburiparser-dev ##1> /dev/null
  echo "      Suppression de libogdi3.2-dev"
  echo y | aptitude remove libogdi3.2-dev ##1> /dev/null
  echo "      Suppression de liblzma-dev"
  aptitude remove liblzma-dev ##1> /dev/null

  echo "    Suppression des outils pour generer la documentation lors de la compilation"
  echo "      Suppression de dblatex"
  echo y | aptitude remove dblatex ##1> /dev/null
  echo "      Suppression de xsltproc"
  aptitude remove xsltproc ##1> /dev/null
  echo "      Suppression de docbook-xsl"
  aptitude remove docbook-xsl ##1> /dev/null
  echo "      Suppression de libjson0-dev"
  aptitude remove libjson0-dev ##1> /dev/null
  echo "      Suppression de libcunit1-dev"
  echo y | aptitude remove libcunit1-dev ##1> /dev/null
  echo "      Suppression de libcunit1"
  aptitude remove libcunit1 ##1> /dev/null
  echo "      Suppression de libxml2-utils"
  aptitude remove libxml2-utils ##1> /dev/null

  echo "    Purge"
  echo y | aptitude purge ~c
  echo "    Suppression des sources de postgis2"
  cd /usr/local/src
  rm -rf postgis-svn ##1> /dev/null
  cd $OLDPWD

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02zrm-postgis.log
fi




if [ ! -e /var/log/fg/fgaptitudeinstallgis02zrm-mapnik.log ]
then
  ######
  # main
  echo "  mapnik"
  echo "    Suppression de mapnik-utils"
  echo y | aptitude remove mapnik-utils #1> /dev/null
  echo "    Suppression de python-lxml"
  echo y | aptitude remove python-lxml #1> /dev/null
  echo "    Suppression de python-mapnik2"
  echo y | aptitude remove python-mapnik2 #1> /dev/null
  echo "    Suppression de python-cairo"
  echo y | aptitude remove python-cairo #1> /dev/null
  echo "    Suppression de python-gdal"
  echo y | aptitude remove python-gdal #1> /dev/null
  echo "    Suppression de gdal-bin"
  echo y | aptitude remove gdal-bin #1> /dev/null
  echo "    Suppression de python-numpy"
  echo y | aptitude remove python-numpy #1> /dev/null
  echo "    Suppression de libmapnik2"
  echo y | aptitude remove libmapnik2-2.0 #1> /dev/null
  echo "    Suppression de proj-bin"
  echo y | aptitude remove proj-bin #1> /dev/null
  echo "    Suppression de imagemagick"
  echo y | aptitude remove imagemagick #1> /dev/null
  echo "    Suppression de libmagickcore5"
  echo y | aptitude remove libmagickcore5 \
                           libmagickcore5-extra \
                           libmagickwand5 #1> /dev/null
  echo "    Suppression de libgeos-c1"
  echo y | aptitude remove libgeos-c1 #1> /dev/null
  echo "    Suppression de libltdl7"
  echo y | aptitude remove libltdl7 \
                           libltdl-dev #1> /dev/null
  echo "    Suppression de libgfortran"
  echo y | aptitude remove libgfortran3 #1> /dev/null
  echo "    Suppression de mysql-common"
  echo y | aptitude remove mysql-common #1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02zrm-mapnik.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallgis02zrm-librairies.log ]
then
  ######
  # main
  echo "  librairies"
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02zrm-librairies.log
fi
