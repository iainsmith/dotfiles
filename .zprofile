if [[ `uname` == "Darwin" && `uname -m` == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export N_PREFIX="$HOME/.n"
PATH=$PATH:"$HOME/.n/bin"