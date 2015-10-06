VPN=$(nmcli conn show --active | grep vpn | cut -d' ' -f1)
if [ $VPN != "" ]; then
    echo " $VPN" 
fi
