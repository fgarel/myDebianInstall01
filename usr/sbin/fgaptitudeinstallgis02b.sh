#!/bin/sh

# Seconde partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "fgaptitudeinstallgis02b.sh :             Installation de debian-gis (Partie 02b)"

if [ ! -e /var/log/fg/fgaptitudeinstallgis02b.log ]
then
  ######
  echo "    Suppression de l'editeur ed dans le fichier des alternatives"
  update-alternatives --remove editor /bin/ed 1> /dev/null

  echo "    Activation du module userdir pour Apache"
  a2enmod userdir
  /etc/init.d/apache2 restart

  echo "    Ajout de l'utilisateur garel au groupe lpadmin"
  adduser garel lpadmin

  echo "    Téléchargement des sources de postgis2"
  cd /usr/local/src
  svn co http://svn.osgeo.org/postgis/trunk postgis-svn 1> /dev/null
  cd $OLDPWD

  echo "    Compilation et Installation de postgis2"
  echo "      ./autogen.sh"
  cd /usr/local/src/postgis-svn
  ./autogen.sh 1> /dev/null
  cd $OLDPWD
  echo "      ./configure"
  cd /usr/local/src/postgis-svn
  ./configure 1> /dev/null
  cd $OLDPWD
  echo "      ./make"
  cd /usr/local/src/postgis-svn
  make 1> /dev/null 2> /dev/null
  cd $OLDPWD
  echo "      ./make check"
  cd /usr/local/src/postgis-svn
  #sudo -u postgres dropuser root
  sudo -u postgres createuser -s root
  make check 1> /dev/null
  sudo -u postgres dropuser root
  cd $OLDPWD
  echo "      ./make install"
  cd /usr/local/src/postgis-svn
  make install 1> /dev/null 2>/dev/null
  cd $OLDPWD
  echo "      ./make comments"
  cd /usr/local/src/postgis-svn
  make comments 1> /dev/null
  cd $OLDPWD
  echo "      ./make comments-install"
  cd /usr/local/src/postgis-svn
  make comments-install 1> /dev/null
  cd $OLDPWD
  echo "      ./make cheatsheets"
  cd /usr/local/src/postgis-svn
  make cheatsheets 1> /dev/null
  cd $OLDPWD
  echo "      ./make"
  cd /usr/local/src/postgis-svn/extensions
  make 1> /dev/null
  cd $OLDPWD
  echo "      ./make install"
  cd /usr/local/src/postgis-svn/extensions
  make install 1> /dev/null
  cd $OLDPWD
  echo "    Creation d'une database template postgis"
  sudo -u postgres createdb templatepostgis
  sudo -u postgres psql -d templatepostgis -c "CREATE EXTENSION postgis;"
  sudo -u postgres psql -d templatepostgis -c "CREATE EXTENSION postgis_topology;"
  echo "    Creation d'un utilisateur contrib et d'une database dbmapnik"
  sudo -u postgres createuser -s contrib
  sudo -u postgres psql -d templatepostgis -c "ALTER ROLE contrib with password 'alambic';"
  sudo -u postgres createdb -O contrib -T templatepostgis dbmapnik
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallgis02b.log
fi

