#!/usr/bin/env bash
set -e

echo 'macos configs'
mkdir ~/Desktop/Screen\ Shots
defaults write com.apple.screencapture location "~/Desktop/Screen Shots"
killall SystemUIServer

echo 'zsh configs'
lm -s $(pwd)/.zshrc ~/.zshrc

echo 'git configs'
ln -sf $(pwd)/git/.git* ~/
mkdir -p ~/.config/git/hooks/
ln -sf $(pwd)/git/hooks/* ~/.config/git/hooks/

echo 'lazygit configs'
mkdir -p ~/Library/Application\ Support/lazygit/
ln -s $(pwd)/git/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

echo 'vscode configs'
mkdir -p ~/Library/Application\ Support/Code/User/snippets/
ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/vscode/snippets/*.json ~/Library/Application\ Support/Code/User/snippets/

echo 'install homebrew'
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'brew has already installed'
fi

echo 'install brew packages'
brew install \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    git \
    lazygit \
    delta \
    go \
    jq \
    fzf \
    podman \
    podman-compose \
    zed \
    visual-studio-code \
    dbeaver-community \
    firefox \
    keepassxc \
    postman \
    pinta \
    flameshot \
    imageoptim
