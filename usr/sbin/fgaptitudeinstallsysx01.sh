#!/bin/sh

# Première partie des applications "système X"

###########################################
echo "Installation de systeme-X (1ère partie)"


# suppression de xorg"
echo "Suppression de xserver-xorg"
#echo y | aptitude remove xserver-xorg \
#                         xserver-xorg-core \
#                         xserver-xorg-input-evdev \
#                         virtualbox-ose-guest-x11 #1> /dev/null

# installation de xserver-xorg
echo "Installation de xserver-xorg"
#echo y | aptitude install xserver-common/experimental \
#                          xserver-xorg-core/testing \
#                          xserver-xorg-video-fbdev/testing \
#                          xserver-xorg-input-evdev/testing \
#                          libxfont1/squeeze-backports \
#                          xinit #1> /dev/null

echo y | aptitude install xserver-common/experimental \
                          xserver-xorg-core/testing \
                          xinit #1> /dev/null

# urxvt
# http://www.planet-libre.org/?post_id=11153

# suppression de la souris
# http://www.planet-libre.org/?post_id=11141

# bureau minimaliste
# http://www.planet-libre.org/?post_id=11098

