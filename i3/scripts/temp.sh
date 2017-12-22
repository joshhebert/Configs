#!/bin/zsh

TEMP_STRING=$(sensors -u | grep coretemp-isa-0000 -A 26)

CORE_1=$(echo $TEMP_STRING | grep temp1_input | cut -d' ' -f 4 | cut -c 1-4)
CORE_2=$(echo $TEMP_STRING | grep temp2_input | cut -d' ' -f 4 | cut -c 1-4)
CORE_3=$(echo $TEMP_STRING | grep temp3_input | cut -d' ' -f 4 | cut -c 1-4)
CORE_4=$(echo $TEMP_STRING | grep temp4_input | cut -d' ' -f 4 | cut -c 1-4)

echo "$CORE_1°C, $CORE_2°C, $CORE_3°C, $CORE_4°C" 

