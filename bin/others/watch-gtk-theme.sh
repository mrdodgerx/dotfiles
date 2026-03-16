#!/bin/bash
while inotifywait -e close_write ~/.config/gtk-3.0/settings.ini; do
    ~/.config/bin/sync-gtk-theme.sh
done
