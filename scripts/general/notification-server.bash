#!/bin/dash

tiramisu -j | while read -r notif
do
	summary=$(echo $notif | jq '.summary' | cut -d\" -f 2)
	body=$(echo $notif | jq '.body' | cut -d\" -f 2)
	app=$(echo $notif | jq '.app_name' | cut -d\" -f 2)

	timeout=$(echo $notif | jq '.timeout' | cut -d\" -f 2)

	[ $timeout -lt 1 ] && timeout=1

	yad --form --align=center --title=Alert --no-buttons \
		--posx=-5 --posy=25 --timeout="$timeout" --width=275 \
		--field="<i>$app:</i>   $summary":LBL \
		--field=:LBL \
		--field="$body":LBL < /dev/null
done
