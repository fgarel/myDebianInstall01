#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

# création de l'environnement geopy
echo "fgaptitudeinstallpythongeopy.sh :       Création de l'environnement geopy"
mkdir $HOME/.virtualenvs 2> /dev/null
cd $HOME/.virtualenvs
virtualenv --python=python2.7 \
           --clear \
           --no-site-packages \
           --distribute \
           geopy

# on "source" pour se mettre dans l'environnement python
. $HOME/.virtualenvs/geopy/bin/activate

# une fois dans l'environnement pyramid, on installe quelques modules
echo "  Upgrade de pip"
#pip install --upgrade --proxy="10.5.10.23:3128" pip 1> /dev/null
pip install --upgrade pip 1> /dev/null
echo "  Upgrade de distribute"
#pip install --upgrade --proxy="10.5.10.23:3128" distribute 1> /dev/null
pip install --upgrade distribute 1> /dev/null
echo "  Install de pylint"
#pip install --proxy="10.5.10.23:3128" pylint 1> /dev/null
pip install pylint 1> /dev/null
echo "  Install de geopy"
#pip install --proxy="10.5.10.23:3128" geopy 1> /dev/null
pip install geopy 1> /dev/null
#cd $OLDPWD

echo "  ... tion de l'environnement geopy done"
echo 
echo "Pour activer l'environnement python, il faut executer :"
echo 
echo "source $HOME/.virtualenvs/geopy/bin/activate"

