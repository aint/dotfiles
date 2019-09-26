#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# packages
brew install \
    antibody \
    bat \
    cloc \
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

# apps
brew cask install \
    copyq \
    docker \
    firefox \
    font-iosevka \
    font-meslo-nerd-font \
    google-chrome \
    imageoptim \
    joplin \
    keepassxc \
    skype \
    spectacle \
    spotify \
    sublime-text \
    vienna \
    visual-studio-code \
    vlc
