# Neovim Configuration

A modular Neovim configuration using native LSP (Neovim 0.11+) and lazy.nvim for plugin management.

## Requirements

- **Neovim 0.11+**
- **Git**
- [Nerd Font](https://www.nerdfonts.com/) (for icons)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)

## Installation

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone <this-repo> ~/.config/nvim
```

Open Neovim and plugins will install automatically on first launch.

## Structure

```
.
├── init.lua                  -- Entrypoint
├── lua/
│   ├── core/
│   │   ├── options.lua       -- Editor settings
│   │   ├── keymaps.lua       -- Keybindings
│   │   └── autocmds.lua      -- Autocommands
│   ├── plugins/              -- Plugin configs (auto-loaded by lazy.nvim)
│   │   ├── theme.lua
│   │   ├── tree.lua
│   │   ├── telescope.lua
│   │   ├── lualine.lua
│   │   ├── mason.lua
│   │   ├── cmp.lua
│   │   ├── autopairs.lua
│   │   ├── comment.lua
│   │   ├── gitsigns.lua
│   │   ├── indent.lua
│   │   └── whichkey.lua
│   └── lsp/
│       └── init.lua          -- LSP server configs
└── README.md
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Color scheme |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto bracket pairs |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Toggle comments |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |

## Keybindings

**Leader key: `Space`**

### General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit |
| `<` | Visual | Indent left (stays in visual mode) |
| `>` | Visual | Indent right (stays in visual mode) |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Move to left window |
| `Ctrl+j` | Normal | Move to lower window |
| `Ctrl+k` | Normal | Move to upper window |
| `Ctrl+l` | Normal | Move to right window |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Shift+l` | Normal | Next buffer |
| `Shift+h` | Normal | Previous buffer |

### File Explorer (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file explorer |

### Fuzzy Finder (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (search text) |
| `<leader>fb` | Normal | Find open buffers |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `K` | Normal | Hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>cf` | Normal | Format file |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

### Autocompletion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Insert | Open completion menu |
| `Enter` | Insert | Confirm selection |
| `Tab` | Insert | Next item / expand snippet |
| `Shift+Tab` | Insert | Previous item |

### Comments (Comment.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc` | Visual | Toggle comment on selection |

## Language Servers

Configured using the native Neovim 0.11 LSP API (no lspconfig plugin needed):

| Server | Language | Install |
|--------|----------|---------|
| pyright | Python | `npm i -g pyright` or `:MasonInstall pyright` |
| lua_ls | Lua | `:MasonInstall lua-language-server` |
| bashls | Bash/Shell | `npm i -g bash-language-server` or `:MasonInstall bash-language-server` |

### Adding a New Language Server

Edit `lua/lsp/init.lua` and add:

```lua
vim.lsp.config.server_name = {
    cmd = { "server-command", "args" },
    filetypes = { "filetype" },
    root_markers = { "marker_file", ".git" },
}
vim.lsp.enable("server_name")
```
