#!/bin/bash

tiramisu | while read -r notif
do
  summary=$(echo $notif | grep ^summary | cut -d: -f 2)
  [[ $summary == "" ]] && continue
  yad --text=$summary --title=Dialog \
    --geometry=-10+20+30x10 --no-focus \
    --no-buttons --timeout=1
  sleep 1
done
