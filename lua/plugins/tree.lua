return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    config = function()
        require("nvim-tree").setup({
            view = { width = 30 },
            renderer = { group_empty = true },
            filters = { dotfiles = false },
        })
    end,
}
