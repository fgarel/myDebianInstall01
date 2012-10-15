#!/bin/sh


# suppression des fichiers initiaux
#echo "Suppression des fichiers existants sur la machine locale"
#rm -f /etc/apt/sources.list.d.sav/*
#rm -f /etc/apt/sources.list.d/*
#rm -f /etc/apt/preferences
#rm -fr /etc/vim/*
#rm -fr /etc/zsh/*
#rm -f /sbin/fg*

# recopie de :
# - la configuration d'apt :
#    - le fichier de preferences,
#    - les differentes sources
# - quelques utilitiares
# - quelques fichiers de configurations
echo "Récupération des fichiers depuis la machine distante - clefUsb"
#scp -q -r root@10.5.10.23:/media/clefUsb/\* /
#scp -r root@10.5.10.23:/media/disk/* /
cp -r /root/myDebianInstall01/* /

# suppression du fichier sources de depart
rm -f /etc/apt/sources.list
rm -f /etc/apt/sources.list~


# chainage avec les scripts de configuration et les mises à jour
fgaptitudedo01.sh

# comments
