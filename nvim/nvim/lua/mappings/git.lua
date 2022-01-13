local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

map('n', '<leader>gs', ':Gstatus<CR>', default_opts)
map('n', '<leader>gd', ':Gvdiff<CR>', default_opts)
map('n', '<leader>gb', ':Gblame<CR>', default_opts)

vim.g.fugitive_gitlab_domains = {'https://git-p1ap1.divvy.co'}
