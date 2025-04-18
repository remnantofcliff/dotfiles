string=""

if [ -x "$(command -v wpctl)" ]; then
    volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
    string+=" :: ${volume}"
fi

if [ -x "$(command -v wpctl)" ]; then
    microphone="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"
    case $microphone in
        *'MUTED'*) microphone='󰍭' ;;
                *) microphone='' ;;
    esac
    string+=" :: ${microphone}"
fi

BATTERYSTATUS=/sys/class/power_supply/BAT0/status
if [ -f "${BATTERYSTATUS}" ]; then
    batterystatus=$(cat ${BATTERYSTATUS})
    if [ "${batterystatus}" = "Discharging" ]; then
        batterystatus='󰂃'
    else
        batterystatus='󰂄'
    fi
    string+=" :: ${batterystatus}"
fi

BATTERYCAPACITY=/sys/class/power_supply/BAT0/status
if [ -f "${BATTERYCAPACITY}" ]; then
    batterycapacity="$(cat ${BATTERYCAPACITY})%"
    string+=" :: ${batterycapacity}"
fi

if [ -x "$(command -v date)" ]; then
    date=$(date '+%Y-%m-%d %H:%M')
    string+=" :: ${date}"
fi

echo ${string}
