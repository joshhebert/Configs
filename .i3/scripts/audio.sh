VOLUME=$(amixer | head -n7 | tail -n1 | cut -d' ' -f7 | tr -d "[]" | sed s/%//g)
MUTE=$(amixer | head -n7 | tail -n1 | cut -d' ' -f8 | tr -d "[]")
if [ $MUTE == "off" ]; then
    GLYPH=
    echo $GLYPH
else
    if [ $VOLUME -lt 50 ]; then
        if [ $VOLUME -lt 20 ]; then
            GLYPH=
        else
            GLYPH=
        fi
    else
        GLYPH=
    fi
    echo $VOLUME $GLYPH
fi
