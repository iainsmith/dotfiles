export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

setopt auto_cd
setopt cdable_vars

cdpath=($HOME $HOME/Developer/personal $HOME/Developer/work)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zplug "plugins/git",    from:oh-my-zsh
zplug "plugins/cargo",  from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

zplug '~/.scripts/bundler', from:local
zplug '~/.scripts/swift',   from:local
zplug '~/.scripts/history', from:local

zplug 'dracula/zsh', as:theme

if ! zplug check --verbose; then
    zplug install
fi

bindkey -v # Enable vim mode

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# LSD
alias l="ls -a"
alias ls="lsd"
alias lt="lsd --tree"

# Bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat="bat"

zplug load
