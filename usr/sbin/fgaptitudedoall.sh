#!/bin/sh

export https_proxy=$http_proxy
export LANG=fr_FR.UTF-8

# installation pouvant être executée par le debian installer
fgaptitudedo01.sh

# installation ne pouvant pas être executée par le debian installer
fgaptitudedo02.sh

