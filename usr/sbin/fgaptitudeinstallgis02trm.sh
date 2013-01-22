#!/bin/sh

# Seconde partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02brm.sh : Suppression de debian-gis (Partie 2b)"

if [ ! -e /var/log/fg/fgaptitudeinstallgis02brm-postgis.log ]
then
  ######
  # main
  echo "  main"
  echo "    Suppression de postgresql et des librairies libpq"
  echo "      Suppression de postgresql-server-dev"
  echo y | aptitude remove postgresql-server-dev-9.2 1> /dev/null
  echo "      Suppression de postgresql"
  aptitude remove postgresql-common \
                  postgresql-client-common \
                  postgresql-9.2 \
                  postgresql-client-9.2 1> /dev/null
  echo "      Suppression de libpq5"
  aptitude remove libpq5 \
                  libpq-dev 1> /dev/null

  echo "    Suppression des librairies pour le support du raster dans postgis2"
  echo "      Suppression de libarmadillo-dev"
  echo y | aptitude remove libarmadillo-dev #1> /dev/null
  echo "      Suppression de libpoppler-dev"
  aptitude remove libpoppler-dev #1> /dev/null
  echo "      Suppression de libfreexl-dev"
  echo y | aptitude remove libfreexl-dev #1> /dev/null
  echo "      Suppression de libepsilon-dev"
  echo y | aptitude remove libepsilon-dev #1> /dev/null
  echo "      Suppression de libkml-dev"
  echo y | aptitude remove libkml-dev #1> /dev/null
  echo "      Suppression de libzip-dev"
  echo y | aptitude remove libzip-dev #1> /dev/null
  echo "      Suppression de liburiparser-dev"
  echo y | aptitude remove liburiparser-dev #1> /dev/null
  echo "      Suppression de libogdi3.2-dev"
  echo y | aptitude remove libogdi3.2-dev #1> /dev/null
  echo "      Suppression de liblzma-dev"
  aptitude remove liblzma-dev #1> /dev/null

  echo "    Suppression des outils pour generer la documentation lors de la compilation"
  echo "      Suppression de dblatex"
  echo y | aptitude remove dblatex #1> /dev/null
  echo "      Suppression de xsltproc"
  aptitude remove xsltproc #1> /dev/null
  echo "      Suppression de docbook-xsl"
  aptitude remove docbook-xsl #1> /dev/null
  echo "      Suppression de libjson0-dev"
  aptitude remove libjson0-dev #1> /dev/null
  echo "      Suppression de libcunit1-dev"
  echo y | aptitude remove libcunit1-dev #1> /dev/null
  echo "      Suppression de libcunit1"
  aptitude remove libcunit1 #1> /dev/null
  echo "      Suppression de libxml2-utils"
  aptitude remove libxml2-utils #1> /dev/null

  echo "    Purge"
  echo y | aptitude purge ~c
  echo "    Suppression des sources de postgis2"
  cd /usr/local/src
  rm -rf postgis-svn #1> /dev/null
  cd $OLDPWD

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02brm-postgis.log
fi

