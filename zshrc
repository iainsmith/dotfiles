export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

setopt auto_cd
setopt cdable_vars

unsetopt BEEP

export EDITOR="nvim"

export GOPATH="$HOME/Developer/personal/go"
PATH="$GOPATH/bin:$PATH"
PATH="$PATH:/Users/iain/.local/bin"

cdpath=($HOME $HOME/Developer/personal $HOME/Developer/work $HOME/Developer)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export GEM_HOME="$HOME/.gems"

zplug "plugins/git",    from:oh-my-zsh
zplug "plugins/rust",   from:oh-my-zsh
zplug "plugins/macos",  from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "keith/zsh-xcode-completions", use:"src"

zplug '~/.scripts/bundler', from:local
zplug '~/.scripts/swift',   from:local
zplug '~/.scripts/ripgrep', from:local
zplug '~/.scripts/history', from:local

zplug "Aloxaf/fzf-tab", from:github
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

# Bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat="bat"

eval "$(rbenv init - zsh)"

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias gls="git ls-files"
alias gcm="git commit --message"
alias gap="git add --patch"
alias gs="git stash"
alias gss="git stash show"
alias gsl="git stash list"
alias gsa="git stash apply"
alias gsk="git stash --keep"
alias grsp="git restore --patch"
alias grstp="git restore --staged --patch"
alias gcn="git commit --verbose --no-edit --amend"
alias gcan="git commit --verbose --all --no-edit --amend"
alias gcnd='GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"'

alias tm="tmux"
alias tmn="tmux new-session -t"
alias tma="tmux attach -t"
alias tmls="tmux list-session"
alias tmx="tmux kill-session -t"
alias tmc="tmux kill-session -t"

alias ld="lazydocker"
alias lg="lazygit"
alias aliases="nvim ~/.dotfiles/zshrc"

source ~/.scripts/utils/utils.zsh
source ~/.scripts/utils/tat
PATH=$PATH:~/.scripts/utils/

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

alias reload="source $HOME/.zshrc"
alias gdmain="git diff origin/main --staged"
alias gdmaster="git diff origin/master --staged"

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

