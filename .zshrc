fpath=(/usr/local/share/zsh/functions/ $fpath)
autoload -Uz compinit
compinit -u

source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle romkatv/powerlevel10k
antibody bundle zsh-users/zsh-autosuggestions

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="/usr/bin/vim"

export BAT_THEME="TwoDark"

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
setopt appendhistory

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks   # remove superfluous blanks from history items
setopt inc_append_history   # save history entries as soon as they are entered
setopt share_history        # share history between different instances of the shell

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Python 3 as default
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Golang
export GOPATH=$HOME/Projects/go
export PATH=$GOPATH/bin:$PATH

#Sdkman
export SDKMAN_DIR="/Users/aint/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
