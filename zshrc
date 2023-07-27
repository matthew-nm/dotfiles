# ===== USER ===== #

export PATH="$HOME"/bin:"$PATH"
export PATH="$HOME"/.local/bin:$PATH

export EDITOR='vi'

# General
alias o="xdg-open"
alias lla='ls -lA'
alias clip='xsel -ib'
alias color256='for code ({000..255}) print -P -- "$code: %F{$code}\u2588\u2588\u2588\u2588 These are colors!%f"'
alias tmp='cd ~/tmp'

# Neovim
# alias vi='XDG_CONFIG_HOME=~/dotfiles/ nvim'
# alias vim='XDG_CONFIG_HOME=~/dotfiles/ nvim'
alias nvim='XDG_CONFIG_HOME=~/dotfiles/ nvim'

# Tmuxp
alias tp='tmuxp load tmuxp'

# Git
alias git='git '
alias logg='log --graph --decorate --all'

# Python / Django
alias dgo='python manage.py'

# Android Studio
alias avdl='~/Library/Android/sdk/tools/emulator -list-avds'
alias avdr='~/Library/Android/sdk/tools/emulator -avd'
alias avd1='~/Library/Android/sdk/tools/emulator -avd $(~/Library/Android/sdk/tools/emulator -list-avds | head -n 1)'


# ===== THEME ===== #

zstyle :prompt:pure:path color 044
zstyle :prompt:pure:git:branch color 249
zstyle :prompt:pure:git:arrow color 119
zstyle :prompt:pure:execution_time color 220


# ===== FUNCTIONS ===== #

# search for process
function proc() {
  ps aux | grep $1 --color=always | grep -v "grep.\+$1"
}

# make dir and enter
function md() {
  mkdir -p "$@" && cd "$1";
}

# fix path issues
function fix_path_issues() {
  PATH_UNIQ=$(echo -n $PATH | tr ":" "\n" | awk '!x[$0]++')
  PATH_SORT="$(grep conda <<<$PATH_UNIQ)\n$(grep -v conda <<<$PATH_UNIQ)"
  PATH=$(echo $PATH_SORT|tr "\n" ":")
}

# Execute before showing prompt
precmd() {
  # Fix pure prompt conda display
  if [ "$CONDA_DEFAULT_ENV" = "base" ]; then
    unset CONDA_DEFAULT_ENV
  else
    CONDA_DEFAULT_ENV="$(basename "$CONDA_DEFAULT_ENV")"
  fi
}


# ===== PRE-LOAD CONFIG ===== #

# ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
export DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder


# ===== PLUGINS ===== #

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  tmux
  zsh-syntax-highlighting  # keep at end of list to ensure proper coloring
)


# ===== LOAD ===== #

# Move into symdirs
for key val in ${(kv)SYMDIRS}; do
  key=$(echo "$key"|tr -d \")
  if [[ $PWD == $key* ]]; then
    cd $val${PWD:${#key}}
    break
  fi
done
# ================================================== #
# Example assoc array for private zshrc              #
# typeset -A SYMDIRS                                 #
# SYMDIRS[/mnt/Data/Dropbox]='/home/matthew/Dropbox' #
# ================================================== #

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# pure prompt
fpath+=$HOME/Utilities/pure
autoload -U promptinit && promptinit
prompt pure


# ===== POST-LOAD CONFIG ===== #

unsetopt sharehistory

# smart case completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# DVC
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes


# ===== FINAL COMMANDS ===== #

# fix path issues
fix_path_issues
