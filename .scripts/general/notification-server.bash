#!/bin/bash

tiramisu -j | while read -r notif
do
  summary=$(echo $notif | jq '.summary' | cut -d\" -f 2)
  body=$(echo $notif | jq '.body' | cut -d\" -f 2)
  yad --form --align=center --field="$summary":LBL --field=:LBL \
    --field="$body":LBL \
    --no-buttons --posx=-5 --posy=25 --width=250 \
    --title=Alert --timeout=1 --no-focus
done
