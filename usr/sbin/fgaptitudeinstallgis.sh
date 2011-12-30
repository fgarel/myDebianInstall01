#!/bin/sh

####################################################################################
# http://qa.debian.org/developer.php?login=pkg-grass-devel%40lists.alioth.debian.org
#
echo "Installation de debian-gis"

######
# main
echo "  main"
#echo y | aptitude install avce00 1> /dev/null
#echo y | aptitude install dans-gdal-scripts/testing 1> /dev/null
#echo y | aptitude install debian-gis 1> /dev/null
#echo y | aptitude install drawmap 1> /dev/null
#echo y | aptitude install e00compr/testing 1> /dev/null
#echo y | aptitude install earth3d/testing 1> /dev/null
#echo y | aptitude install epr-api/testing 1> /dev/null
echo "    Installation de gdal"
echo y | aptitude install gdal-bin/testing \
                          python-gdal/testing 1> /dev/null
#echo y | aptitude install geographiclib/testing 1> /dev/null
#echo y | aptitude install geos/testing 1> /dev/null
echo "    Installation de gmt"
echo y | aptitude install gmt/stable 1> /dev/null
echo y | aptitude install gmt-coast-low/stable 1> /dev/null
echo y | aptitude install gmt-examples/stable 1> /dev/null
#echo y | aptitude install gosmore 1> /dev/null
#echo y | aptitude install gpsdrive 1> /dev/null
#echo y | aptitude install gpsprune/testing 1> /dev/null
#echo y | aptitude install gpx2shp 1> /dev/null
#echo y | aptitude install grass/testing 1> /dev/null
#echo y | aptitude install h5utils 1> /dev/null
#echo y | aptitude install hdf5/testing 1> /dev/null
#echo y | aptitude install josm/testing 1> /dev/null
#echo y | aptitude install josm-plugins/testing 1> /dev/null
#echo y | aptitude install jts 1> /dev/null
#echo y | aptitude install libepsilon/testing 1> /dev/null
#echo y | aptitude install libgdal-grass/testing 1> /dev/null
#echo y | aptitude install libgeotiff-dfsg 1> /dev/null
#echo y | aptitude install libgrits/testing 1> /dev/null
#echo y | aptitude install libhdf4/testing 1> /dev/null
#echo y | aptitude install libkml/testing 1> /dev/null
#echo y | aptitude install liblas/testing 1> /dev/null
#echo y | aptitude install librasterlite/testing 1> /dev/null
#echo y | aptitude install libterralib/unstable 1> /dev/null
#echo "    Installation de mapnik"
#echo y | aptitude install python-mapnik 1> /dev/null
#echo y | aptitude install mapnik-viewer/testing 1> /dev/null
#echo y | aptitude install mapserver/unstable 1> /dev/null
#echo y | aptitude install mkgmap 1> /dev/null
#echo y | aptitude install mkgmapgui/testing 1> /dev/null
#echo y | aptitude install modestmaps-py/testing 1> /dev/null
#echo y | aptitude install narray-miss/testing 1> /dev/null
#echo y | aptitude install ncview 1> /dev/null
#echo y | aptitude install netcdf 1> /dev/null
#echo y | aptitude install ogdi-dfsg/testing 1> /dev/null
#echo y | aptitude install osgearth/unstable 1> /dev/null
#echo y | aptitude install osm2pgsql/testing 1> /dev/null
#echo y | aptitude install osmosis 1> /dev/null
#echo y | aptitude install ossim/testing 1> /dev/null
#echo y | aptitude install postgis/squeeze-backports 1> /dev/null
#echo "    Installation de postgresql"
#echo y | aptitude install postgresql-common 1> /dev/null

#echo "    Installation de postgis"
#echo y | aptitude install postgis \
#                          postgresql-8.4-postgis 1> /dev/null
#echo "    Installation de postgresql-dev"
#echo y | aptitude install postgresql-server-dev-8.4 1> /dev/null
#cd /usr/local/src
#svn co http://svn.osgeo.org/postgis/trunk postgis-svn
#cd $OLDPWD
#cd /usr/local/src/postgis-svn
#touch test
#cd $OLDPWD
echo "    Installation de proj"
echo y | aptitude install proj-bin 1> /dev/null
#echo y | aptitude install pyepr/testing 1> /dev/null
#echo y | aptitude install python-liblas 1> /dev/null
#echo y | aptitude install python-pyproj/testing 1> /dev/null
#echo y | aptitude install qgis/unstable 1> /dev/null
#echo y | aptitude install ruby-hdfeos5/testing 1> /dev/null
#echo y | aptitude install ruby-narray-miss/testing 1> /dev/null
#echo y | aptitude install ruby-netcdf/testing 1> /dev/null
#echo y | aptitude install saga 1> /dev/null
#echo y | aptitude install savi/testing 1> /dev/null
#echo y | aptitude install shapelib 1> /dev/null
#echo y | aptitude install spatialindex 1> /dev/null
#echo y | aptitude install spatialite 1> /dev/null
#echo y | aptitude install spatialite-gui/testing 1> /dev/null
#echo y | aptitude install thuban 1> /dev/null
#echo y | aptitude install tilecache/testing 1> /dev/null
#echo y | aptitude install tilestache/testing 1> /dev/null


##########
# non-free
echo "  non-free"
#echo y | aptitude install libgeotiff-epsg 1> /dev/null


######
# ddpo
echo "  ddpo"
#echo y | aptitude install grace6 1> /dev/null
#echo y | aptitude install gts/testing 1> /dev/null
#echo y | aptitude install gypsy 1> /dev/null
#echo y | aptitude install ircmarkers 1> /dev/null
#echo y | aptitude install jama/unstable 1> /dev/null
#echo y | aptitude install kflog 1> /dev/null
#echo y | aptitude install opencv/testing 1> /dev/null


#####
# gps
echo "  gps"
#echo y | aptitude install gpsbabel/testing 1> /dev/null
#echo y | aptitude install gpscorrelate 1> /dev/null
#echo y | aptitude install gpsd/testing 1> /dev/null
#echo y | aptitude install gpsman 1> /dev/null
#echo y | aptitude install gpstrans 1> /dev/null
#echo y | aptitude install mtkbabel 1> /dev/null
#echo y | aptitude install navit/testing 1> /dev/null
#echo y | aptitude install openbmap-logger 1> /dev/null
#echo y | aptitude install klandkartegt/testing 1> /dev/null


#####
# osm
echo "  osm"
#echo y | aptitude install merkaartor/testing 1> /dev/null
#echo y | aptitude install openstreetmap-map-icons/testing 1> /dev/null
#echo y | aptitude install viking/testing 1> /dev/null


############
# statistics
echo "  statistics"
#echo y | aptitude install r-cran-mapdata/testing 1> /dev/null
#echo y | aptitude install r-cran-mapproj/testing 1> /dev/null
#echo y | aptitude install r-cran-maps/testing 1> /dev/null
#echo y | aptitude install r-cran-sp/testing 1> /dev/null


#############
# workstation
echo "  workstation"
#echo y | aptitude install geoip/testing 1> /dev/null
#echo y | aptitude install googleearth-package 1> /dev/null
#echo y | aptitude install gpsmanshp 1> /dev/null
#echo y | aptitude install grace/testing 1> /dev/null
#echo y | aptitude install openjump 1> /dev/null
#echo y | aptitude install openscenegraph/testing 1> /dev/null
#echo y | aptitude install osm-gps-map/testing 1> /dev/null
#echo y | aptitude install s3d/testing 1> /dev/null


#######
# other
echo "  other"
#echo "    Installation d'openlayers"
#echo y | aptitude install  1> /dev/null
#echo "    Installation de geoextjs"
#echo "    Installation de sencha touch"
echo "    Installation d'apache"
echo y | aptitude install apache2 1> /dev/null
echo y | aptitude install libapache2-mod-ldap-userdir 1> /dev/null
a2enmod userdir
echo y | aptitude install libapache2-mod-wsgi 1> /dev/null
a2enmod wsgi
/etc/init.d/apache2 restart
echo "    Installation de wordmill"
echo "    Installation de descartes"
echo "    Installation de mapnik-utils"
echo "    Installation de sphinxsearch"
echo y | aptitude install sphinxsearch 1> /dev/null
#sed -i -e 's/^\ttype\t\t\t\t= mysql$/\ttype\t\t\t\t= pgsql/g' /etc/sphinxsearch/sphinx.conf
sed -i -e 's/^START=no$/START=yes/g' /etc/default/sphinxsearch

echo "    Installation de mercurial"
echo y | aptitude install mercurial 1> /dev/null
echo "    Installation de trac"
echo y | aptitude install trac-bitten \
                          trac \
                          trac-mercurial 1> /dev/null
echo "    Installation de jdonref"

echo "    Installation de imagemagick"
echo y | aptitude install imagemagick 1> /dev/null

echo "    Installation des dépendances pour geonode"
#aptitude install sun-java6-jre #1> /dev/null
echo y | aptitude install openjdk-6-jre 1> /dev/null
#echo y | aptitude install tomcat6 1> /dev/null


