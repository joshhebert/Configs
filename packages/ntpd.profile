# Name of executable to verify
CMD="ntpd"

# Check for the existance of a command
if [ $( which $CMD ) != "$CMD not found" > /dev/null 2>&1 ]; then 
    # If all is well, set up aliases
    alias 'synctime'='sudo ntpd -gq'
fi
