if [[ `uname` == "Darwin" && `uname -m` == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
