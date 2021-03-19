#!/bin/bash

echo "$(yad --title=Dialog --entry --text='root passwd')
rfkill unblock wifi
ip link set wlp2s0 up
" | su -
