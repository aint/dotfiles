#!/usr/bin/env bash
set -e

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}macos configs${NC}"
mkdir -p ~/Desktop/Screen\ Shots
defaults write com.apple.screencapture location '~/Desktop/Screen Shots'
killall SystemUIServer

echo -e "${RED}install homebrew${NC}"
which -s brew
if [[ $? != 0 ]] ; then
    echo -e "${RED}install homebrew${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${RED}brew already installed${NC}"
fi

echo -e "${RED}install git${NC}"
brew install git

echo -e "${RED}create workspace and clone dotfiles repo${NC}"
mkdir -p ~/Workspace && cd ~/Workspace
rm -fr dotfiles/ && git clone https://github.com/aint/dotfiles.git && cd dotfiles

echo -e "${RED}zsh configs${NC}"
rm -f ~/.zshrc && ln -s $(pwd)/.zshrc ~/.zshrc

echo -e "${RED}git configs${NC}"
rm -f ~/.gitconfig && ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
rm -f ~/.gitignore_global && ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
rm -fr ~/.config/git && mkdir -p ~/.config/git/hooks/
ln -sf $(pwd)/git/hooks/* ~/.config/git/hooks/

echo -e "${RED}install brew packages${NC}"
brew install \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    lazygit \
    delta \
    go \
    jq \
    fzf \
    podman \
    podman-compose \

echo -e "${RED}lazygit configs${NC}"
mkdir -p ~/Library/Application\ Support/lazygit/
rm -f ~/Library/Application\ Support/lazygit/config.yml
ln -s $(pwd)/git/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

echo -e "${RED}install brew casks${NC}"
brew install \
    firefox \
    zed \
    visual-studio-code \
    dbeaver-community \
    keepassxc \
    restfox \
    pinta \
    flameshot \
    imageoptim \
    maccy

echo -e "${RED}vscode configs${NC}"
rm -fr ~/Library/Application\ Support/Code/
mkdir -p ~/Library/Application\ Support/Code/User/snippets/
ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/vscode/snippets/*.json ~/Library/Application\ Support/Code/User/snippets/

echo -e "${RED}DONE${NC}"
