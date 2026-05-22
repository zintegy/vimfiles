#!/bin/bash
# Color iTerm2 tabs based on the tmux window name. Triggered by tmux's
# client-attached hook so that iTerm2 has fully registered each tab before
# we send the color-set escapes.

LOG=/tmp/color-tabs.log
echo "$(date +%H:%M:%S) color-tabs invoked" >> "$LOG"

color_window() {
    local target="$1" r="$2" g="$3" b="$4"
    # Write the color escape to every pane's tty in the window. If one pane
    # is a TUI (e.g. a full-screen app) that swallows the escape, another
    # pane in the same tab will still set the color.
    tmux list-panes -t "$target" -F '#{pane_tty}' 2>/dev/null | while read -r tty; do
        echo "  $target -> $tty (color $r,$g,$b)" >> "$LOG"
        [ -z "$tty" ] && continue
        {
            printf '\033Ptmux;\033\033]6;1;bg;red;brightness;%d\007\033\\' "$r"
            printf '\033Ptmux;\033\033]6;1;bg;green;brightness;%d\007\033\\' "$g"
            printf '\033Ptmux;\033\033]6;1;bg;blue;brightness;%d\007\033\\' "$b"
        } > "$tty"
    done
}

apply_colors() {
    # If $1 is given, only color that single window; otherwise iterate all.
    if [ -n "$TARGET_WINDOW" ]; then
        local name=$(tmux display-message -p -t "$TARGET_WINDOW" '#{window_name}' 2>/dev/null)
        echo "  scoped to window $TARGET_WINDOW name=$name" >> "$LOG"
        case "$name" in
            dev)    color_window "$TARGET_WINDOW" 111 161 241 ;;
            mis)    color_window "$TARGET_WINDOW" 234 116 104 ;;
            claude) color_window "$TARGET_WINDOW" 235 175 90  ;;
        esac
    else
        tmux list-windows -F '#{window_id} #{window_name}' 2>/dev/null | while read -r id name; do
            echo "  window $id name=$name" >> "$LOG"
            case "$name" in
                dev)    color_window "$id" 111 161 241 ;;
                mis)    color_window "$id" 234 116 104 ;;
                claude) color_window "$id" 235 175 90  ;;
            esac
        done
    fi
}

# Optional first arg: scope to a single window_id (used by after-new-window).
TARGET_WINDOW="$1"

# Apply twice -- once after a short delay (catches typical case) and again
# after a longer delay (catches slow-starting TUIs like `mia` that override
# the color during their own terminal initialization).
( sleep 2; echo "$(date +%H:%M:%S) first pass" >> "$LOG"; apply_colors ) &
( sleep 6; echo "$(date +%H:%M:%S) second pass" >> "$LOG"; apply_colors ) &
wait
