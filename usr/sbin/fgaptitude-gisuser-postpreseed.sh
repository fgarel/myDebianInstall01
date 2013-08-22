#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "fgaptitude-gisuser-postpreseed.sh :                     Actions manuelles"

mkdir /var/log/fg 2> /dev/null

# installation de quelques applications et utilitaires
# spécifiques au domaine du sig
fgaptitudemakeinstall2.sh
fgaptitudeinstallgis02a.sh
fgaptitudeinstallgis02b.sh



