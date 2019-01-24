PKGS='~/.dotfiles_local/packages'

add() {
    path_prepend "${PKGS}/${1}"
}

add 'git-remote-hg'
