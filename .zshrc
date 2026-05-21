DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#d787ff,bold'
alias vimzsh="vim ~/.zshrc"
setopt histappend
setopt autocd
setopt NO_BEEP
#
# Create Prompt
BOX_COLOR="\[\e[0;32m\]"
# WHITE="\[\e[1;37m\]"
RED="\[\e[1;31m\]"
GRAY="\[\e[38;05;239m\]"
LIGHT_GRAY="\[\e[38;05;235m\]"
MEDIUM_GRAY="\[\e[38;05;244m\]"
GREEN="\[\e[38;05;34m\]"
YELLOW="\[\e[38;05;172m\]"
NOTING="\[\e[0m\]"
BOX=$(echo -e "\xE2\x97\xBC")
SLASH="/"

if (($SHLVL > 1))
then
  BOX_COLOR=$MEDIUM_GRAY
fi

function git_branch {
  command git branch --no-color 2> /dev/null | \
    sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_clean {
  command git diff --quiet HEAD 2> /dev/null
}
function git_status {
  GIT_BRANCH=$(git_branch)
  COLOR=$RED

  if [[ $GIT_BRANCH ]]
  then
    git_clean && COLOR=$GREEN
    GIT_BRANCH=" $COLOR$GIT_BRANCH"
  fi

  echo -e "$GIT_BRANCH"
}

function virtualenv_status {
  if [[ $VIRTUAL_ENV ]]
  then
    echo -e " $YELLOW$(basename $VIRTUAL_ENV)"
  fi
}

function _prompt_command {
  # Save history after each command
  history -a

  # Set window title for time-tracking purposes
  # https://timingapp.com/help/terminal
  echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"

  PS1="\[$(iterm2_prompt_mark)\]"
  PS1="$PS1 $BOX_COLOR$BOX$GRAY \h$LIGHT_GRAY$SLASH$GRAY\u$(virtualenv_status)"
  PS1="$PS1 $MEDIUM_GRAY\w$(git_status)$NOTHING "
}

PROMPT_COMMAND=_prompt_command
setopt menu_complete
bindkey -M menuselect '^M' .accept-line

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

source ~/.bashrc
source /home/ydeng/ans/etc/zshrc
# Drop the `mis`/`mia` aliases from ans/etc/shrc so our colored + auto-Duo
# wrappers (defined in ~/.bashrc) take effect.
unalias mis 2>/dev/null
unalias mia 2>/dev/null
alias review="gh pr review"
alias sourcezsh="source ~/.zshrc"
alias gl="git gl"
alias claude-summary="python3 ~/.claude/scripts/daily_summary.py"
alias poe2="cd ~/poe2 && nvm use"

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

request() {
  local args=("$@")
  local msg="${args[@]:1}"
  gh pr review "$1" -r -b "${msg:-comments}"
}


# bun completions
[ -s "/home/ydeng/.bun/_bun" ] && source "/home/ydeng/.bun/_bun"

# Auto-run `nvm use` when entering any directory tree containing a .nvmrc.
# Tracks the last-used .nvmrc dir so we only switch when crossing into a new
# project, not on every `cd` within it.
autoload -U add-zsh-hook
_last_nvmrc_dir=""
_auto_nvm_use() {
    local dir="$PWD"
    while [[ "$dir" != "/" && "$dir" != "$HOME" ]]; do
        if [[ -f "$dir/.nvmrc" ]]; then
            if [[ "$dir" != "$_last_nvmrc_dir" ]]; then
                _last_nvmrc_dir="$dir"
                nvm use >/dev/null 2>&1
            fi
            return
        fi
        dir="${dir:h}"  # zsh syntax for dirname
    done
}
add-zsh-hook chpwd _auto_nvm_use
# Trigger once at shell startup so opening a tab directly into poe2 works.
_auto_nvm_use
