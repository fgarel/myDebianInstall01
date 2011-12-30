#!/bin/sh


#########################
# Installation de jumanji
echo "Installation de jumanji"
git clone git://pwmt.org/jumanji.git /usr/local/bin/jumanji
cd /usr/local/bin/jumanji
# configure
# make
# make install
cd $OLDPWD

###########################
# Installation d'openlayers
echo "Installation d'openlayers"
#echo y | aptitude install apache2 1> /dev/null

##########################
# Installation de geoextjs
echo "Installation de geoextjs"
#echo y | aptitude install apache2 1> /dev/null

##############################
# Installation de sencha touch
echo "Installation de sencha touch"
#echo y | aptitude install apache2 1> /dev/null
