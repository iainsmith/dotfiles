if [[ `uname` == "Darwin" && `uname -m` == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"
[ ! -f "$HOME/.env.local" ] || . "$HOME/.env.local"

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export N_PREFIX="$HOME/.n"
PATH="$HOME/.n/bin":$PATH

export PATH="$PATH:/Users/iain/.local/bin"
