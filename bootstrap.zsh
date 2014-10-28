PKGS="${HOME}/.dotfiles_local/packages"

function add() {
    local LOC="${PKGS}/${1}"
    export PATH=$LOC:$PATH
}

add git-remote-hg
