#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

echo "Installation de python"
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
#echo y | aptitude clean  1> /dev/null
#echo y | aptitude purge ~c  1> /dev/null
#echo y | aptitude clean  1> /dev/null


echo "  Installation de python"
echo y | aptitude install python \
                          python-dev \
                          python-setuptools 1> /dev/null

echo y | aptitude install libboost-python-dev 1> /dev/null
#echo "Installation de virtualenvwrapper"
#aptitude install virtualenvwrapper \
#                 python-virtualenv \
#                 python3-setuptools #1> /dev/null
#echo "Installation de python-setuptools"
#echo y | aptitude install python-setuptools 1> /dev/null

echo "  Installation de distribute virtualenv"
easy_install -q distribute
easy_install -q virtualenv
#easy_install pip
#easy_install virtualenvwrapper



