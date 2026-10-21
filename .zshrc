eval "$(/opt/homebrew/bin/brew shellenv zsh)"

autoload -U promptinit; promptinit
autoload -U compinit; compinit
prompt pure

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source <(fzf --zsh)
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export HISTFILE=~/.zsh_history
export HISTSIZE=25000
export SAVEHIST=25000

setopt appendhistory        # append history to the history file
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks   # remove superfluous blanks from history items
setopt share_history        # import and append history as soon as commands are entered

export VISUAL="$HOMEBREW_PREFIX/bin/zed"
export EDITOR="/usr/bin/vim"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_ANALYTICS=1

export GOPATH="$HOME/Workspace/go"
export PATH="$GOPATH/bin:$PATH"
export GOPRIVATE=github.com/YOUR_COMPANY
