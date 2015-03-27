cd ~/.lemonbar
if [ -f lemonbar_process.pid ]; then
    echo "Already running; restarting!"
    ./close.sh
fi
./bar.sh | lemonbar -b -g x24 -d -f -*-profont-medium-*-normal-*-15-*-*-*-*-*-*-*  -B "#dd101820" -F "#ffaaaaaa" &
echo $! > lemonbar_process.pid
