# bind
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

# alias
alias migrate="bundle exec rake db:migrate"
alias pushcap="git push origin --all && cap "
alias l="ls -AGFh"
alias tm="tmux"
alias cd..="cd .."
alias :q="exit"
alias :tabe="vim"
alias logcat="adb logcat -c && adb logcat"
alias dex2jar="d2j-dex2jar.sh"
alias pbc="tee >(pbcopy)"
alias bsh="java -cp ~/softwares/bsh-2.0b4.jar bsh.Interpreter"
alias mecab="mecab -d `mecab-config --dicdir`'/mecab-ipadic-neologd'"
alias dl="docker ps -l -q"

# override
alias mv="mv -i"
alias cp="cp -i"
alias mkdir="mkdir -p"
alias javac="javac -J-Dfile.encoding=UTF8"
alias sed="gsed"
alias zmv="noglob zmv"

# path-to
alias tw="~/projects/ruby/gemmmmy/bin/tw"
alias webrick="~/works/ruby/webrick.rb"
if test -s /Applications/MacVim.app/Contents/MacOS/Vim; then
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi
alias newest="~/projects/ruby/newest/newest"
alias mutual="~/projects/ruby/mutual/mutual"
alias igata="~/projects/ruby/igata/bin/igata"

# python
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias quickwatch="watchmedo shell-command --recursive --command='echo \"\`date -v-1m +\"%H:%M:%S\"\` \${watch_src_path}\"' ."
alias json="python -m json.tool"
alias simpleserver="python -m SimpleHTTPServer"

# utility func
sha1() {
  ruby -e "require 'digest/sha1'; puts Digest::SHA1.hexdigest('$1')"
}

hmacsha1() {
  ruby -e "require 'digest/hmac'; puts Digest::HMAC.hexdigest('$1', '$2', Digest::SHA1)"
}

sso() {
  ruby -e "require 'digest/hmac'; puts Digest::HMAC.hexdigest('$1', '`salt`', Digest::SHA1) + '-$1'"
}

function b {
    cd ~/projects/$1
}
function _b {
    _files -W ~/projects/ && return 0;
    return 1;
}
compdef _b b

function notify {
  python -c"from pync import Notifier; Notifier.notify('$1')"
}

function kig {
    `ps aux | grep $1 |awk '{print "kill -KILL " $2;}'` | sh
}

function ucat {
    cat $1 | head -n $2 | tail -n 1
}

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}

function randimg() {
  convert -size $1 xc:` python -c "import random; r = lambda: random.randint(0,255); print('#%02x%02x%02x' % (r(),r(),r()))"` $2
}

# git
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias gpush="git push"
alias gpull="git pull"
alias gl="git log"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gm="git merge"
alias rebase="git pull --rebase upstream"

# abbr
typeset -A abbreviations
abbreviations=(
    "G"    "| grep"
    "X"    "| xargs"
    "H"    "| head -n"
    "T"    "| tail -n"
    "C"    "| cat"
    "W"    "| wc"
    "A"    "| awk"
    "S"    "| sed"
    "E"    "2>&1 > /dev/null"
    "N"    "> /dev/null"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand

# ext alias
alias -s py='python'
alias -s rb='ruby'
alias -s txt='cat'
alias -s html='google-chrome'
alias -s {gif,jpg,jpeg,png,bmp}='open'
alias -s exe='wine'

alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# peco
alias p="peco | tee >(pbcopy)"
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

chpwd() {
    ls_abbrev
    echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
}
ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}
