#!/bin/sh

# Seconde partie des applications "gis"

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

###########################################
echo "Installation de debian-gis (2de partie)"

######
# main
echo "  Main"
echo "    Installation de gmt"
echo y | aptitude install gmt/stable 1> /dev/null
echo y | aptitude install gmt-coast-low/stable 1> /dev/null
echo y | aptitude install gmt-examples/stable 1> /dev/null
echo "    Installation de mapnik"
echo y | aptitude install python-mapnik 1> /dev/null

echo "    Installation de postgresql"
echo y | aptitude install postgresql-common 1> /dev/null

echo "    Installation de postgis"
echo y | aptitude install postgis \
                          postgresql-8.4-postgis 1> /dev/null
echo "    Installation de postgresql-dev"
echo y | aptitude install postgresql-server-dev-8.4 1> /dev/null

#######
# other
echo "  Other"
echo "    Installation de imagemagick"
echo y | aptitude install imagemagick 1> /dev/null

echo "    Installation des dépendances pour geonode"
#aptitude install sun-java6-jre #1> /dev/null
echo y | aptitude install openjdk-6-jre 1> /dev/null
#echo y | aptitude install tomcat6 1> /dev/null
