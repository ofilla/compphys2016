#!/bin/bash
# delete personal data from files

DIR=
FNAME=
NAME=
MNR=

find $DIR -type d -name .ipynb_checkpoints | xargs rm -rf
find $DIR/* -name "*_$FNAME*" | xargs rename "s/_$FNAME//g"
files=`find $DIR/* -name "*.ipynb"`

for f in $files
do
  sed -i "s/$NAME/Bitte geben Sie ihren Namen an/g" $f
  sed -i "s/$MNR/Bitte geben Sie ihre Matrikelnummer an/g" $f
done
