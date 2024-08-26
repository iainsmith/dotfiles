function bootstrapXcodes {
	if ! command -v xcodebuild &>/dev/null; then
		mkdir /tmp/xcodes
		curl -fsSL https://github.com/RobotsAndPencils/xcodes/releases/latest/download/xcodes.zip -o /tmp/xcodes/xcodes.zip
		unzip -d /tmp/xcodes /tmp/xcodes/xcodes.zip
		/tmp/xcodes/xcodes install --latest
		rm -rf /tmp/xcodes
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
	swift package completion-tool generate-zsh-script >"$SWIFT_COMPLETION/_swift"
}

# https://github.com/quatauta/dotfiles/blob/main/setup
_macos_launchctl_load() {
	if command -v launchctl >/dev/null; then
		for PLIST in "${HOME}"/Library/LaunchAgents/*.plist; do
			echo launchctl lwad -w "${PLIST}"
			launchctl load -w "${PLIST}"
		done
	fi
}

function printManualInstructions {
	echo "Next steps:
- Setup an SSH key:

  ssh-keygen -t ed25519 -C "email.com"

- Import gpg keys:

  gpg --import ~/path-to-key
  gpg edit-key {key-id} trust
"
}

bootstrapXcodes
installHomebrew
writeSwiftCompletion
_macos_launchctl_load
printManualInstructions
