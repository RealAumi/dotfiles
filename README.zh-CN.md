# Dotfiles

我的 macOS 终端开发环境，为 Claude Code 和 AI 辅助开发工作流优化。

## 包含什么

### 终端
- **cmux** / **Ghostty** — GPU 加速终端，支持 AI Agent 通知
- **Catppuccin Mocha** 主题 + 背景模糊（仅 Ghostty 原生支持）

### Shell (Zsh)
- **starship** — 可定制提示符（樱花配色 + 两行布局）
- **zsh-autosuggestions** — 类 Fish 的历史命令建议
- **zsh-syntax-highlighting** — 命令实时语法高亮

### 效率工具

| 工具 | 替代 | 功能 |
|------|------|------|
| `bat` | `cat` | 语法高亮的文件查看器 |
| `eza` | `ls` | 现代 ls，带图标、颜色、git 状态 |
| `micro` | `nano`/`vim` | 直觉式终端编辑器（Ctrl+S 保存） |
| `fzf` | `Ctrl+R` | 模糊搜索历史命令、文件、目录 |
| `zoxide` | `cd` | 智能目录跳转（学习你的习惯） |
| `lazygit` | `git` CLI | 终端 Git GUI |
| `delta` | `git diff` | 并排对比 diff，语法高亮 |

### Claude Code
- **CCometixLine** — 状态栏显示模型、git 信息、上下文使用量
- `cc` 别名 — 以 bypass-permissions 模式启动 Claude Code

## 快速安装

```bash
git clone https://github.com/RealAumi/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

## 文件结构

```
dotfiles/
├── README.md                       # English documentation
├── README.zh-CN.md                 # 中文文档
├── setup.sh                        # 一键安装脚本
└── configs/
    ├── ghostty/config              # Ghostty / cmux 终端配置
    ├── starship/starship.toml      # Starship 提示符配置（樱花主题）
    ├── zshrc                       # Zsh 配置
    └── gitconfig                   # Git 配置模板（delta 集成）
```

## 别名速查

| 别名 | 实际命令 |
|------|----------|
| `cat` | `bat` |
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza --icons --group-directories-first -la` |
| `lt` | `eza --icons --tree --level=2` |
| `lg` | `lazygit` |
| `cc` | `claude --dangerously-skip-permissions` |

## Cmd 快捷键映射

通过 Ghostty 配置将 Cmd 组合键转发为 Ctrl 序列，让终端应用（micro 等）用起来像原生 macOS 应用：

| 按键 | 效果 |
|------|------|
| `⌘S` | 保存 |
| `⌘Z` | 撤销 |
| `⌘⇧Z` | 重做 |
| `⌘A` | 光标到行首 |
| `⌘E` | 光标到行尾 |
| `⌘⌫` | 删除到行首 |

## cmux 快捷键

| 快捷键 | 功能 |
|--------|------|
| `⌘N` | 新建 workspace |
| `⌘1-8` | 切换 workspace |
| `⌘D` | 向右分屏 |
| `⌘⇧D` | 向下分屏 |
| `⌥⌘ ←→↑↓` | 在 pane 间移动 |
| `⌘⇧L` | 打开浏览器面板 |
| `⌘B` | 切换侧边栏 |
| `⌘⇧U` | 跳到最新通知 |

## Fzf 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+R` | 模糊搜索命令历史 |
| `Ctrl+T` | 模糊搜索文件 |
| `Alt+C` | 模糊 cd 到子目录 |

## Zoxide 用法

```bash
z my-app        # 跳到最近访问过的含 "my-app" 的目录
z work front    # 多关键词匹配
zi app          # 交互式选择（配合 fzf）
```

## Lazygit 用法

输入 `lg` 启动，常用按键：

| 按键 | 功能 |
|------|------|
| `j/k` | 上下选择 |
| `空格` | stage/unstage 文件 |
| `c` | 写 commit message |
| `p` | push |
| `?` | 查看所有快捷键 |
| `q` | 退出 |

## 已知限制

- **cmux 不支持的配置**：`background-opacity`、`background-blur-radius`、`theme` 在 cmux 中暂不生效（[#263](https://github.com/manaflow-ai/cmux/issues/263)、[#570](https://github.com/manaflow-ai/cmux/issues/570)），仅原生 Ghostty 支持。
- **字体要求**：需安装 [Maple Mono NF CN](https://github.com/subframe7536/maple-font)（带 Nerd Font + 中文支持）。
- **不建议用 Fish shell**：与 Claude Code 有 POSIX 兼容性问题。
