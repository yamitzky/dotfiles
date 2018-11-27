# homesick
export DOTFILES_HOME=$HOME/.homesick/repos/dotfiles/home
export PATH=/usr/local/bin:$PATH

# external plugin
fpath=(/usr/local/Cellar/zsh-completions/*/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

autoload -U compinit
autoload -Uz zmv
compinit
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
setopt auto_cd
setopt auto_remove_slash
setopt always_last_prompt
setopt share_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt no_beep
setopt complete_aliases
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

setopt no_complete_aliases
setopt extended_glob

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%1~ $ "
PROMPT2="%{[31m%}%_%%%{[m%} "
RPROMPT='%1(v|%F{cyan}%1v%f|)%{[32m%}[%40<...<%~]%{[m%}'
SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "

source $DOTFILES_HOME/zsh/env.zsh
source $DOTFILES_HOME/zsh/alias.zsh
[[ -f ~/.zsh_local ]] && source ~/.zsh_local # custom configuration

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias cat=/usr/local/bin/bat
export PATH="/usr/local/opt/sqlite/bin:$PATH"
