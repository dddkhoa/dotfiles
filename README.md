# Dotfiles

Personal configuration files for development tools.

## Contents

| Tool | Config Location | Description |
|------|-----------------|-------------|
| **Claude Code** | `~/.claude/` | AI coding assistant settings and instructions |
| **Codex** | `~/.codex/` | OpenAI Codex CLI configuration |
| **Ghostty** | `~/Library/Application Support/com.mitchellh.ghostty/` | Terminal emulator |
| **Neovim** | `~/.config/nvim/` | LazyVim-based editor config |
| **Zsh** | `~/.zshrc` | Shell configuration |
| **Powerlevel10k** | `~/.p10k.zsh` | Zsh prompt theme |
| **Alacritty** | `~/.config/alacritty/` | Terminal emulator (legacy) |

## Installation

### Quick Setup (Symlinks)

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles

# Claude Code
ln -sf ~/code/dotfiles/claude-code/settings.json ~/.claude/settings.json
ln -sf ~/code/dotfiles/claude-code/CLAUDE.md ~/.claude/CLAUDE.md

# Codex
ln -sf ~/code/dotfiles/codex/config.toml ~/.codex/config.toml

# Ghostty (macOS)
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -sf ~/code/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config

# Neovim
rm -rf ~/.config/nvim
ln -sf ~/code/dotfiles/nvim ~/.config/nvim

# Zsh
ln -sf ~/code/dotfiles/zshrc ~/.zshrc
ln -sf ~/code/dotfiles/p10k.zsh ~/.p10k.zsh
```

### Notes

- **Codex**: Project trust levels are machine-specific. Add your own after setup:
  ```toml
  [projects."/path/to/your/project"]
  trust_level = "trusted"
  ```

- **Neovim**: First launch will auto-install plugins via lazy.nvim

- **Fonts**: Install a Nerd Font for proper icon rendering:
  ```bash
  brew install --cask font-meslo-lg-nerd-font
  ```

## Dependencies

```bash
# CLI tools referenced in CLAUDE.md
brew install fd ripgrep ast-grep fzf jq yq eza bat

# Neovim
brew install neovim

# Ghostty
brew install --cask ghostty
```

## Updating

After making changes to configs:

```bash
cd ~/code/dotfiles
git add -A
git commit -m "Update configs"
git push
```
