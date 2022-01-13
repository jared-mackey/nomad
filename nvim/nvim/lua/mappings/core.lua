local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

-- define the leaders
vim.g.mapleader = " "

-- make jump commands center the screen on search term
map('n', 'n', 'nzz', default_opts)

-- Tab stuff
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true, expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {noremap = true, expr = true})

-- Yank (copy) entire file to clipboard
map('n', '<Leader>yy', ':%y<CR>', {noremap = true})
