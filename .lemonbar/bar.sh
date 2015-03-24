#!/usr/bin/env bash
#
# bar.sh - by joe
#

## COLORS

cya="#ff3d7070"
yel="#ff89531e"
whi="#ffd0d8e0"

## FUNCTIONS

workspace() {
  for n in {0..8}; do
    if [[ "$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')" = "${n}" ]]; then
      wsn=$((n + 1))
      echo -n "%{B$cya}%{F$whi} ${wsn} %{B-}%{F-}"
    else
      wsn=$((n + 1))
      echo -n "%{B-}%{F-} ${wsn} "
    fi
  done
}

battery() {
    acpi | cut -d' ' -f4 | sed s/,//g
}


clock() {
  TIME=$(date "+%H:%M")
  echo "%{B-}%{F-}${TIME}"
}

## OUTPUT

while :; do
  buf=""
  buf="${buf}$(workspace)"
  buf="${buf}                                                                                                                                   "
  buf="${buf}$(clock)"
  buf="${buf}                                                                                                                                                      "
  buf="${buf}$(battery)"
  echo "${buf}"
  sleep .01;
done
