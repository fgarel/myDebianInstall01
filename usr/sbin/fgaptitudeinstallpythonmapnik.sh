#!/bin/sh
# attention, il le shellbang doit etre bash, car on utilise dans ce script
# une commande "source" qui ne semble pas fonctionnr si le shellbang est /bin/sh

# création de l'environnement mapnik
echo "fgaptiudeinstallpythonmapnik : Création de l'environnement mapnik"
mkdir $HOME/.virtualenvs 2> /dev/null
cd $HOME/.virtualenvs
virtualenv --python=python2.7 \
           --clear \
           --no-site-packages \
           --distribute \
           mapnik

# on "source" pour se mettre dans l'environnement python
. $HOME/.virtualenvs/mapnik/bin/activate

# une fois dans l'environnement mapnik, on installe quelques modules
echo "  Upgrade de pip"
#pip install --upgrade --proxy="10.5.10.23:3128" pip 1> /dev/null
pip install --upgrade pip 1> /dev/null
echo "  Upgrade de distribute"
#pip install --upgrade --proxy="10.5.10.23:3128" distribute 1> /dev/null
pip install --upgrade distribute 1> /dev/null
echo "  Install de pylint"
#pip install --proxy="10.5.10.23:3128" pylint 1> /dev/null
pip install pylint 1> /dev/null
echo "  Install de nik2img"
#pip install --proxy="10.5.10.23:3128" nik2img 1> /dev/null
pip install nik2img 1> /dev/null
echo "  Install de invar"
#pip install --proxy="10.5.10.23:3128" invar 1> /dev/null
pip install invar 1> /dev/null
echo "  Install de tilelite"
#pip install --proxy="10.5.10.23:3128" tilelite 1> /dev/null
pip install tilelite 1> /dev/null
echo "  Install de cascadenik"
#pip install --proxy="10.5.10.23:3128" cascadenik 1> /dev/null
pip install cascadenik 1> /dev/null
echo "  Install de landez"
#pip install --proxy="10.5.10.23:3128" landez 1> /dev/null
pip install landez 1> /dev/null
echo "  Install de tilelive"
#pip install --proxy="10.5.10.23:3128" tilelive 1> /dev/null
pip install tilelive 1> /dev/null
echo "  Install de mapnik2"
#pip install --proxy="10.5.10.23:3128" mapnik2 1> /dev/null
pip install mapnik2 1> /dev/null
echo "  Install de nikinfo"
#pip install --proxy="10.5.10.23:3128" nikinfo 1> /dev/null
pip install nikinfo 1> /dev/null
echo "  Install de Nikweb"
#pip install --proxy="10.5.10.23:3128" Nikweb 1> /dev/null
pip install Nikweb 1> /dev/null
#cd $OLDPWD

echo "  ... tion de l'environnement mapnik done"
echo 
echo "Pour activer l'environnement python, il faut executer :"
echo 
echo "source $HOME/.virtualenvs/mapnik/bin/activate"

