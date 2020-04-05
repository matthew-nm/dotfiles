# ===== USER ===== #

export PATH="$HOME"/bin:"$PATH"
export PATH="$HOME"/.local/bin:$PATH

alias o="xdg-open"
alias lla='ls -lA'
alias clip='xsel -ib'
alias color256='for code ({000..255}) print -P -- "$code: %F{$code}\u2588\u2588\u2588\u2588 These are colors!%f"'

# Neovim
alias vi='nvim'
alias vim='nvim'

# Tmuxp
alias tp='tmuxp load tmuxp'

# Git
alias git='git '
alias logg='log --graph --decorate --all'

# Python / Django
alias dgo='python manage.py'

# Functions
function proc() {
  ps aux | grep $1 --color=always | grep -v "grep.\+$1"
}
function md() {
  mkdir -p "$@" && cd "$1";
}
function vim-plug() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

# pure prompt
zstyle :prompt:pure:path color 044
zstyle :prompt:pure:git:branch color 249
zstyle :prompt:pure:git:arrow color 119


# ===== CONFIG ===== #

ZSH_TMUX_AUTOSTART=true
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
  zsh_reload
)


# ===== LOAD ===== #

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# pure prompt
fpath+=$HOME/utilities/pure
autoload -U promptinit; promptinit
prompt pure
