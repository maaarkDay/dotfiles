-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Core setup
require("core.options")
require("core.keymaps")

-- Plugin setup
require("lazy").setup("plugins", {
    install = { colorscheme = { "tokyonight" } }, -- Keep as fallback scheme
    checker = { enabled = true },
}
