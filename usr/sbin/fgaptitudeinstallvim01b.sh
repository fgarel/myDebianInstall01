#!/bin/sh


# Installation et configuration de vim
###########################################
echo "fgaptitudeinstallvim01b.sh : Installation et configuration de vim"

mkdir /var/log/fg 2> /dev/null

# on fabrique en premier nos fichiers .local
# puis, on utilisera le script spf13-vim3
# Quand on travaille dans cet ordre, alors l'installation
# (commande BundleInstall) prend en compte nos fichiers .local

# fabrication du fichier ~/.vimrc.local
#######################################
echo '" sous-fichier de configuration de l apparence' > ~/.vimrc.local
echo 'source ~/.vimrc.local.d/theme.vim' >> ~/.vimrc.local
echo '" sous-fichier de configuration de vos fonctions personnelles par exemple' >> ~/.vimrc.local
echo 'source ~/.vimrc.local.d/functions.vim' >> ~/.vimrc.local

# fabrication du sous repertoire ~/.vimrc.local.d
mkdir ~/.vimrc.local.d 2> /dev/null
# theme.vim
echo '" chargment du theme molokai' > ~/.vimrc.local.d/theme.vim
echo colorscheme molokai >> ~/.vimrc.local.d/theme.vim
# functions.vim
echo '" chargement des fonctions' > ~/.vimrc.local.d/functions.vim

# fabrication du fichier ~/.vimrc.bundles.local
###############################################
echo "\" Une bonne base d'extension quel que soit votre langage de programmation :" > ~/.vimrc.bundles.local
echo "let g:spf13_bundle_groups=['general', 'neocomplcache', 'programming', 'python', 'javascript', 'html', 'php']" >> ~/.vimrc.bundles.local
echo "Bundle 'ZoomWin'" >> ~/.vimrc.bundles.local
echo "\"Bundle 'spf13/vim-colors'" >> ~/.vimrc.bundles.local
echo "Bundle 'ajashton/cascadenik-vim'" >> ~/.vimrc.bundles.local
echo "Bundle 'scrooloose/nerdcommenter'" >> ~/.vimrc.bundles.local
echo "Bundle 'vimpager'" >> ~/.vimrc.bundles.local


# recupération de spf13-vim3 et execution du script
###################################################
curl http://j.mp/spf13-vim3 -L -o - | sh

# installation des bundles listés dans ~/.vimrc.bundles.local
#if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vundle02.log ]
#then
#  echo "  Installation des extensions vim"
#  vim +BundleInstall! +BundleClean! +q +q +q
#  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vundle02.log
#fi
