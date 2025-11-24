source /usr/share/cachyos-fish-config/cachyos-config.fish
zoxide init fish --cmd cd | source
set -gx LEDGER_FILE /home/penguini3/Finance/2025.journal
# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
  hyfetch
end


# ABBREVIATIONS

abbr -a nv nvim
abbr -a hl hledger

# GIT
abbr -a ga git add 
abbr -a gcm git commit -m
abbr -a gp git push
