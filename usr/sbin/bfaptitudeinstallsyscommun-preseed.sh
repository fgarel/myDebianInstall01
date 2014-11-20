#!/bin/sh

# 1ère partie des applications "système"

###########################################
echo "bfaptitudeinstallsyscommun-preseed.sh :       Installation d'outils systeme communs au mode console et au mode graphique (Partie 01)"

################################
# ajout de l'utilitaire apt-utils
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptutils.log ]
then
  echo "  Installation de apt-utils"
  echo y | aptitude install -t testing apt-utils 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptutils.log
fi

################################
# ajout de l'utilitaire apt-file
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-aptfile.log ]
then
  echo "  Installation de apt-file"
  echo y | aptitude install -t testing apt-file 1> /dev/null
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
  useradd --password `mkpasswd blueflamingo` --groups staff,sudo blueflamingo
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-useradd.log
fi
mkdir -p /home/blueflamingo
chown -R blueflamingo:blueflamingo /home/blueflamingo

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

##############################
# ajout de l'utilitaire dialog
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-dialog.log ]
then
  echo "  Installation de dialog"
  echo y | aptitude install -t testing dialog 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-dialog.log
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
  update-alternatives --remove fakeroot /usr/bin/fakeroot-tcp 1> /dev/null
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

########################
# installation de man-db
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-mandb.log ]
then
  echo "  Installation de man-db"
  echo y | aptitude install man-db 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-mandb.log
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
#if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-elinks.log ]
#then
#  echo "  Installation de elinks"
#  echo y | aptitude install -t testing elinks 1> /dev/null
#  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-elinks.log
#fi


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


########################
# installation de links2
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-links2.log ]
then
  echo "  Installation de links2"
  echo y | aptitude install links2 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-links2.log
fi

#################################
# installation de fonts-powerline
if [ ! -e /var/log/bf/bfaptitudeinstallsyscommun-preseed-fontspowerline.log ]
then
  echo "  Installation de fonts-powerline"
  echo y | aptitude install fonts-powerline 1> /dev/null
  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-preseed-fontspowerline.log
fi
