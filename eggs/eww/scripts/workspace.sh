#!/usr/bin/env nix-shell
#!nix-shell -i bash -p socat jq

workspaces() {
    ows="$(hyprctl workspaces -j | jq -r '.[] | select(.id > 0) | .id' | sort -n)"
    active_ws="$(hyprctl monitors -j | jq -r '.[].activeWorkspace.id')"

    result="(eventbox :class \"full-width\" :onscroll \"scripts/scroll_workspace.sh {}\" (box :class \"workspaces\" :orientation \"h\" :space-evenly \"false\" :halign \"start\" :spacing 5 "

    for num in $ows; do
        if [ "$num" -eq "$active_ws" ]; then
            result+="(button :class \"active\" :onclick \"hyprctl dispatch workspace $num\" \"$num\") "
        else
            result+="(button :class  \"inactive\" :onclick \"hyprctl dispatch workspace $num\" \"$num\") "
        fi
    done

    result+="))"
    echo -e "$result"
}


workspaces
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
workspaces
done
