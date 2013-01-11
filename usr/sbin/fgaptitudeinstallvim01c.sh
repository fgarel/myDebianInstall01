#!/bin/sh

# Installation et configuration de vim
###########################################
echo "fgaptitudeinstallvim01c.sh : Installation et configuration de vim"

mkdir /var/log/fg 2> /dev/null

# utilisation de vimpager en tant que pager,
# et nettoyage des alternatives
# installation de vimpager
if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vimpager.log ]
then
  echo "  Installation de vimpager en tant que pager"
  rm -f /usr/bin/vimpager
  cp ~/.vim/bundle/vimpager/vimpager /usr/bin/vimpager
  chmod +x /usr/bin/vimpager
  #chmod +x /etc/vim/bundle/vimpager/vimpager
  #ln -s /etc/vim/bundle/vimpager/vimpager /usr/bin/vimpager

  update-alternatives --install /usr/bin/pager pager /usr/bin/vimpager 50 1> /dev/null
  update-alternatives --remove pager /bin/more 1> /dev/null
  update-alternatives --remove pager /bin/less 1> /dev/null
  update-alternatives --remove view /usr/bin/see 1> /dev/null
  #update-alternatives --remove view /usr/bin/vim.nox 1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vimpager.log
fi


