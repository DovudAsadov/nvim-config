# Neovim Configuration

Modular Neovim config with native LSP (0.11+), lazy.nvim, Telescope, and Tokyo Night theme.

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
git clone https://github.com/DovudAsadov/nvim-config.git ~/.config/nvim
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

### Modes

| Key | Mode | Action |
|-----|------|--------|
| `i` | Normal | Insert before cursor |
| `a` | Normal | Insert after cursor |
| `I` | Normal | Insert at beginning of line |
| `A` | Normal | Insert at end of line |
| `o` | Normal | New line below and insert |
| `O` | Normal | New line above and insert |
| `v` | Normal | Visual (character) mode |
| `V` | Normal | Visual line mode |
| `Ctrl+v` | Normal | Visual block (column) mode |
| `R` | Normal | Replace mode (overwrite text) |
| `Esc` | Any | Back to normal mode |

### Basic Movement

| Key | Mode | Action |
|-----|------|--------|
| `h` | Normal | Move left |
| `j` | Normal | Move down |
| `k` | Normal | Move up |
| `l` | Normal | Move right |
| `w` | Normal | Jump to start of next word |
| `W` | Normal | Jump to start of next WORD (whitespace-delimited) |
| `b` | Normal | Jump to start of previous word |
| `B` | Normal | Jump to start of previous WORD |
| `e` | Normal | Jump to end of word |
| `E` | Normal | Jump to end of WORD |
| `0` | Normal | Go to beginning of line |
| `^` | Normal | Go to first non-blank character of line |
| `$` | Normal | Go to end of line |

### Line Navigation

| Key | Mode | Action |
|-----|------|--------|
| `gg` | Normal | Go to first line of file |
| `G` | Normal | Go to last line of file |
| `42G` | Normal | Go to line 42 |
| `:42` | Command | Go to line 42 |
| `H` | Normal | Jump to top of screen |
| `M` | Normal | Jump to middle of screen |
| `L` | Normal | Jump to bottom of screen |

### Scrolling

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+d` | Normal | Scroll half page down |
| `Ctrl+u` | Normal | Scroll half page up |
| `Ctrl+f` | Normal | Scroll full page down |
| `Ctrl+b` | Normal | Scroll full page up |
| `zz` | Normal | Center screen on cursor |
| `zt` | Normal | Scroll cursor line to top |
| `zb` | Normal | Scroll cursor line to bottom |

### Character & In-Line Search

| Key | Mode | Action |
|-----|------|--------|
| `f{char}` | Normal | Jump forward to `{char}` on current line |
| `F{char}` | Normal | Jump backward to `{char}` on current line |
| `t{char}` | Normal | Jump forward to just before `{char}` |
| `T{char}` | Normal | Jump backward to just after `{char}` |
| `;` | Normal | Repeat last `f`/`F`/`t`/`T` forward |
| `,` | Normal | Repeat last `f`/`F`/`t`/`T` backward |
| `%` | Normal | Jump to matching bracket `()`, `{}`, `[]` |

### Paragraph & Jump List

| Key | Mode | Action |
|-----|------|--------|
| `{` | Normal | Jump to previous blank line (paragraph up) |
| `}` | Normal | Jump to next blank line (paragraph down) |
| `Ctrl+o` | Normal | Go to previous position in jump list |
| `Ctrl+i` | Normal | Go to next position in jump list |

### Undo / Redo / Repeat

| Key | Mode | Action |
|-----|------|--------|
| `u` | Normal | Undo |
| `Ctrl+r` | Normal | Redo |
| `.` | Normal | Repeat last change |

### Copy (Yank)

| Key | Mode | Action |
|-----|------|--------|
| `yy` | Normal | Yank (copy) entire line |
| `y` | Visual | Yank selected text |
| `yw` | Normal | Yank from cursor to start of next word |
| `yiw` | Normal | Yank inner word (word under cursor) |
| `y$` | Normal | Yank from cursor to end of line |
| `y0` | Normal | Yank from cursor to beginning of line |
| `yi"` | Normal | Yank text inside double quotes |
| `yi'` | Normal | Yank text inside single quotes |
| `yi{` | Normal | Yank text inside `{}` |
| `yi(` | Normal | Yank text inside `()` |
| `yi[` | Normal | Yank text inside `[]` |
| `yaw` | Normal | Yank a word (includes surrounding space) |
| `yap` | Normal | Yank a paragraph |
| `"+y` | Visual | Yank to system clipboard |
| `"+yy` | Normal | Yank line to system clipboard |

### Paste

| Key | Mode | Action |
|-----|------|--------|
| `p` | Normal | Paste after cursor |
| `P` | Normal | Paste before cursor |
| `"+p` | Normal | Paste from system clipboard |
| `"0p` | Normal | Paste from yank register (last yank, ignoring deletes) |

### Delete (Cut)

| Key | Mode | Action |
|-----|------|--------|
| `x` | Normal | Delete character under cursor |
| `X` | Normal | Delete character before cursor |
| `dd` | Normal | Delete (cut) entire line |
| `d` | Visual | Delete selected text |
| `dw` | Normal | Delete from cursor to start of next word |
| `diw` | Normal | Delete inner word |
| `daw` | Normal | Delete a word (includes surrounding space) |
| `D` or `d$` | Normal | Delete from cursor to end of line |
| `d0` | Normal | Delete from cursor to beginning of line |
| `di"` | Normal | Delete text inside double quotes |
| `di{` | Normal | Delete text inside `{}` |
| `di(` | Normal | Delete text inside `()` |
| `da"` | Normal | Delete text including double quotes |
| `da{` | Normal | Delete text including `{}` |
| `dap` | Normal | Delete a paragraph |
| `dt{char}` | Normal | Delete until `{char}` on current line |

### Change (Delete + Insert)

| Key | Mode | Action |
|-----|------|--------|
| `cc` or `S` | Normal | Change entire line |
| `cw` | Normal | Change from cursor to end of word |
| `ciw` | Normal | Change inner word |
| `caw` | Normal | Change a word (includes surrounding space) |
| `C` or `c$` | Normal | Change from cursor to end of line |
| `c0` | Normal | Change from cursor to beginning of line |
| `ci"` | Normal | Change text inside double quotes |
| `ci'` | Normal | Change text inside single quotes |
| `ci{` | Normal | Change text inside `{}` |
| `ci(` | Normal | Change text inside `()` |
| `ci[` | Normal | Change text inside `[]` |
| `cit` | Normal | Change text inside HTML/XML tag |
| `ca"` | Normal | Change text including double quotes |
| `ct{char}` | Normal | Change until `{char}` on current line |
| `s` | Normal | Delete character and enter insert mode |
| `r{char}` | Normal | Replace character under cursor with `{char}` |

### Text Objects (used with d, c, y, v)

| Text Object | Meaning |
|-------------|---------|
| `iw` / `aw` | Inner / around word |
| `iW` / `aW` | Inner / around WORD |
| `is` / `as` | Inner / around sentence |
| `ip` / `ap` | Inner / around paragraph |
| `i"` / `a"` | Inner / around double quotes |
| `i'` / `a'` | Inner / around single quotes |
| `` i` `` / `` a` `` | Inner / around backticks |
| `i(` / `a(` | Inner / around parentheses |
| `i{` / `a{` | Inner / around curly braces |
| `i[` / `a[` | Inner / around square brackets |
| `i<` / `a<` | Inner / around angle brackets |
| `it` / `at` | Inner / around HTML/XML tag |

### Search and Replace

| Key | Mode | Action |
|-----|------|--------|
| `/text` | Normal | Search forward for "text" |
| `?text` | Normal | Search backward for "text" |
| `n` | Normal | Next search result |
| `N` | Normal | Previous search result |
| `*` | Normal | Search word under cursor (forward) |
| `#` | Normal | Search word under cursor (backward) |
| `:%s/old/new/g` | Command | Replace all "old" with "new" in entire file |
| `:%s/old/new/gc` | Command | Replace all with confirmation prompt |
| `:s/old/new/g` | Command | Replace all on current line only |
| `:'<,'>s/old/new/g` | Visual→Cmd | Replace all within visual selection |

### Selection (Visual Mode)

| Key | Mode | Action |
|-----|------|--------|
| `v` | Normal | Start character selection |
| `V` | Normal | Select entire line |
| `Ctrl+v` | Normal | Block (column) selection |
| `gv` | Normal | Reselect last visual selection |
| `o` | Visual | Jump to other end of selection |
| `vw` | Normal | Select to start of next word |
| `viw` | Normal | Select inner word |
| `vaw` | Normal | Select a word (includes space) |
| `vi"` | Normal | Select inside double quotes |
| `va"` | Normal | Select including double quotes |
| `vi{` | Normal | Select inside curly braces |
| `vi(` | Normal | Select inside parentheses |
| `vip` | Normal | Select inner paragraph |
| `vit` | Normal | Select inside HTML/XML tag |
| `V}` | Normal | Select lines to next blank line |

### Case Changing

| Key | Mode | Action |
|-----|------|--------|
| `~` | Normal | Toggle case of character under cursor |
| `gUiw` | Normal | UPPERCASE inner word |
| `guiw` | Normal | lowercase inner word |
| `gU` | Visual | UPPERCASE selection |
| `gu` | Visual | lowercase selection |
| `gUU` | Normal | UPPERCASE entire line |
| `guu` | Normal | lowercase entire line |

### Joining & Formatting

| Key | Mode | Action |
|-----|------|--------|
| `J` | Normal | Join current line with next line |
| `gJ` | Normal | Join lines without adding space |
| `gq` | Visual | Format/rewrap selected text |
| `==` | Normal | Auto-indent current line |
| `=` | Visual | Auto-indent selection |
| `gg=G` | Normal | Auto-indent entire file |

### Indentation

| Key | Mode | Action |
|-----|------|--------|
| `>` | Visual | Indent right (stays in visual mode) |
| `<` | Visual | Indent left (stays in visual mode) |
| `>>` | Normal | Indent line right |
| `<<` | Normal | Indent line left |
| `3>>` | Normal | Indent 3 lines right |

### Marks

| Key | Mode | Action |
|-----|------|--------|
| `m{a-z}` | Normal | Set local mark `{a-z}` |
| `m{A-Z}` | Normal | Set global mark `{A-Z}` (works across files) |
| `` `{mark} `` | Normal | Jump to exact position of mark |
| `'{mark}` | Normal | Jump to beginning of mark's line |
| `` `. `` | Normal | Jump to position of last change |
| `` `` `` | Normal | Jump back to position before last jump |
| `:marks` | Command | List all marks |

### Macros

| Key | Mode | Action |
|-----|------|--------|
| `q{a-z}` | Normal | Start recording macro into register `{a-z}` |
| `q` | Normal | Stop recording macro |
| `@{a-z}` | Normal | Play macro from register `{a-z}` |
| `@@` | Normal | Replay last played macro |
| `5@a` | Normal | Play macro `a` five times |

### Registers

| Key | Mode | Action |
|-----|------|--------|
| `"{reg}y` | Normal | Yank into register `{reg}` |
| `"{reg}p` | Normal | Paste from register `{reg}` |
| `"0p` | Normal | Paste last yank (ignores deletes) |
| `"+y` | Visual | Yank to system clipboard |
| `"+p` | Normal | Paste from system clipboard |
| `"_d` | Normal | Delete into black hole (don't overwrite register) |
| `:reg` | Command | Show all register contents |

### Save, Quit, Files

| Key | Mode | Action |
|-----|------|--------|
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit |
| `:w` | Command | Save file |
| `:wq` or `ZZ` | Command/Normal | Save and quit |
| `:q` | Command | Quit (fails if unsaved changes) |
| `:q!` or `ZQ` | Command/Normal | Quit without saving |
| `:wa` | Command | Save all open files |
| `:e filename` | Command | Open file |
| `:w filename` | Command | Save as new filename |
| `:saveas filename` | Command | Save as and switch to new file |

### Window Management

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Move to left window |
| `Ctrl+j` | Normal | Move to lower window |
| `Ctrl+k` | Normal | Move to upper window |
| `Ctrl+l` | Normal | Move to right window |
| `:vs` | Command | Vertical split |
| `:sp` | Command | Horizontal split |
| `Ctrl+w =` | Normal | Make all windows equal size |
| `Ctrl+w >` | Normal | Increase window width |
| `Ctrl+w <` | Normal | Decrease window width |
| `Ctrl+w +` | Normal | Increase window height |
| `Ctrl+w -` | Normal | Decrease window height |
| `Ctrl+w o` | Normal | Close all windows except current |
| `Ctrl+w q` | Normal | Close current window |
| `Ctrl+w T` | Normal | Move current window to new tab |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Shift+l` | Normal | Next buffer |
| `Shift+h` | Normal | Previous buffer |
| `:bd` | Command | Close current buffer |
| `:ls` | Command | List all open buffers |
| `:b {name}` | Command | Switch to buffer by partial name |
| `:b#` | Command | Switch to last used buffer |

### Tabs

| Key | Mode | Action |
|-----|------|--------|
| `:tabnew` | Command | Open new tab |
| `:tabnew file` | Command | Open file in new tab |
| `gt` | Normal | Go to next tab |
| `gT` | Normal | Go to previous tab |
| `:tabclose` | Command | Close current tab |

### Folding

| Key | Mode | Action |
|-----|------|--------|
| `za` | Normal | Toggle fold under cursor |
| `zo` | Normal | Open fold under cursor |
| `zc` | Normal | Close fold under cursor |
| `zR` | Normal | Open all folds |
| `zM` | Normal | Close all folds |

### Miscellaneous

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+a` | Normal | Increment number under cursor |
| `Ctrl+x` | Normal | Decrement number under cursor |
| `Ctrl+g` | Normal | Show file info (path, lines, position) |
| `ga` | Normal | Show ASCII/Unicode value of character |
| `:!command` | Command | Run shell command |
| `:r !command` | Command | Insert output of shell command |
| `:r filename` | Command | Insert contents of file |
| `:noh` | Command | Clear search highlighting |

### File Explorer (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file explorer |

### Fuzzy Finder (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (search text in all files) |
| `<leader>fb` | Normal | Find open buffers |

### LSP (Code Intelligence)

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
