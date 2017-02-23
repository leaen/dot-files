#!/bin/bash

while :; do
    buf=""
    buf="${buf}%{l}%{O20}"

    buf="${buf}$(date '+%A %B %d')"
    buf="${buf} - MEL $(date '+%r')"
    buf="${buf} - LON $(date -d "-11 hours" '+%r')"
    buf="${buf} - NYC $(date -d "-16 hours" '+%r')"

    buf="${buf}%{r}"

    buf="${buf}BAT: [$(cat /sys/class/power_supply/BAT0/capacity)%]"
    buf="${buf} - "
    buf="${buf}RAM: [$(free -m | head -n 2 | tail -n 1 | awk '{ printf "%i\n", $3/$2 * 100 }')%]"
    buf="${buf} - "
    buf="${buf}CPU: [$(mpstat | awk '$12 ~ /[0-9.]+/ { printf "%i\n", 100 - $12"%" }')%]"
    buf="${buf} - "
    buf="${buf}Vol: $(amixer sget Master | awk '$6 { print $4 }')"

    buf="${buf}%{O20}"
    echo -e $buf
    sleep .5
done
