string=""

if [ -x "$(command -v wpctl)" ]; then
    volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
    string="${string} :: ${volume}"
fi

if [ -x "$(command -v wpctl)" ]; then
    microphone="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"
    case $microphone in
        *'MUTED'*) microphone='󰍭' ;;
                *) microphone='' ;;
    esac
    string="${string} :: ${microphone}"
fi

BATTERYSTATUS=/sys/class/power_supply/BAT0/status
if [ -f "${BATTERYSTATUS}" ]; then
    batterystatus=$(cat ${BATTERYSTATUS})
    if [ "${batterystatus}" = "Discharging" ]; then
        batterystatus='󰂃'
    else
        batterystatus='󰂄'
    fi
    string="${string} :: ${batterystatus}"
fi

BATTERYCAPACITY=/sys/class/power_supply/BAT0/capacity
if [ -f "${BATTERYCAPACITY}" ]; then
    batterycapacity="$(cat ${BATTERYCAPACITY})%"
    string="${string} :: ${batterycapacity}"
fi

if [ -x "$(command -v date)" ]; then
    date=$(date '+%Y-%m-%d %H:%M')
    string="${string} :: ${date}"
fi

echo ${string}
