local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<leader>tt', ':TestFile<CR>', default_opts)
map('n', '<leader>tn', ':TestNearest<CR>', default_opts)
