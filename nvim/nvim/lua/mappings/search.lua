local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--type', 'file', '--hidden', '-g', '-E', '.git/' }})<cr>", default_opts)
map('n', '<leader>fr', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>", default_opts)
map('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<cr>", default_opts)
map('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.file_browser({cwd = vim.fn.expand('%:p:h')})<cr>", default_opts)
