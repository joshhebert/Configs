#!/usr/bin/env bash

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

volume(){
    amixer | head -n 7 | tail -n 1 | cut -d' ' -f 7-8
}

clock() {
  TIME=$(date "+%H:%M")
  echo "%{B-}%{F-}${TIME}"
}

## OUTPUT

while :; do
  buf=""
  buf="${buf}%{l}$(workspace)"
  buf="${buf}%{c}$(clock)"
  buf="${buf}%{r}BAT0 >> [$(battery)] || AUDIO >> $(volume) "
  echo "${buf}"
  sleep .1;
done
