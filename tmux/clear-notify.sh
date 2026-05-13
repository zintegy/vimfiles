#!/bin/bash
# Run by tmux's after-select-window hook.
# If the newly-selected window has @notify-pending=1, clear its iTerm2 tab
# color and unset the marker. Args: $1 = window_id, $2 = pane_tty.

window_id="$1"
tty="$2"

[ -z "$window_id" ] || [ -z "$tty" ] && exit 0

if [ "$(tmux show-options -wv -t "$window_id" @notify-pending 2>/dev/null)" = "1" ]; then
    printf '\033Ptmux;\033\033]6;1;bg;*;default\007\033\\' > "$tty"
    tmux set-option -wu -t "$window_id" @notify-pending 2>/dev/null
fi
