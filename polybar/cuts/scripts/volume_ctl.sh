#!/usr/bin/env bash

# Clamp volume to 0–100% on the default sink.

step="${2:-5}"
sink="@DEFAULT_SINK@"

get_vol() {
  pactl get-sink-volume "$sink" 2>/dev/null | awk 'NR==1{for(i=1;i<=NF;i++) if ($i ~ /%$/){gsub("%","",$i); print $i; exit}}'
}

clamp_0_100() {
  local v=$1
  (( v < 0 )) && v=0
  (( v > 100 )) && v=100
  echo "$v"
}

case "${1:-}" in
  up)
    cur="$(get_vol)"; cur="${cur:-0}"
    new=$(( cur + step ))
    new="$(clamp_0_100 "$new")"
    pactl set-sink-volume "$sink" "${new}%"
    ;;
  down)
    cur="$(get_vol)"; cur="${cur:-0}"
    new=$(( cur - step ))
    new="$(clamp_0_100 "$new")"
    pactl set-sink-volume "$sink" "${new}%"
    ;;
  set)
    val="${2:-0}"
    val="$(clamp_0_100 "$val")"
    pactl set-sink-volume "$sink" "${val}%"
    ;;
  *)
    exit 1
    ;;
esac

