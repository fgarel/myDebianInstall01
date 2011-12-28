

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
echo "Installation de zsh"
#echo y | aptitude remove zsh 1> /dev/null
#echo y | aptitude purge ~c 1> /dev/null
mv /etc/zsh/zlogin /etc/zsh/zlogin_sav 2> /dev/null
mv /etc/zsh/zlogout /etc/zsh/zlogout_sav 2> /dev/null
mv /etc/zsh/zprofile /etc/zsh/zprofile_sav 2> /dev/null
mv /etc/zsh/zshenv /etc/zsh/zshenv_sav 2> /dev/null
mv /etc/zsh/zshrc /etc/zsh/zshrc_sav 2> /dev/null
#cd /etc/zsh
#touch zshrc zshenv zprofile zlogin zlogout
#cd $OLDPWD
echo y | aptitude install zsh 1> /dev/null
#aptitude install zsh

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
chsh -s /bin/zsh garel

echo "  Création d'un fichier zshrc pour l'utilisateur garel"
echo "# Created by newuser" > /home/garel/.zshrc

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
git clone --progress --verbose http://github.com/robbyrussell/oh-my-zsh.git /etc/zsh/oh-my-zsh
cd /etc/zsh/oh-my-zsh
git fetch --progress --verbose
cd $OLDPWD
cp /etc/zsh/oh-my-zsh/templates/zshrc.zsh-template /etc/zsh/zshrc
#sed -i -e 's/export ZSH=$HOME\/.oh-my-zsh/export ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
sed -i -e 's/ZSH=$HOME\/.oh-my-zsh/ZSH=\/etc\/zsh\/oh-my-zsh/g' /etc/zsh/zshrc
#sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"jtriley\"/g' /etc/zsh/zshrc
sed -i -e 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"sporty_256\"/g' /etc/zsh/zshrc
sed -i -e 's/plugins=(git)/plugins=(deb debian git github perl pip vi-mode)/g' /etc/zsh/zshrc
sed -i -e 's/export PAGER=less/export PAGER=vimpager/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
sed -i -e 's/export LC_CTYPE=en_US.UTF-8/export LC_CTYPE="fr_FR.UTF-8"/g' /etc/zsh/oh-my-zsh/lib/misc.zsh
sed -i -e '/LC_ALL/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
sed -i -e '/LANG/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
sed -i -e '/LANGUAGE/ d' /etc/zsh/oh-my-zsh/lib/misc.zsh
echo 'export LC_ALL="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
echo 'export LANG="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
echo 'export LANGUAGE="fr_FR.UTF-8"' >> /etc/zsh/oh-my-zsh/lib/misc.zsh
cp /etc/zsh/zshrc_formation_debian /etc/zsh/oh-my-zsh/custom/zshrc_formation_debian.zsh 2> /dev/null
cp /etc/zsh/zshrc_grmln /etc/zsh/oh-my-zsh/custom/zshrc_grml.zsh 2> /dev/null


cp /etc/zsh/zlogin_formation_debian /etc/zsh/zlogin 2> /dev/null
cp /etc/zsh/zlogout_formation_debian /etc/zsh/zlogout 2> /dev/null
cp /etc/zsh/zshenv_formation_debian /etc/zsh/zshenv 2> /dev/null



echo "  Source de /etc/zsh/zshrc"
#source /etc/zsh/zshrc
#`/etc/zsh/zshrc`
/bin/zsh /etc/zsh/zshrc

###############################################################
# modification de grub-pc pour lancer la console en 1152x864x32
echo "Modification de grub-pc pour lancer la console en 1152x864x32"
sed -i -e '/GRUB_GFXMODE=1/ d' /etc/default/grub   # suppression
sed -i -e '/#GRUB_GFXMODE=640x480/ a\GRUB_GFXMODE=1152x864,1152x864x32,1152x864x24,1152x864x16,1280x1024x16,1024x768x16,1152x864x32,1024x768x32,1024x768x24,800x600,640x480' /etc/default/grub # ajout
sed -i -e '/set gfxpayload=keep/ d' /etc/grub.d/00_header   # suppression de set gfxpayload
sed -i -e '/load_video/  i\  set gfxpayload=keep' /etc/grub.d/00_header # ajout de set gfxpayload
update-grub2

####################################################
# Installation de qingy : pour avoir le frame buffer
echo "Installationd de qingy"
echo y | aptitude install qingy 1> /dev/null
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
echo "  Récupération des thèmes"
cd /usr/share/qingy/themes/
wget -nv -q -N http://sourceforge.net/projects/qingy/files/qingy%20themes/themepack%20for%20qingy%200.3xx/qingy_0.3_themepack_1.0.tar.bz2 qingy_0.3_themepack_1.0.tar.bz2
tar xjvf qingy_0.3_themepack_1.0.tar.bz2 1> /dev/null
mv qingy_0.3_themepack_1.0/* . 1> /dev/null 2> /dev/null
rm -rf qingy_0.3_themepack_1.0
cd $OLDPWD
sed -i -e 's/^# theme = random$/theme = random/g' /etc/qingy/settings
sed -i -e 's/^theme = \"default\"$/# theme = \"default\"/g' /etc/qingy/settings

echo "  Installation de fbterm"
echo y | aptitude install fbterm 1> /dev/null

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
sed -i -e '/export TERM=/ d' /etc/zsh/zshenv
echo 'export TERM=fbterm' >> /etc/zsh/zshenv
#echo 'export TERM=screen-256color' >> /etc/zsh/zshenv

sed -i -e '/fbterm -v/ d' /etc/zsh/zlogin
sed -i -e '/fbterm/ d' /etc/zsh/zlogin
sed -i -e '/exit/ d' /etc/zsh/zlogin
#echo 'fbterm -v --cursor-shape=1 /bin/zsh' >> /etc/zsh/zlogin
echo 'fbterm --cursor-shape=1 /bin/zsh' >> /etc/zsh/zlogin
echo 'exit' >> /etc/zsh/zlogin

###########################################
# Installation d'utilitaires en framebuffer
# http://kmandla.wordpress.com/2010/04/16/a-quick-look-at-framebuffer-applications/

echo "Installation d'utilitaires divers" 

# ajout de l'utilitaire fim
# http://www.autistici.org/dezperado/fim/
echo "  Installation de fim"
echo y | aptitude install fim 1> /dev/null

#cd /usr/local/bin
#wget -nv -q -N  http://www.autistici.org/dezperado/fim/fim-0.3-beta-prerelease-20110702.tar.gz
#tar xzf fim-0.3-beta-prerelease-20110702.tar.gz 
#cd fim-0.3-beta-prerelease-20110702 
#./configure -q
#make -s
#make -s install
#cd $OLDPWD


#echo "  Installation de fbida"
# 
# http://www.kraxel.org/cgit/fbida/
#git clone git://git.kraxel.org/fbida /usr/local/bin/fbida
#cd /usr/local/bin/fbida
#./configure 
#make 
#make install
#cd $OLDPWD


#echo "Installationd de zathura"
#echo y | aptitude install zathura 1> /dev/null



