#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "bfsys.sh :                    blueflamingo systeme"

# installations pouvant être executées par le debian installer
#fgaptitude-preseed.sh
bfsys-preseed.sh
#fgaptitude-gisuser-preseed.sh

# installations ne pouvant pas être executées par le debian installer
#fgaptitude-postpreseed.sh
#fgaptitude-gisuser-postpreseed.sh

