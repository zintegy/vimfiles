#!/bin/bash
# Set the iTerm2 profile for every tmux tab in this session, based on which
# devbox we're on. Triggered by the client-attached hook so this only affects
# the tmux-spawned tabs in iTerm2 — the local control tab in iTerm2 -CC mode
# is untouched.

case "$(hostname)" in
    *2404*)        profile="devboxydeng2404" ;;
    devboxydeng*)  profile="devboxydeng" ;;
    *)             exit 0 ;;
esac

tmux list-panes -a -F '#{pane_tty}' 2>/dev/null | while read -r tty; do
    [ -z "$tty" ] && continue
    printf '\033Ptmux;\033\033]50;SetProfile=%s\007\033\\' "$profile" > "$tty"
done
