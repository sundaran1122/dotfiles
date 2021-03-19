#!/bin/bash

tiramisu -j | while read -r notif
do
	summary=$(echo $notif | jq '.summary' | cut -d\" -f 2)
	body=$(echo $notif | jq '.body' | cut -d\" -f 2)
	yad --form --align=center --title=Alert --no-buttons \
		--posx=-5 --posy=25 --timeout=1 --width=275 \
		--field="$summary":LBL \
		--field=:LBL \
		--field="$body":LBL < /dev/null
done
