# Neovim Configuration

My personal Neovim configuration, written in Lua and managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

Designed primarily for **Ubuntu on WSL 2**, with support for native Ubuntu installations.

## Requirements

### System Packages

Install the following packages on Ubuntu:

```bash
sudo apt update
sudo apt install -y \
    neovim \
    git \
    curl \
    unzip \
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

| Package | Purpose |
|---|---|
| `neovim` | Text editor (0.11+) |
| `git` | Version control and plugin management |
| `curl`, `unzip` | Downloading and extracting dependencies |
| `build-essential` | GCC, G++, Make, and compilation tools |
| `cmake`, `ninja-build`, `pkg-config` | Building plugins and external tools |
| `ripgrep` | Fast text searching |
| `fd-find` | Fast file searching |
| `nodejs`, `npm` | JavaScript runtime and package management |
| `python3`, `python3-venv`, `python3-pip`, `python3-dev` | Python support and tooling |
| `xdg-utils` | Opening files and URLs through system handlers |

### Additional Dependencies

Some plugins and language tools require additional system packages.

- A working C/C++ compiler for native plugin dependencies.
- Node.js for JavaScript-based language servers.
- Python 3 for Python tooling.
- Git for downloading plugins and managing the configuration.

## Plugins

Plugins are managed through [lazy.nvim](https://github.com/folke/lazy.nvim).

| Plugin | Purpose |
|---|---|
| [Catppuccin](https://github.com/catppuccin/nvim) | Colorscheme |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and parsing |
| [Mason](https://github.com/mason-org/mason.nvim) | External tool management |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language server configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [Conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Automatic bracket pairing |
| [Which-key](https://github.com/folke/which-key.nvim) | Keymap discovery |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Code commenting |
| [Trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics and LSP information |

## Language Support

Language servers and formatters are installed through [Mason](https://github.com/mason-org/mason.nvim).

### Language Servers

| Language | Server | Mason Package |
|---|---|---|
| C / C++ | clangd | `clangd` |
| Python | Pyright | `pyright` |
| Lua | lua_ls | `lua-language-server` |
| JavaScript | ts_ls | `typescript-language-server` |
| HTML | html | `html-lsp` |
| CSS | cssls | `css-lsp` |
| JSON | jsonls | `json-lsp` |

### Formatters

| Language | Formatter | Mason Package |
|---|---|---|
| C / C++ | clang-format | `clang-format` |
| Python | Ruff | `ruff` |
| Lua | StyLua | `stylua` |
| JavaScript | Prettier | `prettier` |
| HTML | Prettier | `prettier` |
| CSS | Prettier | `prettier` |
| JSON | Prettier | `prettier` |
| Markdown | Prettier | `prettier` |

## Installation

Clone the repository into Neovim's configuration directory:

```bash
git clone <REPOSITORY_URL> ~/.config/nvim
```

Launch Neovim:

```bash
nvim
```

lazy.nvim will automatically bootstrap and install the configured plugins.

Install language servers and formatters through Mason:

```vim
:Mason
```

## Notes

- Requires Neovim 0.11 or newer.
- Plugins are managed through lazy.nvim.
- Language servers and formatters are managed through Mason.
- `lazy-lock.json` is committed to keep plugin versions consistent.
- Treesitter currently uses the `master` branch for Neovim 0.11 compatibility.
- Python projects should use their own virtual environments.
- Configuration is primarily developed and tested in Ubuntu on WSL 2.
