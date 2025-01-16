vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set indentation to 4 spaces
vim.opt.tabstop = 2        -- Number of spaces for a tab
vim.opt.shiftwidth = 2     -- Number of spaces for indentation
vim.opt.softtabstop = 2    -- Number of spaces for a <Tab> in insert mode
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 20

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.wrap = true            -- Enable line wrapping
vim.opt.linebreak = true       -- Wrap at word boundaries instead of breaking words
vim.opt.showbreak = "↪ "       -- Show an indicator for wrapped lines

-- Enable folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- You can also set these if you want folds to be open by default
vim.opt.foldenable = true
vim.opt.foldlevel = 99
