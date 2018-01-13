PKGS="${HOME}/.dotfiles_local/packages"

add() {
    local LOC="${PKGS}/${1}"
    PATH=$LOC:$PATH
}

add git-remote-hg
