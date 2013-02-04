#!/bin/sh

# Première partie des applications "système X"

###########################################
echo "fgaptitudeinstallsysx02a.sh :           Installation d'outils pour le mode graphique (Partie 02a)"

mkdir /var/log/fg 2> /dev/null

if [ ! -e /var/log/fg/fgaptitudeinstallsysx02a-suppression.log ]
then

  # suppression de xorg"
  echo "  Suppression de xserver-xorg"
  echo y | aptitude remove xserver-xorg \
                           xserver-xorg-core \
                           xserver-xorg-video-fbdev \
                           xserver-xorg-input-evdev \
                           xinit \
                           connman \
                           e17 1> /dev/null
  #                         virtualbox-ose-guest-x11 #1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx02a-suppression.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallsysx02a-installation.log ]
then

  # installation de xserver-xorg
  echo "  Installation de xserver-xorg"
  echo y | aptitude install xserver-xorg \
                            xserver-xorg-core \
                            xserver-xorg-video-fbdev \
                            xserver-xorg-input-evdev \
                            xinit \
                            connman \
                            e17 1> /dev/null
  echo "  Permettre à un utilisateur non-root de pouvoir utiliser X"
  # pour autoriser les utilisateurs à lancer X, il faut modifier le fichier /etc/X11/Xwrapper.conf
  # la méthode qu'il faudrait préférer, c'est de faire
  # dpkg-reconfigure x11-common
  # http://voidandany.free.fr/index.php/demarrer-le-serveur-x-avec-un-utilisateur-non-connecte/
  sed -i -e 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config


  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx02a-installation.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallsysx02a-chromium.log ]
then

  # installation du navigateur chromium (googgle chrome)
  echo "  Installation de chromium"
  echo y | aptitude install chromium \
                            chromium-inspector 1> /dev/null
  update-alternatives --remove x-www-browser /usr/bin/xlinks2 1> /dev/null
  #update-alternatives --remove x-www-browser /usr/bin/chromium 1> /dev/null
  #update-alternatives --install /usr/bin/chromium x-www-browser /usr/bin/chromium 50 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx02a-chromium.log
fi

# urxvt
# http://www.planet-libre.org/?post_id=11153
if [ ! -e /var/log/fg/fgaptitudeinstallsysx02a-rxvtunicode.log ]
then

    # installation du terminal x ()
  echo "  Installation de rxvt-unicode-256color"
  echo y | aptitude install rxvt-unicode-256color 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx02a-rxvtunicode.log
fi

# xterm
# pour le moment, il est necessaire pour enlightenment
if [ ! -e /var/log/fg/fgaptitudeinstallsysx02a-xterm.log ]
then

    # installation du terminal x ()
  echo "  Installation de xterm"
  echo y | aptitude install xterm 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysx02a-xterm.log
fi

# suppression de la souris
# http://www.planet-libre.org/?post_id=11141

# bureau minimaliste
# http://www.planet-libre.org/?post_id=11098

