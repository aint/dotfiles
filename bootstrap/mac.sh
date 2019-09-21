#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# packages
brew install \
    antibody \
    bat \
    cloc \
    curl \
    diff-so-fancy \
    fzf \
    git \
    go \
    gnupg \
    jq \
    httpie \
    lazygit \
    pinentry-mac \
    tree \
    wget \
    zsh \
    zsh-autosuggestions
