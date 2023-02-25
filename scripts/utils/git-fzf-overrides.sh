source "$(dirname "${BASH_SOURCE[0]}")/git-fzf.sh"

_fzf_git_fzf() {
   fzf-tmux -p100% -- \
    --layout=reverse --multi --height=50% --min-height=20 --border \
    --color='header:italic:underline' \
    --preview-window='right,50%,border-left' \
    --bind "j:down,k:up,q:abort" \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}
