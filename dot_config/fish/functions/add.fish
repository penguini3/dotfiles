function add --wraps='sudo pacman -S' --description 'alias add=sudo pacman -S'
    sudo pacman -S $argv
end
