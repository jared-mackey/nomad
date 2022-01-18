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

telescope.load_extension "file_browser"

map('n', '<leader>ff', ":Telescope find_files find_command=fd,--type,file,--hidden,-g,-E,.git/<cr>", default_opts)
map('n', '<leader>fr', ":Telescope buffers<cr>", default_opts)
map('n', '<leader>fg', ":Telescope git_status<cr>", default_opts)
map('n', '<leader>fb', ":Telescope file_browser<cr>", default_opts)
