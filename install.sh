function installRosetta {
    if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Install rosetta"
        softwareupdate --install-rosetta --agree-to-license
    fi
}

function installM1 {
    if [[ `uname` == "Darwin" && `uname -m` == "arm64" ]]; then
        installRosetta
    fi
}

function installHomebrew {
    if [[ -z $HOMEBREW_PREFIX ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew bundle
}

installHomebrew
installM1