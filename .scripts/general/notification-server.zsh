#!/bin/bash

tiramisu -j | while read -r notif
do
  summary=$(echo $notif | jq '.summary' | cut -d\" -f 2)
  body=$(echo $notif | jq '.body' | cut -d\" -f 2)
  yad --form --field=$body:LBL --text="$summary" \
    --text-align=center --title=Dialog \
    --geometry=-10+20+0x0 --no-focus \
    --no-buttons --timeout=1
  sleep 1
done
