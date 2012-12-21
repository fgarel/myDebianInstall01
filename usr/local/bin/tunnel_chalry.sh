#!/bin/sh

# creation d'un demi-tunnel allant d'un serveur OVH vers dsiappli9.mairie.fr

ssh -f \
    -N \
    -o ServerAliveInterval=30 \
    -R 33389:dsiappli9.mairie.fr:3389 \
    -R 30080:dsiappli9.mairie.fr:80 \
    root@94.23.233.94
