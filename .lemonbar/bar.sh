#!/usr/bin/env bash

## COLORS

echo $$ > bar.pid

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

temp(){
    acpi -t | head -n1 | cut -d' ' -f 4  
}


battery() {
    acpi | cut -d' ' -f4 | sed s/,//g
}

volume(){
    amixer | head -n 7 | tail -n 1 | cut -d' ' -f 7-8
}

clock() {
  TIME=$(date "+%H:%M:%S - %A, %B %e")
  echo "%{B-}%{F-}${TIME}"
}

## OUTPUT

while :; do
  buf=""
  buf="${buf}%{l}$(workspace)"
  buf="${buf}%{c}$(clock)"
  buf="${buf}%{r}TEMP >> [$(temp)°C] || BAT0 >> [$(battery)] || AUDIO >> $(volume)"
  echo "${buf}"
  sleep .2;
done
