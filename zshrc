# We rely on .profile to give us platform specific PATH
# Also, we'd like it to set a PLATFORM variable if it's not
# Linux, as there's some stuff like ls that doesn't work properly on Mac
source ~/.profile

# Set up golang stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Set path
if [[ $USER = "root" ]]; then
    IS_ROOT=true
else
    IS_ROOT=false
fi

# Use the scripts pulled as part of this repo in my path, as
# well as scripts that are specific to each machine (not
# included in the repo)
export PATH="$PATH:$HOME/.local/lbin:$HOME/.local/gbin"

# Autoloads
	autoload -U compinit && compinit
	autoload -Uz up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	autoload -Uz down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	autoload -U colors && colors

# The most imprtant bit
	export EDITOR=nvim

# Plugin loading

    # Use antigen for what we can
	source ~/.zsh/antigen/antigen.zsh
        antigen use oh-my-zsh

        # Be more like fish
        antigen bundle zsh-users/zsh-syntax-highlighting

        # Tell me where to get what I need
        antigen bundle zsh-users/zsh-completions src

        # Better directory traversal
        antigen bundle rupa/z
            add-zsh-hook precmd _z_precmd
            function _z_precmd {
                _z --add "$PWD"
            }

        # Sometimes I forget what's installed
        # On Arch, you MUST have pkgfile installed
        antigen bundle command-not-found

    antigen apply

    # Please for the love of god have scmpuff
    eval "$(scmpuff init -s)"

# Colors for ls
    # Check if we have dircolors
    which dircolors > /dev/null
    if [[ $? == 0 ]]; then
        eval $(dircolors ~/.dir_colors)
    fi
# Get rid of the disgusting default dark blue when globbing with zsh-syntax-highlighting
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=063



# Generic aliases that will work on virtually any machine
	alias '..'='cd ..'
	alias '...'='cd ../..'
	alias '....'='cd ../../..'
	alias 'gping'='ping google.com'
    if [[ $PLATFORM = "MAC" ]]; then
        alias 'l'='ls'
        alias 'la'='ls -A'
        alias 'll'='ls -Al'
    else
        alias 'l'='ls --color=auto'
        alias 'ls'='ls --color=auto'
        alias 'la'='ls -A --color=auto'
        alias 'll'='ls -Al --color=auto'
    fi
    alias 'vi'='nvim'
    alias 'vim'='nvim'
    alias 'sudi'='sudo -i'
    alias 'gps'='git push'
    alias 'gpl'='git pull'
    alias 'gc'='git commit'
    alias 'gu'='git reset HEAD --' # Unstage a file
    alias 'gr'='git reset --hard'
    alias 'gpuoff'='sudo rmmod nvidia_modeset; sudo rmmod nvidia; sudo tee /proc/acpi/bbswitch <<< OFF'
    alias 'share'='python2 -m SimpleHTTPServer'
#Options
	setopt AUTO_CD
	setopt MULTIOS
	setopt AUTO_PUSHD
	setopt AUTO_NAME_DIRS
	setopt GLOB_COMPLETE
	setopt PUSHD_MINUS
	setopt PUSHD_TO_HOME
	setopt RM_STAR_WAIT
	setopt ZLE
	setopt NO_BEEP
	setopt NO_CLOBBER
	setopt NO_CASE_GLOB
	setopt NUMERIC_GLOB_SORT
	setopt EXTENDED_GLOB
	setopt RC_EXPAND_PARAM
	setopt prompt_subst

# Stylistic choices
	# Faster! (?)
	zstyle ':completion::complete:*' use-cache 1

	# case insensitive completion
	zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

	zstyle ':completion:*' verbose yes
	zstyle ':completion:*:descriptions' format '%B%d%b'
	zstyle ':completion:*:messages' format '%d'
	zstyle ':completion:*:warnings' format 'No matches for: %d'
	zstyle ':completion:*' group-name ''
	#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
	zstyle ':completion:*' completer _expand _complete _approximate _ignored

	# generate descriptions with magic.
	zstyle ':completion:*' auto-description 'specify: %d'

	# Don't prompt for a huge list, page it!
	zstyle ':completion:*:default' list-prompt '%S%M matches%s'

	# Don't prompt for a huge list, menu it!
	zstyle ':completion:*:default' menu 'select=0'

	# Have the newer files last so I see them first
	zstyle ':completion:*' file-sort modification reverse

	# color code completion!!!!  Wohoo!
	zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

	unsetopt LIST_AMBIGUOUS
	setopt	COMPLETE_IN_WORD

	# Separate man page sections.  Neat.
	zstyle ':completion:*:manuals' separate-sections true


# History stuffs
	HISTFILE=~/.history

	# Remember about a years worth of history (AWESOME)
	SAVEHIST=10000
	HISTSIZE=10000

	# Don't overwrite, append!
	setopt APPEND_HISTORY

	# Write after each command
	setopt INC_APPEND_HISTORY

	# Killer: share history between multiple shells
	setopt SHARE_HISTORY

	# If I type cd and then cd again, only save the last one
	setopt HIST_IGNORE_DUPS

	# Even if there are commands inbetween commands that are the same, still only save the last one
	setopt HIST_IGNORE_ALL_DUPS

	# Pretty	Obvious.  Right?
	setopt HIST_REDUCE_BLANKS

	# If a line starts with a space, don't save it.
	setopt HIST_IGNORE_SPACE
	#setopt HIST_NO_STORE

	# When using a hist thing, make a newline show the change before executing it.
	setopt HIST_VERIFY

	# Save the time and how long a command ran
	setopt EXTENDED_HISTORY

	# Misc
	setopt HIST_SAVE_NO_DUPS
	setopt HIST_EXPIRE_DUPS_FIRST
	setopt HIST_FIND_NO_DUPS

	# Aaaaannnd making that history usable (intelligent up arrow completion)
	bindkey '\eOA' up-line-or-beginning-search
	bindkey '\e[A' up-line-or-beginning-search
	bindkey '\eOB' down-line-or-beginning-search
	bindkey '\e[B' down-line-or-beginning-search

# Git-specific stuff

    # Get how many commits ahead we are
    git_commits_ahead(){
        git status | head -n 2 | tail -n 1 | grep 'ahead' | sed 's/[^0-9]*//g'
    }

    # Get how many commits behind we are
    git_commits_behind(){
        git status | head -n 2 | tail -n 1 | grep 'behind' | sed 's/[^0-9]*//g'
    }

    # Show Git branch/tag, or name-rev if on detached head
    git_branch() {
        ((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null) | sed 's/refs\/heads\///g'
    }

    # How many line additions?
    git_additions() {
        git diff --stat | tail -n 1 | cut -d',' -f2 | sed 's/[^0-9]*//g'
    }

    # How many deletions?
    git_deletions() {
        git diff --stat | tail -n 1 | cut -d',' -f3 | sed 's/[^0-9]*//g'
    }

    # Git state
    git_state(){
        local GIT_STATE
        local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            GIT_STATE=$GIT_STATE"merging"
        fi

        if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
            if [[ ! -z "$GIT_STATE" ]]; then
                GIT_STATE=$GIT_STATE":"
            fi
            GIT_STATE=$GIT_STATE"untracked"
        fi

        if ! git diff --quiet 2> /dev/null; then
            if [[ ! -z "$GIT_STATE" ]]; then
                GIT_STATE=$GIT_STATE":"
            fi
            GIT_STATE=$GIT_STATE"modified"
        fi

        if ! git diff --cached --quiet 2> /dev/null; then
            if [[ ! -z "$GIT_STATE" ]]; then
                GIT_STATE=$GIT_STATE":"
            fi
            GIT_STATE=$GIT_STATE"staged"
        fi

        echo -n "$GIT_STATE"
    }

    # Returns the git prompt if we're in a git repo. Otherwise, don't return anything
    git_prompt(){
        git rev-parse --git-dir > /dev/null 2>&1
        if [[ $? == 0 ]]
        then
            # This is a git dir
            echo -n " "


            # Branch + ahead/behind
            echo -n "%{$fg[white]%}("
            local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
            if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
                echo -n "%{$fg[magenta]%}<merging> "
            fi

            echo -n "%{$fg[white]%}"
            echo -n "$(git_branch)"
            local gca=$(git_commits_ahead)
            local gcb=$(git_commits_behind)
            if [[ ! -z "$gca" ]]
                then
                    echo -n "%{$fg[green]%} +"
                    echo -n "$gca"
            elif [[ ! -z "$gcb" ]]
                then
                    echo -n "%{$fg[red]%} -"
                    echo -n "$gcb"
            fi
            echo -n "%{$fg[white]%})"

            # Additions/Deletions
            echo -n "%{$fg[white]%}(%{$fg_bold[green]%}+"
            local ga=$(git_additions)
            if [[ ! -z "$ga" ]]
                then
                    echo -n "$ga"
                else
                    echo -n "0"
            fi
            echo -n "%{$fg[white]%}/%{$fg[red]%}-"
            local gd=$(git_deletions)
            if [[ ! -z "$gd" ]]
                then
                    echo -n "$gd"
                else
                    echo -n "0"
            fi
            echo -n "%{$fg[white]%})"

        else
            # this is not a git repository
        fi


    }

# Functions
	# Who has time to remember decompressors? Not me!
	extract() {
		if [[ -f "$1" ]]; then
			case "$1" in
				*.tar.lrz)
					b=$(basename "$1" .tar.lrz)
					lrztar -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.lrz)
					b=$(basename "$1" .lrz)
					lrunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tar.bz2)
					b=$(basename "$1" .tar.bz2)
					tar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.bz2)
					b=$(basename "$1" .bz2)
					bunzip2 "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tar.gz)
					b=$(basename "$1" .tar.gz)
					tar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.gz)
					b=$(basename "$1" .gz)
					gunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tar.xz)
					b=$(basename "$1" .tar.xz)
					tar Jxf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.xz)
					b=$(basename "$1" .gz)
					xz -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.rar)
					b=$(basename "$1" .rar)
					unrar e "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tar)
					b=$(basename "$1" .tar)
					tar xf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tbz2)
					b=$(basename "$1" .tbz2)
					tar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.tgz)
					b=$(basename "$1" .tgz)
					tar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.zip)
					b=$(basename "$1" .zip)
					unzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.Z)
					b=$(basename "$1" .Z)
					uncompress "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*.7z)
					b=$(basename "$1" .7z)
					7z x "$1" && [[ -d "$b" ]] && cd "$b" ;;
				*) echo "Unrecognized archive type '$1'..." && return 1;;
			esac
			return 0
		else
			echo "'$1' is not a valid file!"
			return 1
		fi
	}


# PS1 Setup
    if [[ $IS_ROOT = true ]]; then
        PROMPT='%{$fg[white]%}[$HOST] [%{$fg[red]%}${PWD/#$HOME/~}%{$fg[white]%}]$(git_prompt)%{$fg[red]%}  %{$reset_color%}'
    else
        PROMPT='%{$fg[white]%}[$HOST] [${PWD/#$HOME/~}]$(git_prompt)%{$fg[red]%}  %{$reset_color%}'
    fi
    RPROMPT='%{$fg[red]%} %(?,,%?)'

