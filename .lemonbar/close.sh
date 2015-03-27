cd ~/.lemonbar
if [ -f lemonbar_process.pid ]; then
    cat lemonbar_process.pid | xargs kill
    rm lemonbar_process.pid
fi
if [ -f bar.pid ]; then
    cat bar.pid | xargs kill
    rm bar.pid
fi
