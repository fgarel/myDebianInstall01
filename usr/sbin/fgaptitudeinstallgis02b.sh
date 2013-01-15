#!/bin/sh

# Seconde partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02b.sh : Installation de debian-gis (Partie 2b)"

if [ ! -e /var/log/fg/fgaptitudeinstallgis02b-postgis.log ]
then
  ######
  # main
  echo "  main"
  echo "    Installation des librairies xml2, geos, proj et gdal"
  echo y | aptitude install libxml2-dev 1> /dev/null
  echo y | aptitude install libgeos-dev 1> /dev/null
  echo y | aptitude install libproj-dev 1> /dev/null
  echo y | aptitude install libgdal-dev 1> /dev/null

  echo "    Installation des librairies de postgresql"
  echo y | aptitude install libpq5/experimental \
                    libpq-dev/experimental 1> /dev/null
  echo y | aptitude install postgresql-server-dev-9.2/experimental 1> /dev/null

  echo "    Installation des outils pour generer la documentation"
  echo y | aptitude install xsltproc 1> /dev/null
  echo y | aptitude install dblatex 1> /dev/null
  echo y | aptitude install docbook-xsl 1> /dev/null
  echo y | aptitude install libjson0-dev 1> /dev/null
  echo y | aptitude install libcunit1-dev 1> /dev/null
  echo y | aptitude install libxml2-utils 1> /dev/null

  echo "    Suppression de l'editeur ed dans le fichier des alternatives"
  update-alternatives --remove editor /bin/ed 1> /dev/null
  
  echo "    Installation des librairies pour le raster"
  echo y | aptitude install libarmadillo-dev 1> /dev/null
  echo y | aptitude install libpoppler-dev 1> /dev/null
  echo y | aptitude install libfreexl-dev 1> /dev/null
  echo y | aptitude install libepsilon-dev 1> /dev/null
  echo y | aptitude install libkml-dev 1> /dev/null
  echo y | aptitude install libzip-dev 1> /dev/null
  echo y | aptitude install liburiparser-dev 1> /dev/null
  echo y | aptitude install libogdi3.2-dev 1> /dev/null
  echo y | aptitude install liblzma-dev 1> /dev/null

  echo "    Téléchargement des sources de postgis2"
  cd /usr/local/src
  svn co http://svn.osgeo.org/postgis/trunk postgis-svn 1> /dev/null
  cd $OLDPWD

  echo "    Installation de postgis2"
  cd /usr/local/src/postgis-svn
  ./autogen.sh 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn
  ./configure 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn
  make 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn
  make install 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn
  make comments 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn
  make cheatsheets 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn/extensions
  make 1> /dev/null
  cd $OLDPWD
  cd /usr/local/src/postgis-svn/extensions
  make install 1> /dev/null
  cd $OLDPWD

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02b-postgis.log
fi


######
# main
#echo "  Main"
#echo "    Installation de gmt"
#echo y | aptitude install gmt/stable 1> /dev/null
#echo y | aptitude install gmt-coast-low/stable 1> /dev/null
#echo y | aptitude install gmt-examples/stable 1> /dev/null
#echo "    Installation de mapnik"
#echo y | aptitude install python-mapnik 1> /dev/null

#echo "    Installation de postgresql"
#echo y | aptitude install postgresql-common 1> /dev/null

#echo "    Installation de postgis"
#echo y | aptitude install postgis \
#                          postgresql-8.4-postgis 1> /dev/null
#echo "    Installation de postgresql-dev"
#echo y | aptitude install postgresql-server-dev-8.4 1> /dev/null

#######
# other
#echo "  Other"
#echo "    Installation de imagemagick"
#echo y | aptitude install imagemagick 1> /dev/null

#echo "    Installation des dépendances pour geonode"
#aptitude install sun-java6-jre #1> /dev/null
#echo y | aptitude install openjdk-6-jre 1> /dev/null
#echo y | aptitude install tomcat6 1> /dev/null

#echo "    Installation de postgis"
#echo y | aptitude install postgis \
#                          postgresql-8.4-postgis 1> /dev/null
