#!/run/current-system/sw/bin/sh

# Define Icons for Workspaces
icons=(0 󱄅   󰻞 󰎆 6 7 8 9)
icons2=(0 ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉)

workspaces() {

    # ows="$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | sort -n)"
    # result="(box :class \"works\" :orientation \"h\" :space-evenly \"false\" :halign \"start\" :spacing 5 "
    # for num in $ows; do
    #     if [ "$num" -eq "$(hyprctl activeworkspace -j | jq '.id')" ]; then
    #         result+="(button :class \"focused\":onclick \"hyprctl dispatch workspace $num\" \"${icons[$num]} ${icons2[$num]}\") "
    #     else
    #         result+="(button :class \"workspace\" :onclick \"hyprctl dispatch workspace $num\" \"${icons[$num]} ${icons2[$num]}\") "
    #     fi
    # done
    # result+=")"
    # echo -e $result

ws1="1"
ws2="2"
ws3="3"
ws4="4"
ws5="5"

Unoccupied
un="u"

check if Occupied
o1=$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | grep "$ws1" )
o2=$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | grep "$ws2" )
o3=$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | grep "$ws3" )
o4=$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | grep "$ws4" )
o5=$(hyprctl workspaces -j | jq -r '.[] | select(.id >= 0) | .id' | grep "$ws5" )

check if Focused
f1=$(hyprctl activeworkspace -j | jq '.id' | grep "$ws1" )
f2=$(hyprctl activeworkspace -j | jq '.id' | grep "$ws2" )
f3=$(hyprctl activeworkspace -j | jq '.id' | grep "$ws3" )
f4=$(hyprctl activeworkspace -j | jq '.id' | grep "$ws4" )
f5=$(hyprctl activeworkspace -j | jq '.id' | grep "$ws5" )

ic_1=""
ic_2=""
ic_3=""
ic_4=""
ic_5=""
if [ $f1 ]; then
    ic_1=""
elif [ $f2 ]; then
    ic_2=""
elif [ $f3 ]; then
    ic_3=""
elif [ $f4 ]; then
    ic_4=""
elif [ $f5 ]; then
    ic_5=""
fi

echo 	"(box	:class \"works\"	:orientation \"h\" :spacing 5 :space-evenly \"false\" (button :onclick \"hyprctl dispatch workspace $ws1\"	:class	\"$un$o1$f1\"	\"$ic_1\") (button :onclick \"hyprctl dispatch workspace $ws2\"	:class \"$un$o2$f2\"	 \"$ic_2\") (button :onclick \"hyprctl dispatch workspace $ws3\"	:class \"$un$o3$f3\" \"$ic_3\") (button :onclick \"hyprctl dispatch workspace $ws4\"	:class \"$un$o4$f4\"	\"$ic_4\") (button :onclick \"hyprctl dispatch workspace $ws5\"	:class \"$un$o5$f5\" \"$ic_5\"))"


}

workspaces
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
workspaces
done
