#!/bin/sh

#######################
# Installation d'apache
echo "Installation d'apache"
echo y | aptitude install apache2 1> /dev/null

###########################
# Installation de tilecache
echo "Installation de tilecache"
echo y | aptitude install tilecache 1> /dev/null

###########################
# Installation de mapserver
echo "Installation de mapserver"
echo y | aptitude install cgi-mapserver 1> /dev/null
