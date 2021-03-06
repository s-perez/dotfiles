# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mytheme"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tu-ci
  fancy-ctrl-z
  fasd
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export JUPYTER_NOTEBOOKS_DIR="$HOME/code"
export JUPYTER_HOME="$HOME/.notebooks"
export TERM=xterm-256color

# User configuration

# FZF config
# FZF
export FZF_DEFAULT_OPTS="-m -1 -0 --history=$HOME/.fzf_history --reverse --min-height 15 --bind '?:toggle-preview' --color=dark"
export FZF_COMPLETION_OPTS="--preview=\"file -b {}\" --preview-window=down:1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap:hidden"
export FZF_ALT_C_OPTS="--preview 'ls -A --color=always {}' --preview-window right:25%:hidden"
if hash rg 2>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --hidden --follow -uuu --files --no-messages'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gdc="gd --cached"
alias gboom="git stash; git stash drop"
alias k8s="~sperez/code/k8s-definitions/scripts/k8s"
alias cat="bat --paging=never"
alias ls="exa"
alias c="j"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias fn='funky'
alias gfn='funky --global'

[ -f ~/.local/share/funky/funky.sh ] && source ~/.local/share/funky/funky.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export DOCKER_SOCK_FILE=/var/run/docker.sock
