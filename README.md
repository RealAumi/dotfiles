# Dotfiles

My macOS terminal development environment, optimized for Claude Code and AI-assisted development workflows.

## What's Inside

### Terminal
- **cmux** / **Ghostty** — GPU-accelerated terminal with AI agent notifications
- **Catppuccin Mocha** theme + background blur (Ghostty native only)

### Shell (Zsh)
- **starship** — Customizable prompt (sakura pastel theme with two-line layout)
- **zsh-autosuggestions** — Fish-like history suggestions
- **zsh-syntax-highlighting** — Real-time command syntax coloring

### Productivity Tools
| Tool | Replaces | What it does |
|------|----------|-------------|
| `bat` | `cat` | Syntax-highlighted file viewer |
| `eza` | `ls` | Modern ls with icons, colors, git status |
| `micro` | `nano`/`vim` | Intuitive terminal editor (Ctrl+S to save) |
| `fzf` | `Ctrl+R` | Fuzzy finder for history, files, directories |
| `zoxide` | `cd` | Smart directory jumping (learns your habits) |
| `lazygit` | `git` CLI | Terminal UI for git operations |
| `delta` | `git diff` | Beautiful side-by-side diffs with syntax highlighting |

### Claude Code
- **CCometixLine** — Status line showing model, git info, context usage
- `cc` alias — Launch Claude Code in bypass-permissions mode

## Quick Setup

```bash
git clone https://github.com/RealAumi/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

## File Structure

```
dotfiles/
├── README.md
├── setup.sh                        # One-click setup script
└── configs/
    ├── ghostty/config              # Ghostty / cmux terminal config
    ├── starship/starship.toml      # Starship prompt config (sakura theme)
    ├── zshrc                       # Zsh configuration
    └── gitconfig                   # Git config template (delta integration)
```

## Aliases

| Alias | Command |
|-------|---------|
| `cat` | `bat` |
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza --icons --group-directories-first -la` |
| `lt` | `eza --icons --tree --level=2` |
| `lg` | `lazygit` |
| `cc` | `claude --dangerously-skip-permissions` |

## Keyboard Shortcuts (cmux)

| Shortcut | Action |
|----------|--------|
| `⌘N` | New workspace |
| `⌘1-8` | Switch workspace |
| `⌘D` | Split right |
| `⌘⇧D` | Split down |
| `⌥⌘ ←→↑↓` | Navigate panes |
| `⌘⇧L` | Open browser panel |
| `⌘B` | Toggle sidebar |
| `⌘⇧U` | Jump to latest notification |

## Fzf Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy search files |
| `Alt+C` | Fuzzy cd into subdirectory |

## Notes

- **cmux limitations**: `background-opacity`, `background-blur-radius`, and `theme` are not yet supported in cmux ([#263](https://github.com/manaflow-ai/cmux/issues/263), [#570](https://github.com/manaflow-ai/cmux/issues/570)). These work in native Ghostty only.
- **Font**: Requires [Maple Mono NF CN](https://github.com/subframe7536/maple-font) (Nerd Font with CJK support).
- **Fish shell**: Not recommended with Claude Code due to POSIX incompatibility issues.
