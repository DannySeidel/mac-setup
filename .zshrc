# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias python=python3
alias py=python
alias pdg='cd ~/development/gitlab/porsche-digital/'
alias ls=lsd
alias tree='lsd --tree'

# import git aliases
source ~/.config-files/git_aliases

PROMPT='%3~ %# ' 
export HISTTIMEFORMAT='%F, %T '
export HISTSIZE=20000
export HISTFILESIZE=20000

export PATH="/usr/local/sbin:$PATH"
export LANGUAGE='en_US.UTF-8 git'

export GPG_TTY=$(tty)
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
