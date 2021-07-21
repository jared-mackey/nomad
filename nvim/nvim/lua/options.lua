local opt = vim.opt

-- Spacing
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.linebreak = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- UI Config
opt.termguicolors = true
opt.encoding = "utf8"
opt.number = true
opt.ruler = true

-- list chars for hidden characters
opt.lcs = "extends:❯,precedes:❮,tab:>-"

-- allow hidden buffers (buffers that haven't been written, but can be closed)
opt.hidden = true

-- Copy to and from built-in clipboard
opt.clipboard = "unnamedplus"

-- Menus
opt.wildmenu = true
opt.completeopt = "menuone,noselect,noinsert"

-- Blink cursor instead of beeping
opt.visualbell = true

-- Status line got us here
opt.showmode = false

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- how often to poll for updates
-- affects things like gutter symbols
opt.updatetime = 300
opt.lazyredraw = true

-- THEME
opt.background = "dark"
vim.g.gruvbox_filetype_hi_groups = 0
vim.g.gruvbox_bold = 0
vim.g.gruvbox_italicize_strings = 0
vim.g.gruvbox_transp_bg = 0
vim.g.gruvbox_invert_selection = 0

-- BACKUP/SWAP
opt.backup = false
opt.writebackup = false
