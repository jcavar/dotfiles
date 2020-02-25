# rbenv works by setting up shims. Those ammend PATH variable and hook into any interesting call (e.g gem install) and redirect to required ruby version.
eval "$(rbenv init -)"

# Turn on advanced autocompletion (e.g pkill autocompletion) and higlight menu selection
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' menu select

# Aliases

alias gst="git status"
alias ga="git add"
alias gap="git add --patch"
alias gdc="git diff --cached"
alias gd="git diff"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull --rebase"
alias gco="git checkout"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Bind up and down keys to search history back and forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Share history between terminal windows
setopt share_history
# Make history file accept more entries and load more entries in memory
export HISTSIZE=100000
export HISTFILESIZE=100000
# Turn off annoying BEEPs 
unsetopt BEEP

# Use colorful ls
export CLICOLOR=1


# As per documentation, this needs to be last line in this file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
