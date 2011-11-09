#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

# création de l'environnement pyramid
echo "  Création de l'environnement pyramid"
mkdir $HOME/virtualenvs 2> /dev/null
cd $HOME/virtualenvs
virtualenv --python=python2.6 \
           --clear \
           --no-site-packages \
           --distribute \
           pyramid

# on "source" pour se mettre dans l'environnement python
. $HOME/virtualenvs/pyramid/bin/activate

# une fois dans l'environnement pyramid, on installe quelques modules
echo "    Upgrade de pip"
pip install --upgrade --proxy="10.5.10.23:3128" pip 1> /dev/null
echo "    Upgrade de distribute"
pip install --upgrade --proxy="10.5.10.23:3128" distribute 1> /dev/null
echo "    Install de pylint"
pip install --proxy="10.5.10.23:3128" pylint 1> /dev/null
echo "    Install de pyramid"
pip install --proxy="10.5.10.23:3128" pyramid 1> /dev/null
#cd $OLDPWD

echo "  ... tion de l'environnement pyramid done"
echo 
echo "Pour activer l'environnement python, il faut executer :"
echo 
echo "source $HOME/virtualenvs/pyramid/bin/activate"

