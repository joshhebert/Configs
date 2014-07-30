source liquidprompt
autoload -U compinit && compinit

alias 'pacman'='packer-color'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'gping'='ping google.com'
alias 'l'='/usr/bin/ls --color=auto'
alias 'ls'='/usr/bin/ls --color=auto'
alias 'll'='/usr/bin/ls -Al --color=auto'

export EDITOR=/usr/bin/vim
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -s "/home/josh/.scm_breeze/scm_breeze.sh" ] && source "/home/josh/.scm_breeze/scm_breeze.sh"
