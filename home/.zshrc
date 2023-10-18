# homesick
export DOTFILES_HOME=$HOME/.homesick/repos/dotfiles/home
export PATH=/usr/local/bin:$PATH

source $DOTFILES_HOME/zsh/env.zsh
source $dotfiles_home/ZSH/ALIAS.ZSH
[[ -F ~/.zsh_local ]] && source ~/.zsh_local # custom configuration
alias cat=/usr/local/bin/bat
