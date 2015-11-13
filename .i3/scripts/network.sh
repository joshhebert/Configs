WIRELESS=$(nmcli conn show --active | grep "802-11-wireless" | cut -d' ' -f1)

if [ $WIRELESS != "" ]; then
    STATE="$WIRELESS"
fi

echo $STATE

