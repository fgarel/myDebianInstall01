#!/bin/sh

# Mise à jour du noyau
#echo "Mise à jour du noyau"
#echo y | aptitude install linux-image-2.6-486 1> /dev/null
#aptitude remove linux-image-2.6-686 1> /dev/null

# suppression de xorg"
echo "Suppression de xserver-xorg"
echo y | aptitude remove xserver-xorg \
                         xserver-xorg-core \
                         xserver-xorg-input-evdev \
                         virtualbox-ose-guest-x11 #1> /dev/null
# suppression de dkms
echo "Suppression de dkms"
aptitude remove dkms

# aptitude upgrade

# aptitude safe-upgrade
#echo "Aptitude safe-upgrade"
#echo y | aptitude safe-upgrade 1> /dev/null
#echo "... tude safe-upgrade done"

# aptitude full-upgrade
echo "Aptitude full-upgrade"
echo y | aptitude full-upgrade 1> /dev/null
echo "... tude full-upgrade done"

# Mise à jour du noyau  et ajout de dkms
echo "Mise à jour du noyau"
echo y | aptitude install linux-image-486/testing \
                          linux-base/testing \
                          linux-headers-486/testing \
                          dkms
aptitude remove linux-image-686

# installation de xserver-xorg
echo "Installation de xserver-xorg"
echo y | aptitude install xserver-common/experimental \
                          xserver-xorg-core/testing \
                          xserver-xorg-video-fbdev/testing \
                          libxfont1/squeeze-backports \
                          xinit

# ajout de dkms et de virtualbox-ose-guest
echo "Installation de virtualbox et dkms"
#echo y | aptitude install dkms \
#                          virtualbox-guest-dkms \
#                          virtualbox-guest-utils/unstable \
#                          virtualbox-guest-x11/unstable
