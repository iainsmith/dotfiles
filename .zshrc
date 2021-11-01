export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

zplug "plugins/git",    from:oh-my-zsh
zplug "plugins/cargo",  from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug 'dracula/zsh', as:theme

if ! zplug check --verbose; then
    zplug install
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zplug load
