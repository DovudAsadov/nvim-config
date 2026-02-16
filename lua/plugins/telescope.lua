return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
    },
    config = function()
        require("telescope").setup()
    end,
}
