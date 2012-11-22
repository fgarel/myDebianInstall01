#!/usr/bin/sh

########################
##
## dans le sens local vers github
##
########################

# recuperation du fichier pour le mettre dans le depot git
cp /home/garel/pulic_html/tiddlywiki/index.html /root/myDebianInstall02/home/garel/public_html/tiddlywiki/index.html

# enregistrement de la modif et sauvegarde du dépot
cd /root/myDebianInstall02/

git status

git commit -a -m "enrichissement de la documentation"

git push origin master

cd $OLDPWD
