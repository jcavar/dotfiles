# rbenv works by setting up shims. Those ammend PATH variable and hook into any interesting call (e.g gem install) and redirect to required ruby version.
eval "$(rbenv init -)"

export LC_ALL=en_US.UTF-8

# Turn on advanced autocompletion (e.g pkill autocompletion) and higlight menu selection
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' menu select
setopt menu_complete
# Allow command to be opened in EDITOR
autoload -U edit-command-line
zle -N edit-command-line

# Functions

# Simple TODO function that adds an entry to a todo.md file
todo() {
    for note in "$@"
    do
        echo "- $note" >> ~/iCloud/notes/todo.md
    done
}

# Bind up and down keys to search history back and forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -M vicmd v edit-command-line
bindkey -v "^?" backward-delete-char
bindkey -v

# History

# Share history between terminal windows
setopt share_history
# Record timestamps and duration
setopt extended_history
# Append to history as soon as possible
setopt inc_append_history
# Make history file accept more entries and load more entries in memory
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history
# Turn off annoying BEEPs 
unsetopt BEEP

# Use colorful ls
export CLICOLOR=1

# Prompt
export PROMPT='%(?.%F{green}❯.%F{red}❯)%f '
export RPROMPT='%B%F{240}%1~%f%b'

# Fish shell style autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# As per documentation, this needs to be last line in this file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
