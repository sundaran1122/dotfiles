#!/bin/bash

echo -e "$(yad --title=Dialog --form --field='root passwd':H | cut -d\| -f 1)\nrfkill unblock wifi\nip link set wlp2s0 up\n" | su -
