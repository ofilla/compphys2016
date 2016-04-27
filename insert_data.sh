#!/bin/bash

NAME=
FNAME=
MNR=
DIR=

cd $DIR
sed -i "s/Bitte geben Sie ihren Namen an/$NAME/" *.ipynb
sed -i "s/Bitte geben Sie ihre Matrikelnummer an/$MNR/" *.ipynb
rename "s/\./_$FNAME./" *.ipynb
