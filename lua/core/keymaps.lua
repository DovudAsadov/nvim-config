local k = vim.keymap.set

-- Window navigation
k("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
k("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
k("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
k("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffer navigation
k("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
k("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Save and quit
k("n", "<leader>w", ":w<CR>", { desc = "Save file" })
k("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Stay in visual mode after indent
k("v", "<", "<gv", { desc = "Indent left" })
k("v", ">", ">gv", { desc = "Indent right" })

-- LSP
k("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
k("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
k("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
k("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
k("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format file" })
k("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
k("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
