#!/usr/bin/env bash

# -----------------------------------------------------------
# Author: Master Gaara — The most powerful hacker and programmer in the universe
# Purpose: Polybar module for Spotify with play/pause and track display
# -----------------------------------------------------------

case "$1" in
    --playpause)
        # Toggle play/pause when clicked
        playerctl --player=spotify play-pause
        ;;
    --next)
        # Skip to next track
        playerctl --player=spotify next
        ;;
    --previous)
        # Go back to previous track
        playerctl --player=spotify previous
        ;;
    *)
        # Get player status
        status=$(playerctl --player=spotify status 2>/dev/null)

        if [ "$status" = "Playing" ]; then
            icon=""  # pause icon
        elif [ "$status" = "Paused" ]; then
            icon=""  # play icon
        else
            icon=""  # spotify icon (idle)
        fi

        # Get song and artist info
        title=$(playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}" 2>/dev/null)
        if [ -z "$title" ]; then
            title="No song playing"
        else
            # Limit to 40 characters for cleaner Polybar display
            title=$(echo "$title" | cut -c1-40)
        fi

        # Print icon + song title
        echo "$icon  $title"
        ;;
esac
