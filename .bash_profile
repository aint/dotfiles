# ------------------------------------------------------------
# Change Prompt And Set Colors
# ------------------------------------------------------------
#	http://geoff.greer.fm/lscolors/
#	http://bashrcgenerator.com/	
# ------------------------------------------------------------
GIT_PROMPT_START="\[\033[38;5;226m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;60m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;166m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]"
GIT_PROMPT_END="\n\[$(tput sgr0)\]\[\033[38;5;246m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export PS1=$GIT_PROMPT_START:$GIT_PROMPT_END
#export PS1="\[\033[38;5;226m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;60m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;166m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;246m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced



# ------------------------------------------------------------
# Set Paths
# ------------------------------------------------------------
HOMEBREW1="/usr/local/bin"
export PATH=$HOMEBREW1:$PATH

HOMEBREW2="/usr/local/sbin"
export PATH=$HOMEBREW2:$PATH

ANDROID_TOOLS="/usr/local/android-sdk/platform-tools"
export PATH=$ANDROID_TOOLS:$PATH



# ------------------------------------------------------------
# Export variables
# ------------------------------------------------------------
export EDITOR="/usr/bin/vi"
export JAVA_6_HOME=$(/usr/libexec/java_home -v1.6)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME=$JAVA_8_HOME

#export STUDIO_JDK=$JAVA_8_HOME

#export http_proxy=http://178.205.252.51:3128
#export https_proxy=http://178.205.252.51:3128

export M2_HOME="/usr/local/opt/maven/libexec"
export MAVEN_OPTS="-Xmx512m"

export SCALA_HOME="/usr/local/opt/scala/libexec"

export ANDROID_HOME="/usr/local/android-sdk"

export GROOVY_HOME="/usr/local/opt/groovy/libexec"

export GRADLE_HOME="/usr/local/opt/gradle/libexec"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export HISTSIZE="32768"
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL="ignoreboth:erasedups"



# ------------------------------------------------------------
# Set aliases
# ------------------------------------------------------------
alias idproj="cd ~/projects/IdeaProjects"
alias jshell="/Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/bin/jshell"
alias gnucash="cd /Users/aint/projects/AndroidStudioProjects/gnucash-android/"
alias mysql="mysql -u root -p"

# Recursively delete .DS_Store files in current directory
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

alias java6="export JAVA_HOME=$JAVA_6_HOME"
alias java8="export JAVA_HOME=$JAVA_8_HOME"

# show/hide hidden files in Finder
alias finderShowHidden="defaults write com.apple.finder ShowAllFiles TRUE"
alias finderHideHidden="defaults write com.apple.finder ShowAllFiles FALSE"



# ------------------------------------------------------------
# Misc
# ------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

GIT_PROMPT_ONLY_IN_REPO=1
#GIT_PROMPT_START="\[\033[38;5;226m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;60m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;166m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]"
#GIT_PROMPT_END="\n\[$(tput sgr0)\]\[\033[38;5;246m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"


function __clean-cask {
    caskBasePath="/usr/local/Caskroom"
    local cask="$1"
    local caskDirectory="$caskBasePath/$cask"
    local versionsToRemove="$(ls -r $caskDirectory | sed 1,1d)"
    if [[ -n $versionsToRemove ]]; then
        while read versionToRemove ; do
            local diskUsage="$(du -sh $caskDirectory/$versionToRemove)"
            echo "Removing $cask $diskUsage"
            rm -rf "$caskDirectory/$versionToRemove"
        done <<< "$versionsToRemove"
    fi
}

#call this command to cleanup all, or you can specify cask name
function cask-cleanup {
  if [[ $# -eq 0 ]]; then
      while read cask; do
          __clean-cask "$cask"
      done <<< "$(brew cask list)"
  else
      __clean-cask "$1"
  fi
}

