#!/bin/bash
# Set the iTerm2 profile for tmux tabs based on which devbox we're on.
# Args: optional window_id ($1). If provided, only set profile for panes in
# that window (useful for the after-new-window hook). If omitted, set profile
# for every pane in every session (used on initial client-attached).

case "$(hostname)" in
    *2404*)        profile="devboxydeng2404" ;;
    devboxydeng*)  profile="devboxydeng" ;;
    *)             exit 0 ;;
esac

if [ -n "$1" ]; then
    list_args=(-t "$1")
else
    list_args=(-a)
fi

apply_profile() {
    tmux list-panes "${list_args[@]}" -F '#{pane_tty}' 2>/dev/null | while read -r tty; do
        [ -z "$tty" ] && continue
        printf '\033Ptmux;\033\033]50;SetProfile=%s\007\033\\' "$profile" > "$tty"
    done
}

# Apply twice with short delays so iTerm2 has time to register the (new) tab
# in -CC mode before the OSC 50 escape arrives.
( sleep 0.2; apply_profile ) &
( sleep 1;   apply_profile ) &
wait
