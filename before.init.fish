# Path to Z loaded before the pkg-z plugin is loaded
set -g Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
set -g theme_complete_path yes

export VISUAL=nvim
export EDITOR="$VISUAL"

function fish_user_key_bindings
    bind -M default \$ end-of-line accept-autosuggestion
end

function fish_greeting
    fortune -a
end

fish_vi_key_bindings
set -g fish_escape_delay_ms 10