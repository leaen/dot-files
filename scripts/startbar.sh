#!/bin/sh

pkill lemonbar
~/scripts/bar.sh | lemonbar -p -g 1880x50+20+20 -f "Dina" -f "FontAwesome" &
