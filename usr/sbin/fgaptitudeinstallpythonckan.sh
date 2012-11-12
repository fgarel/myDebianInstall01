#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

# création de l'environnement ckan
echo "fgaptitudeinstallpythonckan : Création de l'environnement ckan"
mkdir $HOME/.virtualenvs 2> /dev/null
cd $HOME/.virtualenvs
virtualenv --python=python2.7 \
           --clear \
           --no-site-packages \
           --distribute \
           ckan

# on "source" pour se mettre dans l'environnement python
. $HOME/.virtualenvs/ckan/bin/activate

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
echo "  Install de ckan"
#pip install --proxy="10.5.10.23:3128" ckan 1> /dev/null
#pip install ckan 1> /dev/null
pip install --ignore-installed -e git+https://github.com/okfn/ckan.git#egg=ckan
pip install --ignore-installed -r ckan/src/ckan/requires/lucid_missing.txt -r src/ckan/requires/lucid_conflict.txt
pip install webob==1.0.8
pip install --ignore-installed -r ckan/src/ckan/requires/lucid_present.txt
#cd $OLDPWD

echo "  ... tion de l'environnement ckan done"
echo 
echo "Pour activer l'environnement python, il faut executer :"
echo 
echo "source $HOME/.virtualenvs/ckan/bin/activate"

