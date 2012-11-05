#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

echo "fgaptitudeinstallpython : Installation de python"

mkdir /var/log/fg 2> /dev/null
#echo "  Installation de python"
# Suppression des environnements
#echo "  Suppression des environnements python"
#rm -rf $HOME/virtualenvs
#mkdir $HOME/virtualenvs 2> /dev/null

# Suppression de python3
#echo "  Suppression de python3"
#echo y | aptitude remove python3 \
#                         python3-dev \
#                         python3-setuptools 1> /dev/null
#echo y | aptitude clean  1> /dev/null
#echo y | aptitude purge ~c  1> /dev/null
#echo y | aptitude clean  1> /dev/null


# Suppression de python
#echo "  Suppression de python"
#echo y | aptitude remove python \
#                         python-dev \
#                         python-setuptools 1> /dev/null
#echo y | aptitude remove python2.7 \
#                         python2.7-dev \
#                         libexpat1-dev/testing \
#                         zlib1g-dev/testing 1> /dev/null
#echo y | aptitude remove libboost-python-dev/testing 1> /dev/null
#echo y | aptitude clean  1> /dev/null
#echo y | aptitude purge ~c  1> /dev/null
#echo y | aptitude clean  1> /dev/null


if [ ! -e /var/log/fg/fgaptitudeinstallpython-python.log ]
then
  echo "  Installation de python"
  echo y | aptitude install python-minimal/testing \
                            python/testing \
                            python-dev/testing \
                            libexpat1-dev/testing \
                            zlib1g-dev/testing 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpython-python.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallpython-libboost.log ]
then
  echo "  Installation de libboost-python-dev"
  echo y | aptitude install libboost-python-dev/testing 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpython-libboost.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallpython-setuptools.log ]
then
  echo "  Installation de python-setuptools"
  echo y | aptitude install python-setuptools/testing python-pkg-resources/testing 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpython-setuptools.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallpython-virtualenv.log ]
then
  echo "  Installation de distribute et virtualenv"
  easy_install -q distribute
  easy_install -q virtualenv
  #easy_install pip
  #easy_install virtualenvwrapper
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallpython-virtualenv.log
fi



