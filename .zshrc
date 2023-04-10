# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable vi-style bindings in ZSH
bindkey -v

# Path to your oh-my-zsh installation.
export ZSH="/home/anthony/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode dotenv git vscode zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search)

# vi-mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

# Keybinds for zsh-history-substring-search
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias Functions
dc() {
    if [ -z "$1" ]; then
        docker compose
    else
        if [ "$1" = "full" ]; then
            shift
            docker compose -f docker-compose.yml -f docker-compose-ngrok.yml $@
        else
            docker compose $@
        fi
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto-load node version from .nvmrc files
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Path Additions
#export PATH="/snap/bin:$HOME/.rbenv/bin:$PATH"
export PATH="$(python3 -m site --user-base)/bin:$PATH"

# Java
#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"

# Android Studio + RN setup
#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go Path Addition
export PATH=$PATH:/usr/local/go/bin

# Rust
source $HOME/.cargo/env

# Editor env assignments
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color

# Aliases
alias opo-check="(){ curl -X POST -F 'target="$1"' https://naughty-knuth-c2f221.netlify.app/.netlify/functions/seo-data ;}"
#alias server-connect="ssh -i $HOME/.ssh/work_id_rsa work@34.73.69.180"
alias package-cleanup="sudo apt autoremove"
#alias colorpicker="$HOME/source/apps/colorpicker/colorpicker --short --one-shot --preview | xsel -b"
alias log-out="i3-msg exit"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias start-osx='docker run -it --device /dev/kvm -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix -p 50922:10022 -e NOPICKER=true -e GENERATE_SPECIFIC=true -e DEVICE_MODEL="iMacPro1,1" -e SERIAL="C02Y20MDHX87" -e BOARD_SERIAL="C029014014NJG368C" -e UUID="95026928-D09C-43AB-AD8D-FD4728AF9B11" -e MAC_ADDRESS="50:F4:EB:DE:FC:B1" -v "/home/anthony/.docker-osx/mac_hdd_ng.img:/image" sickcodes/docker-osx:naked'
alias amptest='docker container exec amplify-app-1 bundle exec rspec'
alias twitch='$HOME/.stream-setup'
alias unlock-passport='(){ sudo wdpassport-utils.py --device $1 --unlock ;}'
alias mount-passport='(){ sudo mount $1 ~/media ;}'
alias arg-test='(){ echo $1 ;}'
alias transcode='(){ ffmpeg -i $1 -c:v dnxhd -profile:v dnxhr_sq -pix_fmt yuv422p -c:a pcm_s16le -f mov $2 ;}'
alias cat='bat'
alias ls='exa'
alias ll='exa -al'
alias top='btop'
alias mux='tmuxinator'
alias hx='helix'
alias sdf='ssh -t rufus@tty.sdf.org'
alias pt='porsmo'
alias speedtest='speedtest-rs'

# i3 layouts
alias start-main="/home/anthony/.i3/scripts/work-layout main"

# Source FZF if it exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start a zellij session if it hasn't been started yet
export ZELLIJ_AUTO_ATTACH=true
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

