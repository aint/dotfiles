fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(fzf --zsh)

export HISTFILE=~/.zsh_history
export HISTSIZE=25000
export SAVEHIST=25000

setopt appendhistory        # append history to the history file
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks   # remove superfluous blanks from history items
setopt inc_append_history   # save history entries as soon as they are entered
setopt share_history        # share history between different instances of the shell

export VISUAL=/usr/local/bin/zed
export EDITOR="/usr/bin/vim"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_ANALYTICS=1

export GOPATH=$HOME/Workspace/
export PATH=$GOPATH/bin:$PATH
export GOPRIVATE=github.com/YOUR_COMPANY
