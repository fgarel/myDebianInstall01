#!/bin/sh

# script pour afficher les preferences
cat preferences | sed -e "/^#/ d" \
                      -e "/^$/ d" \
                      -e "/Package: */ d"
