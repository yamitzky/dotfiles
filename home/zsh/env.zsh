export EDITOR=nvim
export MYSQL_WORKBENCH="/Applications/MySQLWorkbench.app/Contents/MacOS/MySQLWorkbench"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:$HOME/anaconda/lib
export RSENSE_HOME=$HOME/sources/rsense-0.3
export GOPATH=$HOME/gocode
export PYTHONPATH=/usr/local/Cellar/opencv/2.4.6.1/lib/python2.7/site-packages:$PYTHONPATH
export VIRTUAL_ENV_DISABLE_PROMPT=1

# PATH
export PATH=~/softwares:$PATH
export PATH=~/bin:$PATH
export PATH=~/sources/play:$PATH
export PATH=/Applications/IntelliJ\ IDEA\ 13.app/Contents/MacOS:$PATH
export PATH=~/softwares/dex2jar-0.0.9.15/:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/softwares/adt/sdk/platform-tools:$HOME/softwares/adt/sdk/tools
export PATH=$PATH:$HOME/softwares/adt/sdk/build-tools/17.0.0
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:$HOME/anaconda/bin

eval "$(pyenv init -)"
eval "$(rbenv init -)"

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
