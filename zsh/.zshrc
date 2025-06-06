# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# completions
fpath=($fpath ~/.zfunc)
# If osx
if command -v brew 2>&1 >/dev/null
then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# The following lines were added by compinstall
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# Save history
setopt incappendhistory
# End of lines added by compinstall

# Enable vim editing of commands
# m-v v or m-x m-v
# can use fc to edit last command
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Plugins
eval "$(sheldon source)"
# source /Users/lethjakman/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh-plugins/zsh-z/zsh-z.plugin.zsh
# source ~/.zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# doom
PATH=$PATH:~/.emacs.d/bin
export PATH="$PATH:$HOME/.config/emacs/bin/"

# Node nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# add vim mason paths
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"


zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --preview-window '~3'"

# Configuration
export EDITOR=nvim

alias vim="nvim"
alias e="$EDITOR"
alias k="kubectl"

# source local zshrc settings
source "$HOME/.zshrc.local"

# setup direnv
eval "$(direnv hook zsh)"

# Created by `pipx` on 2024-02-02 05:15:35
export PATH="$PATH:$HOME/.local/bin"

# My scripts
export PATH="$PATH:$HOME/bin"

# pipx
PATH="$PATH:$PIPX_BIN_DIR"

# mason
PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

eval "$(zoxide init zsh --cmd cd)"

alias ls="exa --icons --color=always --group-directories-first"
alias l='ls -lah' # with headers
alias la='ls -al'  # all files and dirs
alias ll='ls -l'  # long format
alias lt='ls -aT'
alias cat=bat
alias find=fd
alias kubectl="kubecolor"
alias k=kubectl
# alias find=fd
#alias grep=rg
#alias du=dust
#alias sed=sd
# alias cloc=tokei
#alias ps=procs


# Forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

# Sesh
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

alias psql=pgcli
