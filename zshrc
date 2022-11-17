export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

setopt auto_cd
setopt cdable_vars

unsetopt BEEP

export EDITOR="nvim"

export BAT_THEME=OneHalfDark
export GOPATH="$HOME/Developer/personal/go"
PATH="$GOPATH/bin:$PATH"
PATH="$PATH:/$HOME/.local/bin"
PATH="$PATH:$HOME/.bin"
PATH="$PATH:$HOME/.bin/git-pile/bin"
PATH="$PATH:$HOME/.mint/bin"
cdpath=($HOME $HOME/Developer/personal $HOME/Developer/work $HOME/Developer)

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS="--tiebreak=chunk"

alias vim=nvim

export GEM_HOME="$HOME/.gems"

zplug 'zsh-users/zsh-completions'
zplug 'wfxr/forgit'
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

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

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
export BAT_THEME="Monokai Extended"
alias cat="bat"

eval "$(rbenv init - zsh)"

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias gls="git ls-files"
alias gcm="git commit --message"
alias gap="git add --patch"
alias gaa="git forgit add"
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
alias lsp="fd -I . --maxdepth 1 | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

source ~/.scripts/utils/utils.zsh
source ~/.scripts/utils/git-fzf.sh
source ~/.scripts/utils/tat
PATH=$PATH:~/.scripts/utils/
PATH="$PATH:$FORGIT_INSTALL_DIR/bin"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

export GIT_PILE_PREFIX="iain/"
export GIT_PILE_USE_PR_TEMPLATE=1
export GIT_PILE_VERBOSE=1

alias reload="source $HOME/.zshrc"
alias gdmain="git diff origin/main --staged"
alias gdmaster="git diff origin/master --staged"

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --bind 'j:down,k:up'"
export FORGIT_FZF_DEFAULT_OPTS='--height 80%'


export FORGIT_LOG_FZF_OPTS='
--bind "j:down,k:up,q:abort"
--bind "ctrl-b:preview-page-up,ctrl-d:preview-page-down"
--height 100%
'

function gitToggle() {
  git diff --name-only --staged | grep -w "$1" && git reset "$1" || git add "$1"
}


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always $realpath || tree -d 1 $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '/Users/iain/.zshrc'

FPATH=$FPATH:/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

enable-fzf-tab

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
