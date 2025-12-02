source /usr/share/cachyos-fish-config/cachyos-config.fish


### INIT

# Source Done config, set options
source /usr/share/cachyos-fish-config/conf.d/done.fish
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Init Zoxide
zoxide init fish --cmd cd | source

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### ENVIRONMENT

# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end
set -gx LEDGER_FILE /home/penguini3/Finance/2025.journal

### FUNCTIONS 

# Greeter
function fish_greeting
  hyfetch
end

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Install program
function add --wraps='sudo pacman -S' --description 'install program'
    sudo pacman -S $argv
end

# Remove program
function remove --wraps='sudo pacman -Rsn' --description 'remove program'
    sudo pacman -Rsn $argv
end

### ABBREVIATIONS

# Tools
abbr -a nv nvim
abbr -a hl hledger

# Git
abbr -a ga git add 
abbr -a gcm git commit -m
abbr -a gp git push

# ls -> eza
alias ls='eza -al --color=always --group-directories-first --icons'  # preferred listing
alias lsa='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'   # long format
alias lt='eza -aT --color=always --group-directories-first --icons'  # tree listing
alias l.="eza -a | grep -e '^\.'"                                    # show only dotfiles

# Previous directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Misc
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias hw='hwinfo --short'                                                     # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"                                # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'                            # List amount of -git packages
alias update='topgrade'                                                       # Update entire system
alias mirror="sudo cachyos-rate-mirrors"                                      # Get fastest mirrors
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'                               # Cleanup orphaned packages
alias jctl="journalctl -p 3 -xb"                                              # Get the error messages from journalctl
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recent installed packages
