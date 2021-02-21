#!/bin/zsh

tail -f /tmp/wm/notifications | while read -r notification
do
  yad --text=$notification --title=Dialog \
    --geometry=-10+20+30x10 --no-focus \
    --no-buttons --timeout=1
  sleep 1
done
