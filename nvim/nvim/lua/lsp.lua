vim.cmd('packadd nvim-lspconfig')

local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'
local protocol = require'vim.lsp.protocol'

local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP SERVER CONFIGURATION
-- ===================================================================
nvim_lsp.elixirls.setup{
  capabilities = capabilities,
  on_attach = function()
    require('lsp_signature').on_attach()
  end,
  cmd = {
    vim.loop.os_homedir() .. "/dev/private/elixir-ls/rel/language_server.sh"
  },
  settings = {
    elixirLS = {
      dialyzerEnabled = true;
    }
  }
}

nvim_lsp.sqlls.setup{
  cmd = {
    "sql-language-server", "up", "--method", "stdio"
  }
}

-- Setup treesitter
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   ignore_install = { "javascript" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = {},  -- list of language that will be disabled
--   },
--   indent = {
--     enable = true
--   }
-- }

-- Setup language server installer / sourcer
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      -- Require lsp signature when setting up these LSP
      on_attach = function()
        require('lsp_signature').on_attach()
      end
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
