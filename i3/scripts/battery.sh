PERCENT=$(acpi | cut -d' ' -f4 | sed s/,$//g | sed s/%$//g)
STATE=$(acpi | cut -d' ' -f3 | sed s/,$//g)

if [ $STATE == "Charging" ]; then
    GLYPH=
else
    if [ $PERCENT -gt 90 ]; then
        GLYPH=
    else
        if [ $PERCENT -gt 60 ]; then
            GLYPH=
        else
            if [ $PERCENT -gt 25 ]; then
                GLYPH=
            else
                GLYPH=
            fi
        fi
    fi
fi

echo $PERCENT% $GLYPH
