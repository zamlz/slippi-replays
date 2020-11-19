#!/usr/bin/env sh

# clean slippi files

find . -type f -name "*.slp" | while read -r line; do

year=$( echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\1/')
month=$(echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\2/')
day=$(  echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\3/')

mkdir -p $year/$month/$day
mv $line $year/$month/$day/$line

done
