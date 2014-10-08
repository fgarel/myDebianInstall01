#!/bin/sh

# 1ère partie des applications "système"

###########################################
echo "bfaptitudeinstallsyscommun-preseed.sh :       Installation d'outils systeme communs au mode console et au mode graphique (Partie 01)"

################################
# ajout de l'utilitaire apt-utils
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptutils.log ]
then
  echo "  Installation de apt-utils"
  echo y | aptitude install apt-utils 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptutils.log
fi

################################
# ajout de l'utilitaire apt-file
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptfile.log ]
then
  echo "  Installation de apt-file"
  echo y | aptitude install apt-file 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptfile.log
fi

############################
# ajout de l'utilitaire sudo
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-sudo.log ]
then
  echo "  Installation de sudo"
  aptitude install sudo 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-sudo.log
fi

##############################################
# ajout de l'utilisateur blueflamingo
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-useradd.log ]
then
  echo "  Ajout de l'utilisateur blueflamingo"
  # whois contient l'utilitaire mkpasswd
  echo y | aptitude install whois 1> /dev/null
  # A la creation de l'utilisateur,
  # on en profite pour l'ajouter aux groupes staff et sudo
  #useradd --password ${mkpasswd blueflamingo} --groups staff,sudo blueflamingo
  useradd --password `mkpasswd blueflamingo}` --groups staff,sudo blueflamingo
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-useradd.log
fi

##############################################
# ajout de l'utilisateur blueflamingo au groupe staff
#if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-addgroup.log ]
#then
#  echo "  Ajout de l'utilisateur blueflamingo au groupe staff"
#  addgroup blueflamingo staff 1> /dev/null
#  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-addgroup.log
#fi

############################
# ajout de l'utilitaire sudo
#if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-sudo.log ]
#then
#  echo "  Installation de sudo"
#  aptitude install sudo 1> /dev/null
#  echo "  Ajout de l'utilisateur blueflamingo au groupe sudo"
#  addgroup blueflamingo sudo 1> /dev/null
#  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-sudo.log
#fi

################################
# ajout de l'utilitaire ack-grep
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-ackgrep.log ]
then
  echo "  Installation de ack-grep"
  echo y | aptitude install ack-grep 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-ackgrep.log
fi

##############################
# ajout de l'utilitaire hwinfo
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-hwinfo.log ]
then
  echo "  Installation de hwinfo"
  echo y | aptitude install hwinfo 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-hwinfo.log
fi

####################################
# ajout de l'utilitaire ncurses-term
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-ncurses.log ]
then
  echo "  Installation de ncurses-term"
  echo y | aptitude install ncurses-term 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-ncurses.log
fi

############################
# ajout de l'utilitaire ncdu
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-ncdu.log ]
then
  echo "  Installation de ncdu"
  echo y | aptitude install ncdu 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-ncdu.log
fi

#############################
# ajout de l'utilitaire bzip2
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-bzip2.log ]
then
  echo "  Installation de bzip2"
  echo y | aptitude install bzip2 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-bzip2.log
fi

##################################
# ajout de l'utilitaire p7zip-full
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-p7zipfull.log ]
then
  echo "  Installation de p7zip-full"
  echo y | aptitude install p7zip-full 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-p7zipfull.log
fi

#############################
# ajout de l'utilitaire unzip
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-unzip.log ]
then
  echo "  Installation de unzip"
  echo y | aptitude install unzip 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-unzip.log
fi

############################
# ajout de l'utilitaire make
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-make.log ]
then
  echo "  Installation de make"
  echo y | aptitude install make 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-make.log
fi

#######################################
# ajout de l'utilitaire build-essential
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-build.log ]
then
  echo "  Installation de build-essential"
  echo y | aptitude install build-essential 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-build.log
fi

##################################
# ajout de l'utilitaire devscripts
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-devscripts.log ]
then
  echo "  Installation de devscripts"
  echo y | aptitude install devscripts 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-devscripts.log
fi

################################
# ajout de l'utilitaire fakeroot
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-fakeroot.log ]
then
  echo "  Installation de fakeroot"
  echo y | aptitude install fakeroot 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-fakeroot.log
fi

############################
# ajout de l'utilitaire flex
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-flex.log ]
then
  echo "  Installation de flex"
  echo y | aptitude install flex 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-flex.log
fi

#############################
# ajout de l'utilitaire bison
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-bison.log ]
then
  echo "  Installation de bison"
  echo y | aptitude install bison 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-bison.log
fi

##########################
# ajout de libreadline-dev
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-libreadline.log ]
then
  echo "  Installation de libreadline-dev"
  echo y | aptitude install libreadline-dev 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-libreadline.log
fi

###################
# ajout de autoconf
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-autoconf.log ]
then
  echo "  Installation de autoconf"
  echo y | aptitude install autoconf 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-autoconf.log
fi

###################
# ajout de automake
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-automake.log ]
then
  echo "  Installation de automake"
  echo y | aptitude install automake 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-automake.log
fi

##################
# ajout de libtool
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-libtool.log ]
then
  echo "  Installation de libtool"
  echo y | aptitude install libtool 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-libtool.log
fi

######################
# ajout de lsb-release
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-lsbrelease.log ]
then
  echo "  Installation de lsb-release"
  echo y | aptitude install lsb-release 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-lsbrelease.log
fi

###############################
# ajout de l'utilitaire mlocate
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-mlocate.log ]
then
  echo "  Installation de mlocate"
  echo y | aptitude install mlocate 1> /dev/null
  echo "  Début de l'indexation"
  updatedb &
  #echo "  ...Fin de l'indexation"
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-mlocate.log
fi

###############################
# ajout de l'utilitaire net-tools
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-nettools.log ]
then
  echo "  Installation de net-tools"
  echo y | aptitude install net-tools 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-nettools.log
fi

############################
# ajout de l'utilitaire tmux
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-tmux.log ]
then
  echo "  Installation de tmux"
  echo y | aptitude install tmux 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-tmux.log
fi

#####################
# installation de git
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-git.log ]
then
  echo "  Installation de git"
  echo y | aptitude install git 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-git.log
fi

############################
# installation de subversion
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-subversion.log ]
then
  echo "  Installation de subversion"
  echo y | aptitude install subversion \
                            subversion-tools 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-subversion.log
fi

######################
# installation de curl
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-curl.log ]
then
  echo "  Installation de curl"
  echo y | aptitude install curl \
                            libcurl3 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-curl.log
fi

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
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-zsh.log ]
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
  wget -nv -N http://formation-debian.via.ecp.fr/fichiers-config/dir_colors
  cd $OLDPWD

  echo "  Récupération des fichiers de configuration zsh de grml"
  cd /etc/zsh
  wget -nv -q -N http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -O zshrc_grml
  cd $OLDPWD

  echo "  Récupération des fichiers de configurations de Oh my zshell"
  #git checkout /etc/zsh/oh-my-zsh
  #git clean
  #git clone git://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh
  #git clone --progress --verbose https://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh
  git clone --progress --verbose http://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh 2> /dev/null
  cd /etc/zsh/oh-my-zsh
  git fetch --progress --verbose
  cd $OLDPWD
  cp /etc/zsh/oh-my-zsh/templates/zshrc.zsh-template /etc/zsh/zshrc
  #sed -i -e 's/export ZSH=$HOME\/.oh-my-zsh/export ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
  sed -i -e 's/ZSH=$HOME\/.oh-my-zsh/ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
  #sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"jtriley\"/g' /etc/zsh/zshrc
  sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"sporty_256\"/g' /etc/zsh/zshrc
  # pour consulter la liste des plugins disponibles, il faut se rendre sur la page
  # https://github.com/robbyrussel/oh-my-ssh/wiki/Plugins
  sed -i -e 's/plugins=(git)/plugins=(deb debian git github perl pip vi-mode virtualenvwrapper)/g' /etc/zsh/zshrc
  sed -i -e 's/export PAGER=less/export PAGER=vimpager/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
  sed -i -e 's/export LC_CTYPE=en_US.UTF-8/export LC_CTYPE="fr_FR.UTF-8"/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
  sed -i -e '/LC_ALL/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  sed -i -e '/LANG/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  sed -i -e '/LANGUAGE/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
  echo 'export LC_ALL="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  echo 'export LANG="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  echo 'export LANGUAGE="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
  cp /etc/zsh/zshrc_formation_debian /etc/zsh/oh-my-zsh/custom/zshrc_formation_debian.zsh 2> /dev/null
  cp /etc/zsh/zshrc_grml /etc/zsh/oh-my-zsh/custom/zshrc_grml.zsh 2> /dev/null

  cp /etc/zsh/zlogin_formation_debian /etc/zsh/zlogin 2> /dev/null
  cp /etc/zsh/zlogout_formation_debian /etc/zsh/zlogout 2> /dev/null
  cp /etc/zsh/zshenv_formation_debian /etc/zsh/zshenv 2> /dev/null

  echo "  Source de /etc/zsh/zshrc"
  #source /etc/zsh/zshrc
  #`/etc/zsh/zshrc`
  /bin/zsh /etc/zsh/zshrc

  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-zsh.log
fi
