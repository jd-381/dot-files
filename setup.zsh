#!/bin/zsh

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        echo "ERROR: Homebrew installation failed"
        exit 1
    }
    eval "$(/opt/homebrew/bin/brew shellenv)" || {
        echo "ERROR: Failed to initialize Homebrew environment"
        exit 1
    }
else
    echo "Homebrew is already installed. Updating Homebrew..."
    
    brew update
fi

echo "\nInstalling packages via Homebrew..."

brew install --cask discord
brew install --cask docker
brew install --cask font-fira-code-nerd-font
brew install --cask slack
brew install starship
brew install uv
brew install --cask visual-studio-code

SCRIPT_DIR="$HOME/workspace/dot-files"

echo "\nProcessing homedir symlinks..."

for file in $SCRIPT_DIR/homedir/*(N); do
    echo " - Linking $file to ~/.${file##*/}"
    ln -sf "$file" ~/".${file##*/}"
done

echo "\nProcessing ssh symlinks..."

mkdir -p ~/.ssh
chmod 700 ~/.ssh

for file in $SCRIPT_DIR/ssh/*(N); do
    echo " - Linking $file to ~/.ssh/${file##*/}"
    ln -sf "$file" ~/.ssh/"${file##*/}"
    chmod 600 $file
done

unset file

echo "\nGenerating Starship config..."

starship preset nerd-font-symbols > ~/.config/starship.toml

echo "\nSetup complete!"