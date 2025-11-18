function remove --wraps='sudo pacman -Rsn' --description 'alias remove=sudo pacman -Rsn'
    sudo pacman -Rsn $argv
end
