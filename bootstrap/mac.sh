#!/usr/bin/env bash
set -e

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# packages
brew install \
    getantibody/tap/antibody \
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

# JVM stuff
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install maven
sdk install gradle
sdk install java

