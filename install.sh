function installRosetta {
    if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Install rosetta"
        softwareupdate --install-rosetta --agree-to-license
    fi
}

function bootstrapXcodes {
    if ! command -v xcodebuild &> /dev/null
    then
        mkdir /tmp/xcodes
        curl -fsSL https://github.com/RobotsAndPencils/xcodes/releases/latest/download/xcodes.zip -o /tmp/xcodes/xcodes.zip
        unzip -d /tmp/xcodes /tmp/xcodes/xcodes.zip
        /tmp/xcodes/xcodes install --latest
        rm -rf /tmp/xcodes
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

function writeSwiftCompletion {
    local SWIFT_COMPLETION="$HOME/.scripts/swift"
    rm -rf "$SWIFT_COMPLETION"
    mkdir -p "$SWIFT_COMPLETION"
    swift package completion-tool generate-zsh-script > "$SWIFT_COMPLETION/_swift"
}

bootstrapXcodes
installHomebrew
installM1
writeSwiftCompletion
