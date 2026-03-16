# Dotfiles

My personal dotfiles for Arch Linux with BSPWM, Polybar, and more.

## Requirements

- Arch Linux (or Arch-based distro)
- BSPWM
- SXHKD
- Polybar
- Kitty / Alacritty
- Zsh with Oh My Zsh
- Vim with Plug

### Install Dependencies

```bash
# Core
sudo pacman -S bspwm sxhkd polybar polybar-msg picom dunst rofi

# Terminals
sudo pacman -S kitty alacritty

# Shell
sudo pacman -S zsh oh-my-zsh

# Tools
sudo pacman -S eza bat fzf ranger

# Fonts
sudo pacman -S ttf-meslo-lgnu-sd-nerd-font ttf-nerd-fonts-symbols

# Optional
sudo pacman -S network-manager-applet blueman brightnessctl scrot betterlockscreen conky
```

## Installation

### 1. Clone/Copy Dotfiles

```bash
# Copy all config files
cp -r dotfiles/* ~/.config/
cp dotfiles/zsh/.zshrc ~
cp dotfiles/zsh/.p10k.zsh ~
cp dotfiles/vim/.vimrc ~

# Copy conky themes and scripts
cp -r dotfiles/.conky ~

# Make scripts executable
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/cuts/launch.sh
chmod +x ~/.config/bin/*/

### 2. Set Zsh as Default Shell

```bash
chsh -s /bin/zsh
```

### 3. Install Vim Plugins

```bash
vim +PlugInstall +qall
```

### 4. Install Oh My Zsh Plugins

```bash
# zsh-syntax-highlighting
sudo pacman -S zsh-syntax-highlighting

# zsh-autosuggestions
sudo pacman -S zsh-autosuggestions
```

### 5. Start BSPWM

From your display manager, select BSPWM or add to `.xinitrc`:

```bash
echo "exec bspwm" > ~/.xinitrc
startx
```

## Configuration Overview

| Config | File | Description |
|--------|------|-------------|
| BSPWM | `~/.config/bspwm/bspwmrc` | Window manager config |
| SXHKD | `~/.config/sxhkd/sxhkdrc` | Hotkey daemon |
| Polybar | `~/.config/polybar/cuts/` | Status bar |
| Conky | `~/.conky/` | System monitor |
| Dunst | `~/.config/dunst/dunstrc` | Notification daemon |
| Dmenu | `~/.dmenu/` | Program launcher scripts |
| Kitty | `~/.config/kitty/kitty.conf` | Terminal emulator |
| Alacritty | `~/.config/alacritty/alacritty.yml` | Terminal emulator |
| Zsh | `~/.zshrc` | Shell config |
| Vim | `~/.vimrc` | Editor config |
| Mopidy | `~/.config/mopidy/mopidy.conf` | Music player daemon |

## Keybindings (SXHKD)

| Key | Action |
|-----|--------|
| `Super + Return` | Open kitty |
| `Super + Escape` | Reload SXHKD |
| `Super + Q` | Quit BSPWM |
| `Super + R` | Restart BSPWM |
| `Super + W` | Close window |
| `Super + T/S/F` | Tile/Float/Fullscreen |
| `Super + H/J/K/L` | Focus window |
| `Super + Shift + H/J/K/L` | Swap window |
| `Super + 1-9` | Switch desktop |
| `Super + Shift + 1-9` | Move window to desktop |
| `Print` | Screenshot |
| `Super + Shift + S` | Screenshot selection |
| `Super + L` | Lock screen |
| `Super + Ctrl + A` | App launcher (rofi) |
| `Super + Ctrl + F` | Firefox |
| `Super + Ctrl + C` | Brave Browser (incognito) |
| `Super + Ctrl + N` | File manager (nemo) |
| `Super + Ctrl + S` | Spotify |
| `Alt + Ctrl + S` | Screenshot menu |
| `Alt + Ctrl + E` | Edit configs |
| `Alt + Ctrl + M` | System monitor |
| `Alt + Ctrl + P` | Password manager |
| `F8` | Monitor switcher |
| `Ctrl + Alt + Left/Right` | Switch desktop |

## Custom Aliases

```bash
# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Package Management
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq 2>/dev/null)'

# File Listing
alias ls='eza -al --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'

# Git
alias addup='git add -u'
alias commit='git commit -m'
alias push='git push origin'

# System
alias sr='sudo reboot'
alias ssn='sudo shutdown now'
```

## Notes

- Polybar uses `cuts` theme with multiple bars (top/bottom for eDP-1 and HDMI-1)
- BSPWM monitors auto-detect: eDP-1 (laptop) and HDMI-1 (external)
- Wallpaper on startup uses nitrogen
- Conky runs via `~/.conky/conky-startup.sh`
- Dmenu scripts in `~/.dmenu/` for various utilities
- Color scheme: Gruvbox-inspired dark theme
- Random terminal greeting via `~/.config/bin/randomterminal.sh`
