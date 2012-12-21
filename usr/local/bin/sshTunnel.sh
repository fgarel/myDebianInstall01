#!/bin/sh
ssh -f \
    -N \
    -o ServerAliveInterval=30 \
    -R 10022:localhost:22 \
    -R 13389:dsiappli29.mairie.fr:3389 \
    -R 15432:dsidbb09.mairie.fr:59432 \
    -R 15433:dsidbb09.mairie.fr:59433 \
    root@94.23.233.94

