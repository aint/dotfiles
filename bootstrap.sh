#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
NC='\033[0m'

DOTFILES="${HOME}/Workspace/dotfiles"

if [[ "$(uname -m)" != "arm64" ]]; then
    echo "This script supports Apple Silicon Macs only" >&2
    exit 1
fi

echo -e "${RED}0. configuring screenshot folder${NC}"
mkdir -p "${HOME}/Desktop/Screen Shots"
defaults write com.apple.screencapture location "${HOME}/Desktop/Screen Shots"
killall SystemUIServer || true

echo -e "${RED}1. installing brew${NC}"
if [[ ! -x /opt/homebrew/bin/brew ]]; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo -e "${RED}2. installing git${NC}"
brew install git

echo -e "${RED}3. cloning dotfiles${NC}"
mkdir -p "${HOME}/Workspace"
if [[ -d "${DOTFILES}/.git" ]]; then
    echo -e "${RED}dotfiles already cloned${NC}"
else
    # Ignore an existing global insteadOf rewrite so this clone stays on HTTPS.
    GIT_CONFIG_GLOBAL=/dev/null git clone https://github.com/aint/dotfiles.git "${DOTFILES}"
fi

echo -e "${RED}4. installing brew packages and casks${NC}"
brew install \
    pure \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    lazygit \
    delta \
    go \
    jq \
    fzf \
    podman \
    podman-compose

brew install --cask \
    zed \
    visual-studio-code \
    dbeaver-community \
    keepassxc \
    imageoptim \
    maccy

echo -e "${RED}5. configuring zsh, git, lazygit, ssh, vscode${NC}"
ln -sfn "${DOTFILES}/.zshrc" "${HOME}/.zshrc"

ln -sfn "${DOTFILES}/git/.gitconfig" "${HOME}/.gitconfig"
ln -sfn "${DOTFILES}/git/.gitignore_global" "${HOME}/.gitignore_global"
mkdir -p "${HOME}/.config/git/hooks"
for hook in "${DOTFILES}/git/hooks/"*; do
    ln -sfn "${hook}" "${HOME}/.config/git/hooks/$(basename "${hook}")"
done

mkdir -p "${HOME}/Library/Application Support/lazygit"
ln -sfn "${DOTFILES}/git/lazygit.yml" "${HOME}/Library/Application Support/lazygit/config.yml"

mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"
ln -sfn "${DOTFILES}/ssh/config" "${HOME}/.ssh/config"

mkdir -p "${HOME}/Library/Application Support/Code/User/snippets"
ln -sfn "${DOTFILES}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
for snippet in "${DOTFILES}/vscode/snippets/"*.json; do
    ln -sfn "${snippet}" "${HOME}/Library/Application Support/Code/User/snippets/$(basename "${snippet}")"
done

echo -e "${RED}DONE${NC}"
