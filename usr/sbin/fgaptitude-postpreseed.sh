#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "fgaptitude-postpreseed.sh :                     Actions manuelles"

mkdir /var/log/fg 2> /dev/null

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate.sh

# installation de quelques applications et utilitaires
# spécifiques à l'administration du système
# ces applications systèmes sont divisés en trois groupes
# en fonction du type d'install à effectuer
# - le groupe commun
# - le groupe des applis spécifiques à une install "Bureau X Minimal"
# - le groupe des applis spécifiques à une install "Framebuffer"
#
# commun
#fgaptitudeinstallsyscommun02.sh
# X
fgaptitudeinstallsysx02a.sh
# framebuffer
fgaptitudeinstallsysframebuffer02a.sh
fgaptitudeinstallsysframebuffer02b.sh

# Mise à jour du système
#fgaptitudeupgrade02.sh

# installation de vim
#fgaptitudeinstallvim02.sh

