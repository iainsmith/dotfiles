if [[ `uname` == "Darwin" && `uname -m` == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"
[ ! -f "$HOME/.env.local" ] || . "$HOME/.env.local"

export N_PREFIX="$HOME/.n"
PATH="$HOME/.n/bin":$PATH

export PATH="$PATH:/Users/iain/.local/bin"

# Added by swiftly
. "/Users/iain/Library/Application Support/swiftly/env.sh"