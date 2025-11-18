source /usr/share/cachyos-fish-config/cachyos-config.fish
zoxide init fish --cmd cd | source
# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
  hyfetch
end
