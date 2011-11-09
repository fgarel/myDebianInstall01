#!/bin/sh

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#

export http_proxy=http://10.5.10.23:3128/
export https_proxy=http://10.5.10.23:3128/


sed -i -e 's/# http-proxy-host = defaultproxy.whatever.com/http-proxy-host = 10.5.10.23/g' $HOME/.subversion/servers
sed -i -e 's/# http-proxy-port = 7000/http-proxy-port = 3128/g' $HOME/.subversion/servers

echo "Installation de debian-gis 2"

######
# main

echo "    Installation d'openlayers"
#echo y | aptitude install  1> /dev/null
cd $HOME/public_html/openlayers/lib/
#pwd
#echo HOME = $HOME
wget -nv -q -N http://openlayers.org/api/OpenLayers.js
svn -q checkout http://svn.openlayers.org/trunk/openlayers/ openlayers2
git clone --progress --verbose https://github.com/openlayers/openlayers.git openlayers3
cd openlayers3
git fetch --progress --verbose
#cd $OLDPWD

echo "    Installation de mapstraction"
#echo y | aptitude install  1> /dev/null
cd $HOME/public_html/mapstraction/lib
git clone --progress --verbose https://github.com/mapstraction/mxn.git
cd mxn
git fetch --progress --verbose
#cd $OLDPWD

echo "    Installation de geonode"
cd $HOME/travail/docInterne/geonode
#wget -nv -q -N http://dev.geonode.org/release/GeoNode-1.1-RC1.tar.gz -O GeoNode-1.1-RC1.tar.gz
tar -xzvf GeoNode-1.1-RC1.tar.gz
#cd $OLDPWD

echo "    Installation de geoextjs"
echo "    Installation de sencha touch"



