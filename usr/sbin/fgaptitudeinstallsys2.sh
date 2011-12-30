#!/bin/sh

###########################################
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
