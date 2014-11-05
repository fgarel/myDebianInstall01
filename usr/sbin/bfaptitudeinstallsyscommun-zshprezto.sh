#!/bin/sh

# 1ère partie des applications "système"

###########################################
echo "bfaptitudeinstallsyscommun-zshprezto.sh :       Installation de zsh"


######################
# installation de cups
# transferer vers gis.....
#if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun01-cups.log ]
#then
#  echo "  Installation de cups"
#  echo y | aptitude install cups \
#                            cups-pdf 1> /dev/null
#  adduser garel lpadmin
#  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun01-cups.log
#fi

###########################
# installation de etckeeper
# attention, il semblerait que la version de wheezy
# n'a pas pu etre installée dans le preseed
#if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun01-etckeeper.log ]
#then
#  echo "  Installation de etckeeper"
#  echo y | aptitude install etckeeper 1> /dev/null
#  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun01-etckeeper.log
#fi

########################
# installation de elinks
#echo "  Installation de elinks"
#echo y | aptitude install elinks 1> /dev/null

#echo 'set mime.extension.jpg="image/jpeg"' >> /etc/elinks/elinks.conf
#echo 'set mime.extension.jpeg="image/jpeg"' >> /etc/elinks/elinks.conf
#echo 'set mime.extension.png="image/png"' >> /etc/elinks/elinks.conf
#echo 'set mime.extension.gif="image/gif"' >> /etc/elinks/elinks.conf
#echo 'set mime.extension.bmp="image/bmp"' >> /etc/elinks/elinks.conf
#echo '' >> /etc/elinks/elinks.conf
#echo 'set mime.handler.image_viewer.unix.ask = 1' >> /etc/elinks/elinks.conf
#echo 'set mime.handler.image_viewer.unix-xwin.ask = 0' >> /etc/elinks/elinks.conf
#echo 'set mime.handler.image_viewer.unix.block = 1' >> /etc/elinks/elinks.conf
#echo 'set mime.handler.image_viewer.unix-xwin.block = 0' >> /etc/elinks/elinks.conf
#echo 'set mime.handler.image_viewer.unix.program = "fim %"' >> /etc/elinks/elinks.conf
#echo '#set mime.handler.image_viewer.unix-xwin.program = "ida %"' >> /etc/elinks/elinks.conf
#echo '' >> /etc/elinks/elinks.conf
#echo 'set mime.type.image.jpg = "image_viewer"' >> /etc/elinks/elinks.conf
#echo 'set mime.type.image.jpeg = "image_viewer"' >> /etc/elinks/elinks.conf
#echo 'set mime.type.image.png = "image_viewer"' >> /etc/elinks/elinks.conf
#echo 'set mime.type.image.gif = "image_viewer"' >> /etc/elinks/elinks.conf
#echo 'set mime.type.image.bmp = "image_viewer"' >> /etc/elinks/elinks.conf


########################################
# installation de zsh à la place de bash
# http://formation-debian.via.ecp.fr/shell.html
# autres docs sur la configuration du shell
# http://mail.axul.org/pipermail/axul-linux/2011-March/000127.html
# https://wiki.archlinux.org/index.php/Zsh
#
# top : oh my zsh
# https://github.com/robbyrussell/oh-my-zsh
#
# tips supplémentaire : pony ssh sur grml
# http://grml.org/zsh-pony/
#
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-zsh-zsh.log ]
then
  echo "  Installation de zsh"
  mv /etc/zsh/zlogin /etc/zsh/zlogin_sav 2> /dev/null
  mv /etc/zsh/zlogout /etc/zsh/zlogout_sav 2> /dev/null
  mv /etc/zsh/zprofile /etc/zsh/zprofile_sav 2> /dev/null
  mv /etc/zsh/zshenv /etc/zsh/zshenv_sav 2> /dev/null
  mv /etc/zsh/zshrc /etc/zsh/zshrc_sav 2> /dev/null
  echo y | aptitude install zsh 1> /dev/null
  echo "  Sauvegarde des fichiers de configuration zsh du responsable du paquet"
  mv /etc/zsh/zprofile /etc/zsh/zprofile_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zshrc /etc/zsh/zshrc_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zshenv /etc/zsh/zshenv_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zlogin /etc/zsh/zlogin_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zlogout /etc/zsh/zlogout_mainteneur_debian 2> /dev/null

  # pour changer le shell de l'utilisateur en cours
  # https://wiki.archlinux.org/index.php/Zsh
  #echo "/usr/bin/zsh" | chsh
  chsh -s /bin/zsh root
  chsh -s /bin/zsh blueflamingo

  echo "  Création d'un fichier zshrc pour l'utilisateur blueflamingo"
  mkdir /home/blueflamingo
  echo "# Created by newuser" > /home/blueflamingo/.zshrc

  echo "  Changement du shell par defaut pour les futurs utilisateurs"
  # pour changer le shell des futurs utilisateurs
  # http://askubuntu.com/questions/28969/how-do-you-change-the-default-shell-for-all-users-to-bash
  sed -i -e 's/DSHELL=\/bin\/bash/DSHELL=\/bin\/zsh/g' /etc/adduser.conf

  # recuperation des fichiers de configuration de la formation Debian
  # http://formation-debian.via.ecp.fr/shell.html
  echo "  Récupération des fichiers de configuration zsh de la formation debian"
  cd /etc/zsh
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zshrc -O zshrc_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zshenv -O zshenv_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zlogin -O zlogin_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zlogout -O zlogout_formation_debian
  #cp /etc/zsh/zshrc /etc/zsh/zshrc_formation_debian
  cd $OLDPWD

  cd /etc/
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/dir_colors
  cd $OLDPWD

  echo "  Récupération des fichiers de configuration zsh de grml"
  cd /etc/zsh
  wget -nv -q -N http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -O zshrc_grml
  cd $OLDPWD

  echo "  Récupération des fichiers de configuration de prezto"
  #git checkout /etc/zsh/oh-my-zsh
  #git clean
  #git clone git://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh
  #git clone --progress --verbose https://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh
  #git clone --progress --verbose http://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh 2> /dev/null
  zsh
  git clone --progress --verbose --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR}:-$HOME/.zprezto" 2> /dev/null
  cd "${ZDOTDIR}:-$HOME/.zprezto"
  git fetch --progress --verbose
  cd $OLDPWD

  setopt EXTENDED_GLOB
  #for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md; do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  #cp /etc/zsh/oh-my-zsh/templates/zshrc.zsh-template /etc/zsh/zshrc
  #sed -i -e 's/export PATH=$HOME\/bin:\/usr\/local\/bin:$PATH/export PATH=$HOME\/bin:\/usr\/local\/bin:$PATH:\/opt\/.blueflamingo\/usr\/sbin/g' /etc/zsh/zshrc
  ##sed -i -e 's/export ZSH=$HOME\/.oh-my-zsh/export ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
  #sed -i -e 's/ZSH=$HOME\/.oh-my-zsh/ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
  ##sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"jtriley\"/g' /etc/zsh/zshrc
  #sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"sporty_256\"/g' /etc/zsh/zshrc
  # pour consulter la liste des plugins disponibles, il faut se rendre sur la page
  # https://github.com/robbyrussel/oh-my-ssh/wiki/Plugins
  ##sed -i -e 's/plugins=(git)/plugins=(deb debian git github perl pip vi-mode virtualenvwrapper)/g' /etc/zsh/zshrc
  #sed -i -e 's/plugins=(git)/plugins=(deb debian git github perl pip vi-mode)/g' /etc/zsh/zshrc
  #sed -i -e 's/export PAGER=less/export PAGER=vimpager/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
  #sed -i -e 's/export LC_CTYPE=en_US.UTF-8/export LC_CTYPE="fr_FR.UTF-8"/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
  #sed -i -e '/LC_ALL/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  #sed -i -e '/LANG/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  #sed -i -e '/LANGUAGE/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  #echo 'export LC_ALL="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  #echo 'export LANG="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  #echo 'export LANGUAGE="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  #cp /etc/zsh/zshrc_formation_debian /etc/zsh/oh-my-zsh/custom/zshrc_formation_debian.zsh 2> /dev/null
  #cp /etc/zsh/zshrc_grml /etc/zsh/oh-my-zsh/custom/zshrc_grml.zsh 2> /dev/null

  cp /etc/zsh/zlogin_formation_debian /etc/zsh/zlogin 2> /dev/null
  cp /etc/zsh/zlogout_formation_debian /etc/zsh/zlogout 2> /dev/null
  cp /etc/zsh/zshenv_formation_debian /etc/zsh/zshenv 2> /dev/null

  echo "  Source de /etc/zsh/zshrc"
  #source /etc/zsh/zshrc
  #`/etc/zsh/zshrc`
  /bin/zsh /etc/zsh/zshrc

  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-zsh-zsh.log
fi
