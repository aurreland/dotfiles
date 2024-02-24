#!/run/current-system/sw/bin/bash

STATUS="$(mpc status)"
COVER="/tmp/.music_cover.png"
MUSIC_DIR="$HOME/Media/Music"

## Get status
get_status() {
	if [[ $STATUS == *"[playing]"* ]]; then
		echo "󰐍"
	else
		echo "󰏦"
	fi
}

## Get song
get_song() {
	song=`playerctl metadata title`
	if [[ -z "$song" ]]; then
		echo ""
	else
		echo "$song"
    fi
}
## Execute accordingly
if [[ "$1" == "--song" ]]; then
	get_song
elif [[ "$1" == "--status" ]]; then
	get_status
fi
