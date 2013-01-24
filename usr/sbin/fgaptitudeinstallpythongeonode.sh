#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

# création de l'environnement geonode
echo "fgaptitudeinstallpythongeonode.sh :     Création de l'environnement geonode"

mkdir $HOME/.virtualenvs 2> /dev/null
cd $HOME/.virtualenvs
virtualenv --python=python2.7 \
           --clear \
           --no-site-packages \
           --distribute \
           geonode

# on "source" pour se mettre dans l'environnement python
. $HOME/.virtualenvs/geonode/bin/activate

# une fois dans l'environnement geonode, on installe quelques modules
echo "  Upgrade de pip"
#pip install --upgrade --proxy="10.5.10.23:3128" pip 1> /dev/null
pip install --upgrade pip 1> /dev/null
echo "  Upgrade de distribute"
#pip install --upgrade --proxy="10.5.10.23:3128" distribute 1> /dev/null
pip install --upgrade distribute 1> /dev/null
echo "  Install de pylint"
#pip install --proxy="10.5.10.23:3128" pylint 1> /dev/null
pip install pylint 1> /dev/null
echo "  Install de imgaging"
#pip install --proxy="10.5.10.23:3128" imaging 1> /dev/null
pip install imaging 1> /dev/null
echo "  Install de reportlab"
#pip install --proxy="10.5.10.23:3128" reportlab 1> /dev/null
pip install reportlab 1> /dev/null
echo "  Install de urlgrabber"
#pip install --proxy="10.5.10.23:3128" urlgrabber 1> /dev/null
pip install urlgrabber 1> /dev/null
echo "  Install de pastescript"
#pip install --proxy="10.5.10.23:3128" pastescript 1> /dev/null
pip install pastescript 1> /dev/null
echo "  Install de psycopg2"
#pip install --proxy="10.5.10.23:3128" psycopg2 1> /dev/null
pip install psycopg2 1> /dev/null
#cd $OLDPWD

echo "  ... tion de l'environnement geonode done"
echo 
echo "Pour activer l'environnement python, il faut executer :"
echo 
echo "source $HOME/.virtualenvs/geonode/bin/activate"

