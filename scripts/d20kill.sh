while [[ 1 == 1 ]]; do
    n=$(($RANDOM%20+1))
    echo -n $HOSTNAME
    echo -n " attacks "
    max=$(ps aux | sed 's/ \+/ /g' | cut -d' ' -f2 | tail -n1)
    target=$(($RANDOM%$max+1))
    target=1
    confirm=$(ps aux | grep '\^$target\$' | sed 's/ \+/ /g' | cut -d' ' -f2 | tail -n1)
    echo $confirm
    if [[ $confirm == $target ]]; then
        echo "Confirmed"
    fi
    echo -n $target
    echo -n " with a roll of "
    echo $n

    case $n in 20)
#        kill -9 $1
        echo 'Critical hit!'
        ;;
    1[0-9])
#        kill $1
        echo 'Hit!'
        ;;
    [2-9])
        echo 'Miss!'
        ;;
    1)
#        kill -9 1
        echo 'CRIT FAIL!'
        ;;
    esac
    sleep 1
done
