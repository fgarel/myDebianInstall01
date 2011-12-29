#!/bin/sh

##############################################
# ajout de l'utilisateur garel au groupe staff
#echo "  Ajout de l'utilisateur garel au groupe staff"
#addgroup garel staff 1> /dev/null

############################
# ajout de l'utilitaire sudo
#echo "Installation de sudo"
#aptitude install sudo 1> /dev/null
#echo "  Ajout de l'utilisateur garel au groupe sudo"
#addgroup garel sudo 1> /dev/null

################################
# ajout de l'utilitaire ack-grep
#echo "Installation de ack-grep"
#echo y | aptitude install ack-grep 1> /dev/null

##############################
# ajout de l'utilitaire hwinfo
#echo "Installation de hwinfo"
#echo y | aptitude install hwinfo 1> /dev/null

####################################
# ajout de l'utilitaire ncurses-term
#echo "Installation de ncurses-term"
#echo y | aptitude install ncurses-term 1> /dev/null

#############################
# ajout de l'utilitaire bzip2
#echo "Installation de bzip2"
#echo y | aptitude install bzip2 1> /dev/null

############################
# ajout de l'utilitaire make
#echo "Installation de make"
#echo y | aptitude install make 1> /dev/null

#######################################
# ajout de l'utilitaire build-essential
#echo "Installation de build-essential"
#echo y | aptitude install build-essential 1> /dev/null

##################################
# ajout de l'utilitaire devscripts
#echo "Installation de devscripts"
#echo y | aptitude install devscripts 1> /dev/null

################################
# ajout de l'utilitaire fakeroot
#echo "Installation de fakeroot"
#echo y | aptitude install fakeroot 1> /dev/null

############################
# ajout de l'utilitaire flex
#echo "Installation de flex"
#echo y | aptitude install flex 1> /dev/null

#############################
# ajout de l'utilitaire bison
#echo "Installation de bison"
#echo y | aptitude install bison 1> /dev/null

##########################
# ajout de libreadline-dev
#echo "Installation de libreadline-dev"
#echo y | aptitude install libreadline-dev 1> /dev/null

###############################
# ajout de l'utilitaire mlocate
#echo "Installation de mlocate"
#aptitude install mlocate 1> /dev/null
#echo "  Début de l'indexation"
#updatedb &
#echo "Fin de l'indexation"

############################
# ajout de l'utilitaire tmux
#echo "Installation de tmux"
#echo y | aptitude install tmux/squeeze-backports 1> /dev/null

#####################
# installation de git
echo "Installation de git"
echo y | aptitude install git 1> /dev/null

############################
# installation de subversion
#echo "Installation de subversion"
#echo y | aptitude install subversion \
#                          subversion-tools 1> /dev/null
                          
###########################
# installation de etckeeper
#echo "Installation de etckeeper"
#echo y | aptitude install etckeeper 1> /dev/null
                          
########################
# installation de elinks
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
apt-cache policy git
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo "Installation de elinks"
#echo y | aptitude install elinks 1> /dev/null
#echo y | aptitude install elinks

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
