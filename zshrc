# ----- USER ----- #

export MYCOLOR="${MYCOLOR:-#6cd2d4}"

export EDITOR='vi'

export PATH="$HOME"/dotfiles/scripts:"$PATH"
export PATH="$HOME"/bin:"$PATH"
export PATH="$HOME"/.local/bin:"$PATH"
export PATH="$HOME"/.pub-cache/bin:"$PATH"
export PATH=/opt/homebrew/bin:"$PATH"


# ----- PLUGINS ----- #

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  dirhistory
  history
  jsontools
  copyfile
  copypath
  tmux
  # zsh-autosuggestions
  zsh-syntax-highlighting  # keep at end of list to ensure proper coloring
)


# ----- THEME ----- #

zstyle :prompt:pure:path color "$MYCOLOR"
zstyle :prompt:pure:git:branch color 249
zstyle :prompt:pure:git:arrow color 119
zstyle :prompt:pure:execution_time color 220

export EZA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=1;34:\
ur=1;34:\
uw=35:\
ux=36:\
ue=36:\
gr=1;34:\
gw=35:\
gx=36:\
tr=1;34:\
tw=35:\
tx=36:\
gm=36:"


# ----- FUNCTIONS ----- #

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


# ----- PRE-LOAD CONFIG ----- #

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


# ----- LOAD ----- #

# Move into symdirs
for key val in ${(kv)SYMDIRS}; do
  key=$(echo "$key"|tr -d \")
  if [[ $PWD == $key* ]]; then
    cd $val${PWD:${#key}}
    break
  fi
done
# -------------------------------------------------- #
typeset -A SYMDIRS                                   #
# Example assoc array entry for private zshrc        #
# SYMDIRS[/mnt/Data/Dropbox]='/home/matthew/Dropbox' #
# -------------------------------------------------- #

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# aliases
source "${0:a:h}/zshrc-aliases"

# pure prompt
fpath+=$HOME/Utilities/pure
autoload -U promptinit && promptinit
prompt pure

# fzf keybindings
eval "$(fzf --zsh)"


# ----- POST-LOAD CONFIG ----- #

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


# ----- FINAL COMMANDS ----- #

fix_path_issues
