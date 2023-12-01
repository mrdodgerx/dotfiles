#!/bin/bash

# Dotfiles repository directory
DOTFILES_DIR=~/.dotfiles

# List of dotfiles to link
DOTFILES=(
    .config
    .conky
    .dmenu
    .vimrc
    .zshrc
)

# Create symbolic links
for file in "${DOTFILES[@]}"; do
    if [ -e "$HOME/$file" ]; then
        echo "Backing up existing $file to $HOME/$file.bak"
        mv "$HOME/$file" "$HOME/$file.bak"
    fi

    echo "Creating symlink for $file"
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "Dotfiles setup complete!"

