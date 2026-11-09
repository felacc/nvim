-- General options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Interface
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" 
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- share system keyboard!

-- Splits
vim.opt.splitright = true -- vertical splits on the right :vsplit
vim.opt.splitbelow = true -- horizontal splits below :split

-- Undo behavior
vim.opt.undofile = true -- persistent undo after closing file

-- Swap file
vim.opt.swapfile = true

-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down in visual line mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up in visual line mode

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  performance = {
        rtp = {
            reset = false,
        },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
