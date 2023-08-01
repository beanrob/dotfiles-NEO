#!/bin/sh

while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    plugged=$(acpi -b | grep -o -F "Charging")
    if [ "$plugged" = "Charging" ]; then
        if [ "$battery_percent" -gt 89 ]; then
            notify-send "Battery full." "Level: ${battery_percent}% " --icon=battery
            #paplay /usr/share/sounds/ubuntu/ringtones/Alarm\ clock.ogg
        fi
	else
		if [ "$battery_percent" -lt 16 ]; then
			notify-send "Battery low." "Level: ${battery_percent}% " --icon=battery
		fi
	fi
    sleep 60 # (1 minute)
done
