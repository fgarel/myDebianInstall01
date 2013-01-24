#!/bin/sh

echo "fgaptitudeupgrade01.sh :                Mise à jour"
if [ ! -e /var/log/fg/fgaptitudeupgrade-upgrade.log ]
then
  echo "  Aptitude full-upgrade"
  #echo y | aptitude full-upgrade #1> /dev/null
  echo "  ... tude full-upgrade done"
  date +"%F %T" >> /var/log/fg/fgaptitudeupgrade-upgrade.log
fi
