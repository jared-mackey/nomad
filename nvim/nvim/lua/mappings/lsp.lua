local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('i', '<C-y>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format(nil)<CR>', default_opts)
-- map('n', '<leader>lf', '<cmd>execute "!mix format" <bar> edit! <CR>', default_opts)

map("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

map("n", "<leader>ef", ":ElixirFromPipe<cr>", { noremap = true})
map("n", "<leader>et", ":ElixirToPipe<cr>", { noremap = true})
map("v", "<leader>em", ":ElixirExpandMacro<cr>", { noremap = true})
