# echo "hello!"
export EDITOR=~/nvim-linux-x86_64.appimage
for f in `find /shared_envs/ -name ".*.sh"`; do if [ -f $f ]; then source $f; fi; done
export ANS_ROOT="${ANS_ROOT:-/home/ydeng/ans}"
alias vim=nvim
alias nvim=~/nvim-linux-x86_64.appimage

#source /home/ydeng/ans/etc/bashrc
export ANS_DEFAULT_INSTANCE=dwc
source $HOME/git-prompt.sh
export PATH=/home/ydeng/bin:$PATH
export PATH=/home/ydeng/ans/venv:$PATH
export PATH=/home/ydeng/.local/bin:$PATH

export PATH="$HOME/go/bin:$PATH"

# unset PYTHONHOME
# unset pythonhome
# unset PYTHONPATH
# unset pythonpath
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# Avoid duplicates
HISTCONTROL=ignoreboth:ignoredups:erasedups


# After each command, append to the history file and reread it
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


## make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac
#
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
#force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]dev\[\033[00m\]:\[\033[01;34m\]\w$(__git_ps1 " (%s)")\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}dev:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi



# .bashrc

# User specific aliases and functions
#source $HOME/git-completion.sh

#convenient aliases
#alias gpu="git pull --rebase"
#__git_complete ypu _git_pull
alias gpu="git pull"
alias gst="git status"
alias gs="git show"
alias ch="git checkout"
alias gd="git diff"
alias gdname="git diff --name-only"
# lets make a shortcut to checkout/create the bugfix branch
alias gbr="git branch"
alias cb="yo create_branch"
alias gca="git commit -a"
alias pp="yo prepush"

pptop() {
    pp `git log -n2 --oneline | head -c12`
}

alias clear_branches="git branch | grep 'ydeng/' | xargs git branch -D"
push() {
    printf '\033]2;push\033\\';
    yo push "$@" && clear_branches && gpu;
    printf '\033]2;\033\\';
}
alias yrevert="yo revert_and_push"
alias yr="yo restore"
alias yt="yo test"
alias ytr="yo test --remote"
alias lint="yo lint"


alias sc="screen -xR"

alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.lua"
alias vimbash="vim ~/.bashrc"
alias vbash="vim ~/.bashrc"

alias sourcebash="source ~/.bashrc"


# source $HOME/.git-prompt.sh

# PS1='\[\033[01;32m\]\h\[\033[00m\]:\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

# echo 'part a'
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# echo 'part b'

alias v='vim $(fzf --preview="cat {}")'

alias nv='nvim'
alias v='nvim -c "lua Snacks.picker.files {}"'

alias t='tmux -CC a'
alias tnew='tmux new -s dev'

# ----------------------------------------------------------------------------
# tmux + iTerm2 tab coloring
# ----------------------------------------------------------------------------
# These helpers send iTerm2-specific escape sequences (OSC 6) to color the
# tab background. The escapes are wrapped in tmux's DCS passthrough so they
# survive being relayed through tmux to iTerm2.

# Set the iTerm2 tab background color. Args: R G B (each 0-255).
tmux_tab_color() {
    [ -z "$TMUX" ] && return
    printf '\033Ptmux;\033\033]6;1;bg;red;brightness;%d\007\033\\' "$1"
    printf '\033Ptmux;\033\033]6;1;bg;green;brightness;%d\007\033\\' "$2"
    printf '\033Ptmux;\033\033]6;1;bg;blue;brightness;%d\007\033\\' "$3"
}

# Clear the tab color back to iTerm2's default.
tmux_tab_color_reset() {
    [ -z "$TMUX" ] && return
    printf '\033Ptmux;\033\033]6;1;bg;*;default\007\033\\'
}

# ----------------------------------------------------------------------------
# "Notification" coloring (stays set until the user views the window)
# ----------------------------------------------------------------------------
# Used for long-running commands like tests. Color is set when the command
# starts; if the user is on a different tab when it finishes, the color
# persists as a notification. The color is cleared by an after-select-window
# tmux hook the next time the user selects that window.

# Color used while a long-running command is in progress (yellow-green).
TMUX_NOTIFY_INPROGRESS=(188 214 96)
# Color used when a long-running command has finished (green) — acts as a
# "you have a notification" indicator until the user views the tab.
TMUX_NOTIFY_FINISHED=(54 215 54)

# Mark this window as in-progress: set the orange tab color.
tmux_notify_start() {
    [ -z "$TMUX" ] && return
    tmux_tab_color "${TMUX_NOTIFY_INPROGRESS[@]}"
}

# Called when the command finishes. If the user is currently looking at this
# window, clear the color immediately (no notification needed). Otherwise
# switch to the "finished" green and mark the window as having a pending
# notification — the tmux after-select-window hook clears it when the user
# eventually views the tab.
tmux_notify_done() {
    [ -z "$TMUX" ] && return
    local attached active
    # -t "${TMUX_PANE}" targets THIS pane (where the wrapper is running),
    # not whichever pane the user is currently focused on.
    attached=$(tmux display-message -p -t "${TMUX_PANE}" '#{session_attached}' 2>/dev/null)
    active=$(tmux display-message -p -t "${TMUX_PANE}" '#{window_active}' 2>/dev/null)
    if [ "$attached" = "1" ] && [ "$active" = "1" ]; then
        tmux_tab_color_reset
    else
        tmux_tab_color "${TMUX_NOTIFY_FINISHED[@]}"
        # Use -t "${TMUX_PANE}" so the option lands on THIS window, not on
        # whatever window the user is currently focused on.
        tmux set-option -w -t "${TMUX_PANE}" @notify-pending 1 2>/dev/null
    fi
}

# ----------------------------------------------------------------------------
# Command wrappers
# ----------------------------------------------------------------------------
# Each wrapper colors the tab while the command runs, then either resets
# (claude, mis) or hands off to the notification system (pytest, yo test,
# sleep). The `trap 'true' INT` keeps the function executing past Ctrl-C
# so the cleanup line still runs.

# Color claude tabs gold while running.
claude() {
    tmux_tab_color 235 175 90
    trap 'true' INT
    command claude "$@"
    local rc=$?
    trap - INT
    tmux_tab_color_reset
    return $rc
}

# Codex tab color — similar family to claude (235 175 90) but a touch
# more orange/red so it's visibly distinct.
codex() {
    tmux_tab_color 220 130 70
    trap 'true' INT
    # First call: trigger lazy nvm load so `command codex` is on PATH.
    # __work removes itself after running, so this is a no-op afterwards.
    declare -f __work >/dev/null && __work
    command codex "$@"
    local rc=$?
    trap - INT
    tmux_tab_color_reset
    return $rc
}

# Watch this tmux pane for a prompt and auto-respond. Runs in background;
# polls capture-pane every second for up to ~10 seconds, sends $2 (default 1)
# + Enter the moment the prompt text $1 appears.
_tmux_auto_respond() {
    [ -z "$TMUX" ] && return
    local pattern="$1"
    local response="${2:-1}"
    local i
    for i in $(seq 1 10); do
        command sleep 1
        if tmux capture-pane -p -t "$TMUX_PANE" 2>/dev/null | grep -qi "$pattern"; then
            tmux send-keys -t "$TMUX_PANE" "$response" Enter
            return
        fi
    done
}

# Color mis tabs red while running. Auto-fills "1" at the Duo passcode prompt.
mis() {
    tmux_tab_color 234 116 104
    trap 'true' INT
    _tmux_auto_respond "Passcode or option" &
    local autopid=$!
    main_instance_shell.py "$@"
    local rc=$?
    kill "$autopid" 2>/dev/null
    wait "$autopid" 2>/dev/null
    trap - INT
    tmux_tab_color_reset
    return $rc
}

# mia (anspaste) — same Duo prompt; shares the dev split's blue color.
mia() {
    trap 'true' INT
    _tmux_auto_respond "Passcode or option" &
    local autopid=$!
    main_instance_anspaste.py "$@"
    local rc=$?
    kill "$autopid" 2>/dev/null
    wait "$autopid" 2>/dev/null
    trap - INT
    return $rc
}

# Color pytest tabs while running; persist as a notification if the user is away.
pytest() {
    tmux_notify_start
    trap 'true' INT
    command pytest "$@"
    local rc=$?
    trap - INT
    tmux_notify_done
    return $rc
}

# Test helper for the notification flow.
# Run `sleep 3`, switch tabs, wait — green should remain until you switch back.
sleep() {
    tmux_notify_start
    trap 'true' INT
    command sleep "$@"
    local rc=$?
    trap - INT
    tmux_notify_done
    return $rc
}

# Wrap `yo` so only `yo test ...` triggers the notification — other yo
# subcommands run unchanged.
yo() {
    if [ "$1" = "test" ]; then
        tmux_notify_start
        trap 'true' INT
        command yo "$@"
        local rc=$?
        trap - INT
        tmux_notify_done
        return $rc
    else
        command yo "$@"
    fi
}

tmux-start-main() {
    if ! tmux has-session -t main 2>/dev/null; then
        tmux new-session -d -s main -n dev -c ~/ans
        tmux send-keys -t main:dev "mia -f --aipoe" C-m
        tmux split-window -h -t main:dev -c ~/ans/poe/web/src
        tmux send-keys -t main:dev.1 "startpoeydeng" C-m

        tmux new-window -t main: -n mis -c ~/ans
        tmux send-keys -t main:mis "mis" C-m

        tmux new-window -t main: -n claude -c ~/ans
        tmux send-keys -t main:claude "claude" C-m
    fi

    tmux -CC attach -t main
}
# unalias sl

alias yp='yo pingme "success" || yo pingme "fail"'
alias lintr='test-remote -t ~/ans/web/lib/a/ans_frontend/test_js.py:test_lint'

alias rgs='regen_graphql_schema'
alias sx='yo format && yo test -sX'

gdh() {
  git diff HEAD~${1}
}




alias fix_mysql='cd ~/ans/hulls && ./create_devserver_hull.py ydeng || (sudo /etc/init.d/mysql start && ./create_devserver_hull.py ydeng)'
# use local vim
#alias vim='~/bin/vim'
#alias vi='~/bin/vim'
fat() {
    printf '\033]2;fat\033\\'
    yo format && yo amend && yo test -X
    local rc=$?
    printf '\033]2;\033\\'
    return $rc
}
alias fa='yo format && yo amend'
alias poe_setup='npm17 ci && npm17 run relay'
alias startpoe='poe_setup && npm17 run dev -- -p 12590'
alias startpoeydeng='poe_setup && DEV_INSTANCE=ydeng.main npm17 run dev -- -p 12590'
alias startpoeydengcanvas='poe_setup && NEXT_PUBLIC_POE_PREVIEW_URL=https://ydeng-port12591.dev.quora.com/preview.html DEV_INSTANCE=ydeng.main npm17 run dev -- -p 12590'

alias startpoeydeng22='poe_setup && DEV_INSTANCE=ydeng.main npm22 run dev -- -p 12590'


vimgrep() {
    nvim $(pygrep -l ${1})
}

_repo_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.git" ]]; then
            echo "$dir"
            return
        fi
        dir="$(dirname "$dir")"
    done
    echo "$HOME/ans"
}

alias startcanvas='cd "~/$(_repo_root)/poe/web/sub_modules/preview && npm ci && npm run devbox-dev -- --port 12591"'
gql() { cd "$(_repo_root)/poe/graphql-server/src/poe_graphql_server/resolver"; }
email() { cd "$(_repo_root)/ans_email/src"; }
poe() { cd "$(_repo_root)/poe/web/src"; }
dag() { cd "$(_repo_root)/airflow/lib/dags"; }
dags() { cd "$(_repo_root)/airflow/lib/dags"; }
pinternal() { cd "$(_repo_root)/poe/web_internal/src"; }
pint() { cd "$(_repo_root)/poe/web_internal/src"; }


alias bns="cd ~/bns"


#export PYTHONHOME='/home/ydeng/ans/venv3.9'
#
#export PYGREP_WEB_LIB=1
alias android='cd ~/ans/android/poe/app/src/main'

alias speedtest='santa-remote -s poe_graphql_regression_detection_test_remote'


# Create wrappers around common nvm consumers.
# nvm, node, yarn and npm will load nvm.sh on their first invocation,
# posing no start up time penalty for the shells that aren't going to use them at all.
# There is only single time penalty for one shell.

typeset -ga __lazyLoadLabels=(nvm node npm npx pnpm yarn pnpx bun bunx)

__load-nvm() {
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    #[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}

__work() {
    for label in "${__lazyLoadLabels[@]}"; do
        unset -f $label
    done
    unset -v __lazyLoadLabels

    __load-nvm
    unset -f __load-nvm __work
}

for label in "${__lazyLoadLabels[@]}"; do
    eval "$label() { __work; $label \$@; }"
done


alias pygreptest='pygrep -g "test*.py"'
cmd="nvm use 22"
#"${cmd}" &>/dev/null & disown;


alias tunnel='sudo ssh -L 21886:localhost:12596 miabox2'
alias ccc='claude -p "Think hard and find issues with the last commit"'

list-unpushed() {
  branches=$(git for-each-ref --format='%(upstream:short):%(refname:short)' refs/heads)
  for raw_branch in $branches; do
    remote_branch=$(cut -d ':' -f 1 <<< "$raw_branch")
    local_branch=$(cut -d ':' -f 2 <<< "$raw_branch")

    echo $local_branch
    if [ "x$remote_branch" == "x" ]; then
      echo WARNING: No remote branch!
    else
      git cherry -v "$remote_branch" "$local_branch"
    fi

    echo
  done
}

memory () {
  ps hax -o rss,user | awk '{a[$2]+=$1;}END{for(i in a)print i" "int(a[i]/1024+0.5);}' | sort -rnk2
}
# echo "all loaded"
#

wt() {
    source use-worktree "$@"
}
