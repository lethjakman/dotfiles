# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# completions
fpath=(~/.zsh-completions/zsh-completions/src $(brew --prefix)/share/zsh/site-functions $fpath ~/.zfunc)

# The following lines were added by compinstall
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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

# lscolors
source "$HOME/.zsh-plugins/LS_COLORS/lscolors.sh"
alias ls="ls --color=auto"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH="$PATH:$HOME/.config/emacs/bin/"

# Node nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#

# Configuration
export EDITOR=nvim

zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --preview-window '~3'"

alias vim="nvim"
alias e="$EDITOR"
alias k="kubectl"

# source local zshrc settings
source "$HOME/.zshrc.local"

# setup direnv
eval "$(direnv hook zsh)"

# Created by `pipx` on 2024-02-02 05:15:35
export PATH="$PATH:$HOME/.local/bin"

# pipx
PATH="$PATH:$PIPX_BIN_DIR"

alias cd=z
alias ls=exa --icons --colors=always
alias cat=bat
alias find=fd
alias grep=rg
alias du=dust
alias sed=sd
# alias cloc=tokei
alias ps=procs
#
