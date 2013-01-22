#!/bin/sh

# Première partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02z.sh : Installation de debian-gis (Partie 2z)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-librairiesraster.log ]
then
  ######
  # main
  echo "  librairiesraster"
  echo "    Installation des librairies pour le support du raster dans postgis2"
  echo "      Installation de libarmadillo-dev"
  echo y | aptitude install libarmadillo-dev #1> /dev/null
  echo "      Installation de libpoppler-dev"
  echo y | aptitude install libpoppler-dev #1> /dev/null
  echo "      Installation de libfreexl-dev"
  echo y | aptitude install libfreexl-dev #1> /dev/null
  echo "      Installation de libepsilon-dev"
  echo y | aptitude install libepsilon-dev #1> /dev/null
  echo "      Installation de libkml-dev"
  echo y | aptitude install libkml-dev #1> /dev/null
  echo "      Installation de libzip-dev"
  echo y | aptitude install libzip-dev #1> /dev/null
  echo "      Installation de liburiparser-dev"
  echo y | aptitude install liburiparser-dev #1> /dev/null
  echo "      Installation de libogdi3.2-dev"
  echo y | aptitude install libogdi3.2-dev #1> /dev/null
  echo "      Installation de liblzma-dev"
  echo y | aptitude install liblzma-dev #1> /dev/null

  echo "    Installation des outils pour generer la documentation lors de la compilation"
  echo "      Installation de xsltproc"
  echo y | aptitude install xsltproc #1> /dev/null
  echo "      Installation de dblatex"
  echo y | aptitude install dblatex #1> /dev/null
  echo "      Installation de docbook-xsl"
  echo y | aptitude install docbook-xsl #1> /dev/null
  echo "      Installation de libjson0-dev"
  echo y | aptitude install libjson0-dev #1> /dev/null
  echo "      Installation de libcunit1-dev"
  echo y | aptitude install libcunit1-dev #1> /dev/null
  echo "      Installation de libxml2-dev"
  echo y | aptitude install libxml2-utils #1> /dev/null

  echo "    Suppression de l'editeur ed dans le fichier des alternatives"
  update-alternatives --remove editor /bin/ed #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-librairiesraster.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-imagemagick.log ]
then
  ######
  # main
  echo "  imagemagick"
  echo "    Installation de imagemagick"
  echo y | aptitude install imagemagick/testing #1> /dev/null
  # libmagickcore5-extra nous permettra de manipuler le format
  # SVG
  echo y | aptitude install libmagickcore5-extra #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-imagemagick.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-librairiesgeo.log ]
then
  ######
  # main
  echo "  librairiesgeo"
  echo "    Installation des librairies geographiques"
  echo "    Installation de geos"
  echo y | aptitude install libgeos-c1/testing #1> /dev/null
  echo y | aptitude install libltdl7/testing #1> /dev/null
  echo y | aptitude install libgfortran3/testing #1> /dev/null
  echo y | aptitude install mysql-common/testing #1> /dev/null
  echo "    Installation des librairies lib*-dev : xml2, geos, proj et gdal"
  echo "      Installation de libxml2-dev"
  echo y | aptitude install libxml2-dev #1> /dev/null
  echo "      Installation de libgeos-dev"
  echo y | aptitude install libgeos-dev #1> /dev/null
  echo "      Installation de libproj-dev"
  echo y | aptitude install libproj-dev #1> /dev/null
  echo "      Installation de libgdal-dev"
  echo y | aptitude install libgdal-dev #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-librairiesgeo.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-utilitairesgeo.log ]
then
  ######
  # main
  echo "  utilitairesgeo"
  echo "    Installation des utilitaires geographiques"
  echo "    Installation de proj"
  echo y | aptitude install proj-bin #1> /dev/null
  echo "    Installation de gdal"
  echo y | aptitude install gdal-bin/testing #1> /dev/null
  echo y | aptitude install python-numpy/testing #1> /dev/null
  echo y | aptitude install python-gdal/testing #1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-utilitairesgeo.log
fi



if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-mapnik.log ]
then
  ######
  # main
  echo "  mapnik"
  echo "    Installation de libmapnik2"
  echo y | aptitude install libmapnik2-2.0/testing #1> /dev/null
  echo "    Installation de python-mapnik2"
  echo y | aptitude install python-lxml/testing #1> /dev/null
  echo y | aptitude install python-cairo/testing #1> /dev/null
  echo y | aptitude install python-mapnik2/testing #1> /dev/null
  echo "    Installation de mapnik-utils"
  echo y | aptitude install mapnik-utils/testing #1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-mapnik.log
fi



if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-apache.log ]
then
  #######
  # other
  echo "  apache"
  echo "    Installation d'apache"
  echo y | aptitude install apache2 #1> /dev/null
  echo y | aptitude install libapache2-mod-ldap-userdir #1> /dev/null
  a2enmod userdir
  #echo y | aptitude install libapache2-mod-wsgi #1> /dev/null
  #a2enmod wsgi
  /etc/init.d/apache2 restart

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-apache.log
fi



if [ ! -e /var/log/fg/fgaptitudeinstallgis02z-postgis.log ]
then
  ######
  # main
  echo "  postgis"
  echo "    Installation de postgresql et des librairies libpq"
  echo "      Installation de postgresql"
  echo y | aptitude install postgresql-common/experimental \
                            postgresql-client-common/experimental \
                            postgresql-9.2/experimental \
                            postgresql-client-9.2/experimental #1> /dev/null
  echo "      Installation de libpq5 et libpq-dev"
  echo y | aptitude install libpq5/experimental \
                            libpq-dev/experimental #1> /dev/null
  echo "      Installation de postgresql-server-dev"
  echo y | aptitude install postgresql-server-dev-9.2/experimental #1> /dev/null

  echo "    Téléchargement des sources de postgis2"
  cd /usr/local/src
  svn co http://svn.osgeo.org/postgis/trunk postgis-svn #1> /dev/null
  cd $OLDPWD

  echo "    Compilation et Installation de postgis2"
  echo "      ./autogen.sh"
  cd /usr/local/src/postgis-svn
  ./autogen.sh #1> /dev/null
  cd $OLDPWD
  echo "      ./configure"
  cd /usr/local/src/postgis-svn
  ./configure #1> /dev/null
  cd $OLDPWD
  echo "      ./make"
  cd /usr/local/src/postgis-svn
  make #1> /dev/null 2> /dev/null
  cd $OLDPWD
  echo "      ./make check"
  cd /usr/local/src/postgis-svn
  sudo -u postgres dropuser root
  sudo -u postgres createuser -s root
  make check #1> /dev/null
  sudo -u postgres dropuser root
  cd $OLDPWD
  echo "      ./make install"
  cd /usr/local/src/postgis-svn
  make install #1> /dev/null 2>/dev/null
  cd $OLDPWD
  echo "      ./make comments"
  cd /usr/local/src/postgis-svn
  make comments #1> /dev/null
  cd $OLDPWD
  echo "      ./make comments-install"
  cd /usr/local/src/postgis-svn
  make comments-install #1> /dev/null
  cd $OLDPWD
  echo "      ./make cheatsheets"
  cd /usr/local/src/postgis-svn
  make cheatsheets #1> /dev/null
  cd $OLDPWD
  echo "      ./make"
  cd /usr/local/src/postgis-svn/extensions
  make #1> /dev/null
  cd $OLDPWD
  echo "      ./make install"
  cd /usr/local/src/postgis-svn/extensions
  make install #1> /dev/null
  cd $OLDPWD
  echo "    Creation d'une database template postgis"
  sudo -u postgres createdb templatepostgis
  sudo -u postgres psql -d templatepostgis -c "CREATE EXTENSION postgis;"
  sudo -u postgres psql -d templatepostgis -c "CREATE EXTENSION postgis_topology;"

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02z-postgis.log
fi


