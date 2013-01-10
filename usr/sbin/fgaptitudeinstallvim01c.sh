#!/bin/sh

# Installation et configuration de vim
###########################################
echo "fgaptitudeinstallvim01c.sh : Installation et configuration de vim"

mkdir /var/log/fg 2> /dev/null


# installation des plugins vim
# à l'aide du gestionnaire de plugins vundle
#if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vundle02.log ]
#then
  echo "  Installation des extensions vim"
  vim +BundleInstall! +BundleClean! +q +q +q
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vundle02.log
#fi

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
  update-alternatives --remove view /usr/bin/vim.nox 1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vimpager.log
fi


