export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

setopt auto_cd
setopt cdable_vars

export EDITOR="nvim"

export GOPATH="$HOME/Developer/personal/go"
PATH="$GOPATH/bin:$PATH"

cdpath=($HOME $HOME/Developer/personal $HOME/Developer/work $HOME/Developer)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export GEM_HOME="$HOME/.gems"

zplug "plugins/git",    from:oh-my-zsh
zplug "plugins/cargo",  from:oh-my-zsh
zplug "plugins/macos",  from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "keith/zsh-xcode-completions", use:"src"

zplug '~/.scripts/bundler', from:local
zplug '~/.scripts/swift',   from:local
zplug '~/.scripts/ripgrep', from:local
zplug '~/.scripts/history', from:local

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zstyle :prompt:pure:path color white
zstyle :prompt:pure:git:stash show yes

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

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

alias gls="git ls-files"

# Bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat="bat"

eval "$(rbenv init - zsh)"

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
