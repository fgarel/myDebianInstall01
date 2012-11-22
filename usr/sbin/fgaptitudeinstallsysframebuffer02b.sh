#!/bin/sh

# Seconde partie des applications "système framebuffer"

###########################################
#echo "Installation de systeme-framebuffer (2de partie)"
echo "fgaptitudeinstallsysframebuffer02 : Installation d'outils pour le mode console (2de partie)"

mkdir /var/log/fg 2> /dev/null

###########################################
# installation de qingy et de fbterm
#

###########################################
# terminal framebuffer et 256 couleurs

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer02-fbterm.log ]
then
  echo "  Installation de fbterm"
  echo y | aptitude install fontconfig-config/testing 1> /dev/null
  echo y | aptitude install libfontconfig1/testing 1> /dev/null
  echo y | aptitude install fbterm/testing 1> /dev/null
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer02-fbterm.log
fi

####################################################
# Installation de qingy : framebuffer et login

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer02-qingy.log ]
then
  echo "  Installationd de qingy"
  echo y | aptitude install qingy 1> /dev/null

  echo "  Récupération des thèmes"
  cd /usr/share/qingy/themes/
  wget -nv -q -N http://sourceforge.net/projects/qingy/files/qingy%20themes/themepack%20for%20qingy%200.3xx/qingy_0.3_themepack_1.0.tar.bz2 qingy_0.3_themepack_1.0.tar.bz2
  tar xjvf qingy_0.3_themepack_1.0.tar.bz2 1> /dev/null
  mv qingy_0.3_themepack_1.0/* . 1> /dev/null 2> /dev/null
  rm -rf qingy_0.3_themepack_1.0
  cd $OLDPWD
  sed -i -e 's/^# theme = random$/theme = random/g' /etc/qingy/settings
  sed -i -e 's/^theme = \"default\"$/# theme = \"default\"/g' /etc/qingy/settings
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer02-qingy.log
fi

###########################################
# qingy passe la main au shell
# le shell doit etre paramètré pour utiliser un terminal/console
# - qui exploite le frame buffer
# - qui soit capable de gerer 256 couleurs
# la methode trouvée pour réaliser cette manipulation est 
#   que qingy lance zlogin
#     (je ne sais pas comment passer d'eventuelles action à qingy)
#   qui lance fbterm
#     (ce terminal exploite le frame buffer, mais la commande tput colors
#     et la commande printenv indiquent que la variable d'environnement
#     TERM n'est pas à la bonne valeur)
#   qui lance zshenv
#     (la variable TERM est enfin mise à la bonne valeur)

if [ ! -e /var/log/fg/fgaptitudeinstallsysframebuffer02-configuration.log ]
then
  echo "  Configuration de zshenv"
  sed -i -e '/export TERM=/ d' /etc/zsh/zshenv
  echo 'export TERM=fbterm' >> /etc/zsh/zshenv
  #echo 'export TERM=screen-256color' >> /etc/zsh/zshenv

  echo "  Configuration de zlogin"
  sed -i -e '/fbterm -v/ d' /etc/zsh/zlogin
  sed -i -e '/fbterm/ d' /etc/zsh/zlogin
  sed -i -e '/exit/ d' /etc/zsh/zlogin
  #echo 'fbterm -v --cursor-shape=1 /bin/zsh' >> /etc/zsh/zlogin
  echo 'fbterm --cursor-shape=1 /bin/zsh' >> /etc/zsh/zlogin
  echo 'exit' >> /etc/zsh/zlogin

  echo "  Configuration de inittab"
  sed -i -e 's/1:2345:respawn:\/sbin\/getty 38400 tty1/1:2345:respawn:\/usr\/sbin\/qingy tty1 -n/g' /etc/inittab
  sed -i -e 's/2:23:respawn:\/sbin\/getty 38400 tty2/2:23:respawn:\/usr\/sbin\/qingy tty2 -n/g' /etc/inittab
  sed -i -e 's/3:23:respawn:\/sbin\/getty 38400 tty3$/3:23:respawn:\/sbin\/getty 38400 tty3 fbterm/g' /etc/inittab
  sed -i -e 's/4:23:respawn:\/sbin\/getty 38400 tty4$/4:23:respawn:\/sbin\/getty 38400 tty4 screen-256color/g' /etc/inittab
  sed -i -e 's/5:23:respawn:\/sbin\/getty 38400 tty5$/5:23:respawn:\/sbin\/getty 38400 tty5 xterm-256color/g' /etc/inittab
  sed -i -e 's/6:23:respawn:\/sbin\/getty 38400 tty6$/6:23:respawn:\/sbin\/getty 38400 tty6/g' /etc/inittab
  #sed -i -e 's/1:2345:respawn:\/sbin\/getty 38400 tty1/1:2345:respawn:\/sbin\/getty 38400 tty1 xterm-256color/g' /etc/inittab
  #sed -i -e 's/2:23:respawn:\/sbin\/getty 38400 tty2/2:23:respawn:\/sbin\/getty 38400 tty2 xterm-256color/g' /etc/inittab
  #sed -i -e 's/3:23:respawn:\/sbin\/getty 38400 tty3/3:23:respawn:\/sbin\/getty 38400 tty3 xterm-256color/g' /etc/inittab
  #sed -i -e 's/4:23:respawn:\/sbin\/getty 38400 tty4/4:23:respawn:\/sbin\/getty 38400 tty4 xterm-256color/g' /etc/inittab
  #sed -i -e 's/5:23:respawn:\/sbin\/getty 38400 tty5/5:23:respawn:\/sbin\/getty 38400 tty5 xterm-256color/g' /etc/inittab

  echo "  Modification de vimrc.fg pour modifier la largeur de colonne"
  sed -i -r -e 's/^set columns=80$/\"set columns=80/' /etc/vim/vimrc.fg   # substitution : desactivation de 80
  sed -i -r -e 's/^set columns=144$/\"set columns=144/' /etc/vim/vimrc.fg # substitution : desactivation de 144
  sed -i -r -e 's/^\"set columns=164$/set columns=164/' /etc/vim/vimrc.fg # substitution : activation de 164
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallsysframebuffer02-configuration.log
fi
