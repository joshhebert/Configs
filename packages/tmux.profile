# Name of executable to verify
CMD="tmux"

# Check for the existance of a command
if [ $( which $CMD ) != "$CMD not found" > /dev/null 2>&1 ]; then 
    # If all is well, set up aliases
    alias 'tmux'='tmux -2'
    echo "tmux configured"
fi
