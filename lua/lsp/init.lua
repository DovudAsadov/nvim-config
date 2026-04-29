-- Native Neovim LSP configuration (no lspconfig plugin needed)
-- Compatible with Neovim 0.9+

local function find_root(markers)
    return vim.fs.dirname(vim.fs.find(markers, { upward = true })[1])
end

local function start(config)
    return function()
        vim.lsp.start({
            name = config.name,
            cmd = config.cmd,
            root_dir = find_root(config.root_markers) or vim.fn.getcwd(),
            settings = config.settings,
        })
    end
end

local servers = {
    {
        name = "pyright",
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                },
            },
        },
    },
    {
        name = "lua_ls",
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".git" },
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
    },
    {
        name = "bashls",
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash" },
        root_markers = { ".git" },
    },
}

local group = vim.api.nvim_create_augroup("UserLsp", { clear = true })
for _, server in ipairs(servers) do
    if vim.fn.executable(server.cmd[1]) == 1 then
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = server.filetypes,
            callback = start(server),
        })
    end
end
