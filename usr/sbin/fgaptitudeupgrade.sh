#!/bin/sh

# Mise à jour du noyau
echo "Mise à jour du noyau"
echo y | aptitude install linux-image-2.6-486 1> /dev/null
aptitude remove linux-image-2.6-686 1> /dev/null

# aptitude upgrade

# aptitude safe-upgrade
echo "Aptitude safe-upgrade"
#echo y | aptitude safe-upgrade 1> /dev/null
echo "... tude safe-upgrade done"

# aptitude full-upgrade
echo "Aptitude full-upgrade"
echo y | aptitude full-upgrade 1> /dev/null
echo "... tude full-upgrade done"
