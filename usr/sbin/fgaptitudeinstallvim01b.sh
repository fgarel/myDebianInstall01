#!/bin/sh
curl http://j.mp/spf13-vim3 -L -o - | sh

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
