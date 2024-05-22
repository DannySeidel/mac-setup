export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# import zsh aliases
source ~/.config-files/aliases/zsh_aliases

# import git aliases
source ~/.config-files/aliases/git_aliases

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

PROMPT='%3~ %# ' 
export HISTTIMEFORMAT='%F, %T '
export HISTSIZE=50000
export HISTFILESIZE=50000

# pyenv path
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# android path
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/usr/local/sbin:$PATH"
export LANGUAGE='en_US.UTF-8 git'
export EDITOR='/opt/homebrew/bin/nvim'
export HOMEBREW_EDITOR=nvim

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/usr/local/bin/node:$PATH"

eval $(thefuck --alias)
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

PATH=~/.console-ninja/.bin:$PATH
