#!/bin/bash
set -e

echo "=== Dotfiles Setup ==="
echo ""

# ---- Homebrew ----
if ! command -v brew &> /dev/null; then
  echo "[1/6] Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "[1/6] Homebrew already installed, skipping."
fi

# ---- CLI Tools ----
echo "[2/6] Installing CLI tools via Homebrew..."
brew install \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  starship \
  zoxide \
  fzf \
  bat \
  micro \
  eza \
  git-delta \
  lazygit \
  mise

# ---- Font: Maple Mono NF CN ----
echo "[3/6] Installing Maple Mono NF CN font..."
brew tap homebrew/cask-fonts 2>/dev/null || true
brew install --cask font-maple-mono-nf-cn 2>/dev/null || echo "  Font not in cask, please install manually from https://github.com/subframe7536/maple-font"

# ---- Symlink configs ----
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "[4/6] Linking config files..."

mkdir -p ~/.config/ghostty
mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/configs/ghostty/config" ~/.config/ghostty/config
ln -sf "$DOTFILES_DIR/configs/starship/starship.toml" ~/.config/starship.toml
echo "  Linked ghostty config"
echo "  Linked starship config"

# ---- Ghostty Cursor Shaders ----
if [ ! -d ~/.config/ghostty/cursor-shaders ]; then
  echo "  Installing cursor shaders..."
  git clone https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/cursor-shaders
else
  echo "  Cursor shaders already installed, skipping."
fi

# ---- .zshrc ----
echo "[5/6] Setting up .zshrc..."
if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d%H%M%S)
  echo "  Backed up existing .zshrc"
fi
cp "$DOTFILES_DIR/configs/zshrc" ~/.zshrc
echo "  Copied new .zshrc (edit to add your custom aliases/paths)"

# ---- .gitconfig (merge, not overwrite) ----
echo "[6/6] Setting up .gitconfig (delta integration)..."
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.line-numbers true
git config --global delta.syntax-theme Catppuccin-Mocha
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
echo "  Applied delta settings to gitconfig"

echo ""
echo "=== Done! ==="
echo "Restart your terminal to apply changes."
echo ""
echo "Optional: install Claude Code status line"
echo "  npm install -g @cometix/ccline"
echo ""
echo "Optional: install cmux (Ghostty-based AI terminal)"
echo "  brew tap manaflow-ai/cmux && brew install --cask cmux"
