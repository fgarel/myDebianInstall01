#!/bin/sh
sh <(curl http://j.mp/spf13-vim3 -L)
echo colorscheme molokai >> ~/.vimrc.local
echo \'spf13/vim-colors\' >> ~/.vimrc.bundles.local
