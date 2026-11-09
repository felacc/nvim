# Neovim Configuration

My personal Neovim configuration, written in Lua and managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

Designed primarily for Ubuntu on WSL 2, with support for native Ubuntu installations.

Currently configured for:

- Python
- C and C++
- Lua
- JavaScript
- HTML and CSS
- JSON
- Markdown

## Table of Contents

- [Requirements](#requirements)
- [System Dependencies](#system-dependencies)
- [Installation](#installation)
- [Plugins](#plugins)
- [Language Support](#language-support)
- [Formatting](#formatting)
- [WSL Configuration](#wsl-configuration)
- [Keymaps](#keymaps)
- [Useful Commands](#useful-commands)
- [Maintenance](#maintenance)

---

## Requirements

- Ubuntu 22.04 or newer
- Neovim 0.11+
- Git
- Node.js and npm
- Python 3
- GCC/G++ and Make
- WSL 2 (recommended for Windows users)

## System Dependencies

Update Ubuntu's package lists:

```bash
sudo apt update
```

Install the required packages:

```bash
sudo apt install -y \
    neovim \
    git \
    curl \
    wget \
    unzip \
    tar \
    gzip \
    build-essential \
    cmake \
    ninja-build \
    pkg-config \
    ripgrep \
    fd-find \
    nodejs \
    npm \
    python3 \
    python3-venv \
    python3-pip \
    python3-dev \
    xdg-utils
```

### Package Overview

| Package | Purpose |
|---|---|
| `neovim` | Text editor |
| `git` | Version control and plugin management |
| `curl`, `wget` | Downloading dependencies |
| `unzip`, `tar`, `gzip` | Extracting downloaded tools |
| `build-essential` | GCC, G++, Make, and compilation tools |
| `cmake` | C/C++ build system |
| `ninja-build` | Alternative build system |
| `pkg-config` | Finding installed libraries |
| `ripgrep` | Fast text searching |
| `fd-find` | Fast file searching |
| `nodejs`, `npm` | JavaScript runtime and package manager |
| `python3` | Python interpreter |
| `python3-venv` | Python virtual environments |
| `python3-pip` | Python package management |
| `python3-dev` | Python development headers |
| `xdg-utils` | Opening files and URLs through system handlers |

**Note:** Ubuntu packages may not always provide the newest Neovim or Node.js versions. Check compatibility if a plugin or language server requires a newer version.

## Installation

### 1. Clone this repository

Clone the configuration into Neovim's configuration directory:

```bash
git clone <REPOSITORY_URL> ~/.config/nvim
```

Replace `<REPOSITORY_URL>` with the URL of this repository.

### 2. Launch Neovim

```bash
nvim
```

On the first launch:

- lazy.nvim bootstraps automatically.
- Plugins are downloaded and installed.
- Plugin configurations are loaded.

### 3. Install language servers and formatters

Open Mason:

```vim
:Mason
```

Install the language servers and formatters listed in the Language Support section.

### 4. Check the configuration

Run:

```vim
:checkhealth
```

Resolve any missing dependencies or configuration errors.

---

## Plugins

Plugins are managed through [lazy.nvim](https://github.com/folke/lazy.nvim).

| Plugin | Purpose |
|---|---|
| [Catppuccin](https://github.com/catppuccin/nvim) | Colorscheme |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and parsing |
| [Mason](https://github.com/mason-org/mason.nvim) | External tool management |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [Conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Automatic bracket pairing |
| [Which-key](https://github.com/folke/which-key.nvim) | Keymap discovery |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Code commenting |
| [Trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics and LSP information |

### Plugin Management

Useful lazy.nvim commands:

```vim
:Lazy
:Lazy sync
:Lazy update
:Lazy clean
```

`lazy-lock.json` is committed to this repository to keep plugin versions consistent between installations.

---

## Language Support

Language servers and formatters are managed through Mason.

### Language Servers

| Language | Language Server | Mason Package |
|---|---|---|
| C | clangd | `clangd` |
| C++ | clangd | `clangd` |
| Python | Pyright | `pyright` |
| Lua | lua_ls | `lua-language-server` |
| JavaScript | ts_ls | `typescript-language-server` |
| HTML | html | `html-lsp` |
| CSS | cssls | `css-lsp` |
| JSON | jsonls | `json-lsp` |

### Formatters

| Language | Formatter | Mason Package |
|---|---|---|
| C | clang-format | `clang-format` |
| C++ | clang-format | `clang-format` |
| Python | Ruff | `ruff` |
| Lua | StyLua | `stylua` |
| JavaScript | Prettier | `prettier` |
| HTML | Prettier | `prettier` |
| CSS | Prettier | `prettier` |
| JSON | Prettier | `prettier` |
| Markdown | Prettier | `prettier` |

### Installing Tools

Open Mason:

```vim
:Mason
```

Alternatively, install tools using Mason's command:

```vim
:MasonInstall clangd pyright lua-language-server typescript-language-server html-lsp css-lsp json-lsp
```

Install formatters:

```vim
:MasonInstall clang-format ruff stylua prettier
```

**Note:** Language servers provide code intelligence, diagnostics, and navigation. Formatters handle code formatting. They serve different purposes.

---

## WSL Configuration

This configuration is primarily intended to run inside Ubuntu on WSL 2.

### Recommended Environment

- Windows 11
- WSL 2
- Ubuntu
- Windows Terminal
- Neovim installed inside Ubuntu

### Filesystem

Keep development projects inside the Linux filesystem rather than the mounted Windows filesystem.

Recommended directory structure:

```text
/home/felix/
├── .config/
│   └── nvim/
├── .ssh/
└── projects/
    ├── python/
    ├── cpp/
    └── web/
```

Create the projects directory:

```bash
mkdir -p ~/projects/{python,cpp,web}
```

Avoid storing active projects under `/mnt/c/` when possible. Working inside the Linux filesystem generally provides better performance and fewer filesystem compatibility issues.

### Clipboard Integration

Neovim uses the system clipboard through:

```lua
vim.opt.clipboard = "unnamedplus"
```

WSL supports Windows clipboard integration through Windows executables.

For example:

```bash
echo "Hello from WSL" | clip.exe
```

Check clipboard functionality inside Neovim:

```vim
:checkhealth clipboard
```

If clipboard integration does not work automatically, configure a WSL-specific clipboard provider.

### Git and SSH

Keep Linux Git configuration and SSH keys inside WSL:

```text
~/.gitconfig
~/.ssh/
```

Configure Git:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Generate an SSH key if needed:

```bash
ssh-keygen -t ed25519 -C "your@email.com"
```

Add the public key to your Git hosting account.

### Windows Applications

Windows applications can be launched from WSL when needed.

For example:

```bash
explorer.exe .
```

This opens the current directory in Windows File Explorer.

---

## Keymaps

The leader key is Space.

### General

| Keymap | Action |
|---|---|
| `<Space>` | Leader key |
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |

### LSP

| Keymap | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

### Formatting

| Keymap | Action |
|---|---|
| `<leader>fm` | Format current buffer |

Formatting is also configured to run automatically on save.

### Git

| Keymap | Action |
|---|---|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff current file |

### Diagnostics

| Keymap | Action |
|---|---|
| `<leader>xx` | Workspace diagnostics |
| `<leader>xX` | Current buffer diagnostics |
| `<leader>cs` | Document symbols |
| `<leader>cl` | LSP information |

---

## Useful Commands

| Command | Description |
|---|---|
| `:Lazy` | Manage plugins |
| `:Mason` | Manage language servers and tools |
| `:checkhealth` | Check Neovim health |
| `:LspInfo` | Inspect active language servers |
| `:ConformInfo` | Inspect formatter configuration |
| `:TSUpdate` | Update Treesitter parsers |
| `:Telescope find_files` | Find files |
| `:Telescope live_grep` | Search project contents |

---

## Maintenance

### Update Ubuntu packages

```bash
sudo apt update && sudo apt upgrade
```

### Update Neovim plugins

```vim
:Lazy update
```

### Update Treesitter parsers

```vim
:TSUpdate
```

### Update Mason tools

```vim
:Mason
```

Update installed tools through Mason's interface.

### Backing up the configuration

The configuration is maintained in Git.

```bash
cd ~/.config/nvim
git status
git add .
git commit -m "Update Neovim configuration"
git push
```

---

## Notes

- This configuration targets Neovim 0.11+.
- Treesitter currently uses the `master` branch for compatibility with Neovim 0.11.
- Plugins are managed through lazy.nvim.
- Language servers and formatters are managed through Mason.
- `lazy-lock.json` is committed to ensure consistent plugin versions.
- Python projects should use their own virtual environments.
- WSL-specific configuration may differ from native Linux installations.
