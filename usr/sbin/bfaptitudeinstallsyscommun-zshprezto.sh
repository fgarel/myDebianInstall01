#!/bin/sh

# 1ère partie des applications "système"

###########################################
echo "bfaptitudeinstallsyscommun-zshprezto.sh :       Installation de zsh"


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
  echo "  Sauvegarde des fichiers de configuration zsh existants"
  mv /etc/zsh/zlogin /etc/zsh/zlogin_sav 2> /dev/null
  mv /etc/zsh/zlogout /etc/zsh/zlogout_sav 2> /dev/null
  mv /etc/zsh/zprofile /etc/zsh/zprofile_sav 2> /dev/null
  mv /etc/zsh/zshenv /etc/zsh/zshenv_sav 2> /dev/null
  mv /etc/zsh/zshrc /etc/zsh/zshrc_sav 2> /dev/null

  echo "  Installation de zsh"
  echo y | aptitude install zsh 1> /dev/null

  echo "  Sauvegarde des fichiers de configuration zsh du responsable du paquet"
  mv /etc/zsh/zprofile /etc/zsh/zprofile_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zshrc /etc/zsh/zshrc_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zshenv /etc/zsh/zshenv_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zlogin /etc/zsh/zlogin_mainteneur_debian 2> /dev/null
  mv /etc/zsh/zlogout /etc/zsh/zlogout_mainteneur_debian 2> /dev/null

  echo "  Installation de zsh-antigen"
  echo y | aptitude install zsh-antigen 1> /dev/null

  cd /etc/
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/dir_colors
  cd $OLDPWD

  echo "  Récupération des fichiers de configuration zsh de la formation debian"
  # recuperation des fichiers de configuration de la formation Debian
  # http://formation-debian.via.ecp.fr/shell.html
  cd /etc/zsh
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zshrc -O zshrc_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zshenv -O zshenv_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zlogin -O zlogin_formation_debian
  wget -nv -q -N http://formation-debian.via.ecp.fr/fichiers-config/zlogout -O zlogout_formation_debian
  #cp /etc/zsh/zshrc /etc/zsh/zshrc_formation_debian
  cd $OLDPWD

  echo "  Récupération des fichiers de configuration zsh de grml"
  cd /etc/zsh
  wget -nv -q -N http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc -O zshrc_grml
  cd $OLDPWD

  echo "  Récup�ation et installation de prezto"
  git clone --progress --verbose --recursive https://github.com/sorin-ionescu/prezto.git "${BLUEFLAMINGO_ROOT}/../.zprezto" 2> /dev/null
  cd "${BLUEFLAMINGO_ROOT}/../.zprezto"
  git fetch --progress --verbose
  cd $OLDPWD
  # creation des liens
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zlogin /etc/zsh/zlogin
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zlogout /etc/zsh/zlogout
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zpreztorc /etc/zsh/zpreztorc
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zprofile /etc/zsh/zprofile
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zshenv /etc/zsh/zshenv
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zshrc /etc/zsh/zshrc
  ln -s ${BLUEFLAMINGO_ROOT}/../.zprezto/runcoms/zshrc /etc/zsh/zshrc_zprezto

  echo "  Recopie du fichier zshrc special antigen"
  rm /etc/zsh/zshrc
  cp ${BLUEFLAMINGO_ROOT}/etc/zsh/zshrc_antigen /etc/zsh/zshrc 2> /dev/null
  cp ${BLUEFLAMINGO_ROOT}/etc/zsh/zshrc_antigen /home/blueflamingo/.zshrc 2> /dev/null
  cp ${BLUEFLAMINGO_ROOT}/etc/zsh/zshrc_antigen /root/.zshrc 2> /dev/null
  chown -R blueflamingo:blueflamingo /home/blueflamingo

  echo "  Changement du shell par defaut pour les futurs utilisateurs"
  # pour changer le shell des futurs utilisateurs
  # http://askubuntu.com/questions/28969/how-do-you-change-the-default-shell-for-all-users-to-bash
  sed -i -e 's/DSHELL=\/bin\/bash/DSHELL=\/bin\/zsh/g' /etc/adduser.conf

  # pour changer le shell de l'utilisateur en cours
  # https://wiki.archlinux.org/index.php/Zsh
  #echo "/usr/bin/zsh" | chsh
  chsh -s /bin/zsh root
  chsh -s /bin/zsh blueflamingo

  echo "  Source de /etc/zsh/zshrc"
  source /etc/zsh/zshrc
  . /etc/zsh/zshrc
  cd /home/blueflamingo
  . /etc/zsh/zshrc
  cd $OLDPWD
  cd /root
  . /etc/zsh/zshrc
  cd $OLDPWD
  #`/etc/zsh/zshrc`
  #/bin/zsh /etc/zsh/zshrc

  date +"%F %T" >> /var/log/bf/bfaptitudeinstallsyscommun-zsh-zsh.log
fi
