#!/bin/sh

# Installation et configuration de vim

###########################################
echo "fgaptitudeinstallvim01.sh : Installation et configuration de vim"

mkdir /var/log/fg 2> /dev/null

# suppression des scripts vim
# à l'aide du gestionnaire de plugins vim-addon-manager
#vim-addons -w remove project
#vim-addons -w remove markdown-syntax
#vim-addons -w remove "colors sampler pack"
#vim-addons -w remove python-indent
#vim-addons -w remove supertab
#vim-addons -w remove nerd-commenter
#vim-addons -w remove taglist

# suppression des paquets debian
#echo "y" | aptitude purge ~c
#echo "y" | aptitude remove exuberant-ctags
#echo "y" | aptitude remove vim-addon-manager
#echo "y" | aptitude remove vim-scripts
#echo "y" | aptitude remove vim
#echo "y" | aptitude remove vim-tiny

if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vimtiny.log ]
then
  echo "  Suppression de vim-tiny"
  #echo "y" | aptitude purge ~c > /dev/null
  #echo "y" | aptitude remove exuberant-ctags \
  #                           vim-addon-manager \
  #                           vim-scripts \
  #                           vim \
  #                           vim-tiny > /dev/null
  echo y | aptitude remove vim-nox 1> /dev/null
  echo y | aptitude remove vim-tiny 1> /dev/null
  echo y | aptitude remove vim-runtime 1> /dev/null 2> /dev/null
  echo y | aptitude remove vim-common 1> /dev/null 2> /dev/null
  # attention, il ne faut pas purger, car sinon, il y a risque de perdre
  # les fichiers /etc/vim/vimrc
  echo y | aptitude purge "~c" > /dev/null
  cp /root/myDebianInstall01/etc/vim/vimrc /etc/vim/vimrc
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vimtiny.log
fi

# installation des paquets debian
if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vimnox.log ]
then
  echo "  Installation de vim-nox"
  #echo y | aptitude install vim 1> /dev/null
  #echo y | aptitude reinstall vim 1> /dev/null
  #echo y | aptitude install libperl5.10/stable 1> /dev/null
  #echo y | aptitude install libperl5.10
  #echo y | aptitude install vim-nox 1> /dev/null
  echo y | aptitude install vim-common/testing 1> /dev/null
  echo y | aptitude install vim-runtime/testing 1> /dev/null
  echo y | aptitude install vim-nox/testing 1> /dev/null
  #aptitude install exuberant-ctags
  #aptitude install vim-scripts
  #echo "y" | aptitude install vim-addon-manager
  #echo "y" | aptitude install git

  # pour faire en sorte que le zsh mettre a jour son cache
  # hash -rf
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vimnox.log
fi


if [ ! -e /var/log/fg/fgaptitudeinstallvim01-colorscheme.log ]
then
  echo "  Installation des color scheme"
  cd /etc/vim/colors
  wget -nv -q -N http://vimcolorschemetest.googlecode.com/svn/colors/BlackSea.vim -O BlackSea.vim
  wget -nv -q -N http://vimcolorschemetest.googlecode.com/svn/colors/doriath.vim -O doriath.vim
  wget -nv -q -N http://vimcolorschemetest.googlecode.com/svn/colors/graywh.vim -O graywh.vim
  wget -nv -q -N http://vimcolorschemetest.googlecode.com/svn/colors/herald.vim -O herald.vim
  #pour charger l'ensemble des themes
  #wget -nv -q -N -nd -r -l1 --no-parent -A.vim http://vimcolorschemetest.googlecode.com/svn/colors/
  # petit hack pour le theme herald
  cp /etc/vim/colors/herald.vim /etc/vim/colors/fgherald.vim
  sed -i -e 's/hi CursorColumn   ctermbg=0/hi CursorColumn   ctermbg=4/g' \
      /etc/vim/colors/fgherald.vim
  sed -i -e 's/hi CursorLine     ctermbg=0/hi CursorLine     ctermbg=4/g' \
      /etc/vim/colors/fgherald.vim
  cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-colorscheme.log
fi

# installation des dictionnaires de langue
if [ ! -e /var/log/fg/fgaptitudeinstallvim01-lang.log ]
then
  # cf http://ensiwiki.ensimag.fr/index.php/Vimrc_minimal#Vim_correcteur_orthographique
  # cf /etc/vim/vimrc.fg
  # http://vim-fr.org/index.php/Correction_orthographique
  echo "  Récupération et installation des dictionnaires de langue"
  VER=`vim --version | grep "VIM - Vi IMproved " | sed -e "s/VIM - Vi IMproved //g" | sed -e "s/ (.*)$//g" | sed -e "s/\.//g"`
  VIMPATH="/usr/share/vim/vim"$VER"/spell"
  cd $VIMPATH
  #wget -nv -q -N http://ftp.vim.org/vim/runtime/spell/fr.latin1.spl -O fr.latin1.spl
  #wget -nv -q -N http://ftp.vim.org/vim/runtime/spell/fr.latin1.sug -O fr.latin1.sug
  wget -nv -q -N http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl -O fr.utf-8.spl
  wget -nv -q -N http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug -O fr.utf-8.sug
  cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-lang.log
fi

# installation des scripts vim
# à l'aide du gestionnaire de plugins vim-addon-manager
#vim-addons -w install taglist
#vim-addons -w install nerd-commenter
##vim-addons -w install snipmate
#vim-addons -w install supertab
#vim-addons -w install python-indent
#vim-addons -w install "colors sampler pack"
#vim-addons -w install markdown-syntax
#vim-addons -w install project

# installation du gestionnaire d'extension vim vundle
if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vundle01.log ]
then
  echo "  Récupération du gestionnaire d'extension vundle"
  #git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  #git clone http://github.com/gmarik/vundle.git /etc/vim/bundle/vundle
  #git clone git://github.com/gmarik/vundle.git /etc/vim/bundle/vundle
  #git clone --progress --verbose https://github.com/gmarik/vundle.git /etc/vim/bundle/vundle
  git clone --progress --verbose https://github.com/gmarik/vundle.git /etc/vim/bundle/vundle 2> /dev/null
  cd /etc/vim/bundle/vundle
  git fetch --progress --verbose
  cd $OLDPWD
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vundle01.log
fi

# installation des plugins vim
# à l'aide du gestionnaire de plugins vundle
if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vundle02.log ]
then
  echo "  Installation des extensions vim"
  # petit hack pour ne pas voir les installations des bundles
  sed -i -e 's/  echo a:msg/  " echo a:msg/g' \
      /etc/vim/bundle/vundle/autoload/vundle/installer.vim
  vim +BundleInstall! +BundleClean! +q +q +q
  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vundle02.log
fi

if [ ! -e /var/log/fg/fgaptitudeinstallvim01-vimpager.log ]
then
  echo "  Installation de vimpager en tant que pager"
  rm -f /usr/bin/vimpager
  #cp ~/.vim/bundle/vimpager/vimpager /usr/bin/vimpager
  #chmod +x /usr/bin/vimpager
  chmod +x /etc/vim/bundle/vimpager/vimpager
  ln -s /etc/vim/bundle/vimpager/vimpager /usr/bin/vimpager

  update-alternatives --install /usr/bin/pager pager /usr/bin/vimpager 50 1> /dev/null
  update-alternatives --remove pager /bin/more 1> /dev/null
  update-alternatives --remove pager /bin/less 1> /dev/null
  update-alternatives --remove view /usr/bin/see 1> /dev/null
  update-alternatives --remove view /usr/bin/vim.nox 1> /dev/null

  date +"%F %T" >> /var/log/fg/fgaptitudeinstallvim01-vimpager.log
fi

## cascadenik-vim : cf ajashton/cascadenik-vim
# => done : dans /etc/vim/vimrc.vundle

