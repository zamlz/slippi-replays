#!/usr/bin/env sh

# clean slippi files
SLIPPI_REPLAY_DIR="$HOME/sys/netplay/replays"
cd $SLIPPI_REPLAY_DIR

find . -maxdepth 1 -type f -name "*.slp" | while read -r line; do

    year=$( echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\1/')
    month=$(echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\2/')
    day=$(  echo $line | sed -r 's/\.\/Game_([0-9]{4})([0-9]{2})([0-9]{2}).*/\3/')

    mkdir -p $SLIPPI_REPLAY_DIR/$year/$month/$day
    mv $line $SLIPPI_REPLAY_DIR/$year/$month/$day/$(basename $line)

done

if [ $(pwd) = "$SLIPPI_REPLAY_DIR" ]; then
    git add $SLIPPI_REPLAY_DIR
    git commit -m "Added replays"
else
    echo "Not in $SLIPPI_REPLAY_DIR"
fi


