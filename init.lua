-- Leader key (must be set before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load plugins (auto-imports all files from lua/plugins/)
require("lazy").setup({ import = "plugins" })

-- Load LSP configurations
require("lsp")
