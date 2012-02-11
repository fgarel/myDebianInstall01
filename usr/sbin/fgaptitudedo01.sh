#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

# chainage avec les scripts de configuration et les mises à jour

fgaptitudeupdate.sh
fgaptitudeclean.sh
# installation de quelques applications et utilitaires
# spécifiques à l'administration du système
# ces applications systèmes sont divisés en trois groupes
# en fonction du type d'install à effectuer
# - le groupe commun
# - le groupe des applis spécifiques à une install "Framebuffer"
# - le groupe des applis spécifiques à une install "Bureau X Minimal"
#
# sauvegarde
#fgaptitudeinstallsys.sh
# commun
fgaptitudeinstallsyscommun02.sh
# framebuffer
#fgaptitudeinstallsysframebuffer02.sh
# X
fgaptitudeinstallsysx02.sh
#fgaptitudeupgrade.sh
fgaptitudeinstallgis02sh


