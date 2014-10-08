#!/bin/sh

echo "bfaptitudeupgrade-preseed.sh :                Mise à jour"
if [ ! -e /var/log/bf/bfaptitudeupgrade-upgrade.log ]
then
  echo "  Aptitude full-upgrade"
  #echo y | aptitude full-upgrade #1> /dev/null
  echo "  ... tude full-upgrade done"
  date +"%F %T" >> /var/log/bf/bfaptitudeupgrade-upgrade.log
fi
