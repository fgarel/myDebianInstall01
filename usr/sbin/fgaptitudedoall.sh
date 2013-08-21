#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "fgaptitudedoall.sh :                    Actions commencées lors de l'installation automatique + Actions manuelles"

# installations pouvant être executées par le debian installer
fgaptitude-preseed.sh
fgaptitude-gisuser-preseed.sh

# installations ne pouvant pas être executées par le debian installer
fgaptitude-postpreseed.sh
fgaptitude-gisuser-postpreseed.sh

