#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "fgaptitudedo02.sh :                     Actions manuelles"

mkdir /var/log/fg 2> /dev/null

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate02.sh
fgaptitudeinstallsysframebuffer02a.sh

# installation de quelques applications et utilitaires
# spécifiques à l'administration du système
# ces applications systèmes sont divisés en trois groupes
# en fonction du type d'install à effectuer
# - le groupe commun
# - le groupe des applis spécifiques à une install "Framebuffer"
# - le groupe des applis spécifiques à une install "Bureau X Minimal"
#
# commun
#fgaptitudeinstallsyscommun02.sh
# framebuffer
fgaptitudeinstallsysframebuffer02b.sh
# X
fgaptitudeinstallsysx02a.sh

# Mise à jour du système
#fgaptitudeupgrade02.sh

# installation de vim
#fgaptitudeinstallvim02.sh

# installation de quelques applications et utilitaires
# spécifiques au domaine du sig
fgaptitudemakeinstall2.sh
fgaptitudeinstallgis02a.sh
fgaptitudeinstallgis02b.sh


#echo "Récupération des fichiers depuis la machine distante - clefUsb2"
#git clone --progress --verbose http://github.com/fgarel/myDebianInstall02.git /root/myDebianInstall02
#cp /root/myDebianInstall02/* /
###scp -q -r root@10.5.10.23:/media/clefUsb2/\* /
#chown -R garel:garel /home/garel/
#sudo -u garel fgaptitudeinstallgis03.sh ; cd $OLDPWD

