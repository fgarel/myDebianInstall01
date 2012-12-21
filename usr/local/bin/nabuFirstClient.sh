#!/bin/bash

export DIR=${1%/*}    # dirname
if [ $DIR = $1 ]; then
    DIR=.
fi

export FILE=${1##*/}  # basename 

export RACINE=${FILE%.*}    # suppression des caracteres après le .
export EXTENSION=${FILE#*.} # suppresion des caracteres avant le .

( echo ":Id:" `uuid` ; cat $1 ) | tee $DIR/$RACINE"I."$EXTENSION
