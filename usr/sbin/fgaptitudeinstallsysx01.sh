#!/bin/sh

# Première partie des applications "système X"

###########################################
echo "fgaptitudeinstallsysx01 : Installation d'outils pour le mode graphique (1ere partie)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallsysx01-suppression.log ]
then

  # suppression de xorg"
  echo "Suppression de xserver-xorg"
  echo y | aptitude remove xserver-xorg \
                           xserver-xorg-core \
                           xserver-xorg-video-fbdev \
                           xserver-xorg-input-evdev \
                           xinit \
                           e17 #1> /dev/null
  #                         virtualbox-ose-guest-x11 #1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx01-suppression.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallsysx01-installation.log ]
then

  # installation de xserver-xorg
  echo "Installation de xserver-xorg"
  echo y | aptitude install xserver-xorg \
                            xserver-xorg-core \
                            xserver-xorg-video-fbdev \
                            xserver-xorg-input-evdev \
                            xinit \
                            e17 #1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx01-installation.log
fi


# urxvt
# http://www.planet-libre.org/?post_id=11153

# suppression de la souris
# http://www.planet-libre.org/?post_id=11141

# bureau minimaliste
# http://www.planet-libre.org/?post_id=11098

