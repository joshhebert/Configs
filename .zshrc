# Autoloads
	autoload -U compinit && compinit
	autoload -Uz up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	autoload -Uz down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	autoload -U colors && colors

# The most imprtant bit
	export EDITOR=/usr/bin/vim

# PS1 Setup
	# Left prompt (WIP)
	PROMPT='%{$fg_bold[green]%}[${PWD/#$HOME/~}]%{$reset_color%} >> ' 

# Plugin loading (May need to be commented out, depending on system)
	
	# This should be moved to ~/.zsh_config
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	# Maybe package this up into ~/.zsh_config, if at all possible
	[ -s "/home/josh/.scm_breeze/scm_breeze.sh" ] && source "/home/josh/.scm_breeze/scm_breeze.sh"

# Aliases
	alias 'pacman'='packer-color'
	alias '..'='cd ..'
	alias '...'='cd ../..'
	alias '....'='cd ../../..'
	alias 'gping'='ping google.com'
	alias 'l'='/usr/bin/ls --color=auto'
	alias 'ls'='/usr/bin/ls --color=auto'
	alias 'll'='/usr/bin/ls -Al --color=auto'

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
	setopt HIST_NO_STORE

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
	# Modify the colors and symbols in these variables as desired.
	GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
	GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
	GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
	GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
	GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
	GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
	GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
	GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
	GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

	# Show Git branch/tag, or name-rev if on detached head
	git_branch() {
        ((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null) | cut -d'/' -f3
	}

    git_additions() {
        git diff --stat | tail -n 1 | cut -d',' -f2 | sed 's/[^0-9]*//g'
    }

    git_deletions() {
        git diff --stat | tail -n 1 | cut -d',' -f3 | sed 's/[^0-9]*//g'
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
