#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

#
echo "bfsys3.sh :                    blueflamingo systeme"

# installations pouvant être executées par le debian installer
aptitude -y safe-upgrade
aptitude -y install python3.4 python3.4-venv
#
# installation de pyenv (pyenv-installer)
export PYENV_ROOT="/opt/.pyenv" ; curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
export PATH="/opt/.pyenv/bin:$PATH"

# installation de pyvenv-virtualenvwrapper
git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git /opt/.pyenv/plugins/pyenv-virtualenvwrapper
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#fgaptitude-preseed.sh
#bfsys-preseed.sh
#fgaptitude-gisuser-preseed.sh

# installations ne pouvant pas être executées par le debian installer
#fgaptitude-postpreseed.sh
#fgaptitude-gisuser-postpreseed.sh

