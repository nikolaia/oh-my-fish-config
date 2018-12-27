# Path to Z loaded before the pkg-z plugin is loaded
set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
set -g theme_complete_path yes

function fish_greeting
    fortune -a
end