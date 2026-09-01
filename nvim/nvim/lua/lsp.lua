require("mason").setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    "lua_ls", "elixirls", "ts_ls", "bashls", "jsonls", "yamlls", "html", "cssls", "dockerls",
    "terraformls", "cmake", "gopls", "rust_analyzer", "sqlls", "vimls", "pylsp",
  }
}
-- local util = require 'lspconfig/util'
local protocol = require 'vim.lsp.protocol'

-- LSP SERVER CONFIGURATION
-- ===================================================================
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local install_config = function()
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.

  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- local mason = require("mason")

  vim.lsp.config("elixirls", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require('elixir.elixirls').on_attach(client, bufnr)
        require('elixir.credo').on_attach(client, bufnr)
      end,
      cmd = {
        vim.loop.os_homedir() .. "/dev/private/elixir-ls/rel/language_server.sh"
      },
      settings = {
        elixirLS = {
          dialyzerEnabled = true,
        }
      }
    })

  vim.lsp.config("sqlls", {
      cmd = {
        "sql-language-server", "up", "--method", "stdio"
      }
    })

  vim.lsp.config("rust_analyzer", {
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        virtual_text = {
          prefix = "",
          spacing = 0,
        },
        signs = true,
        underline = true,
        disabled = { "unresolved-proc-macro" },
        enableExperimental = true,
      },
    })

  --require("rust-tools").setup {}

  vim.lsp.config("gopls", {
      -- cmd = { 'gopls', 'serve', '--debug=localhost:6060' },
      --root_dir = util.root_pattern {
      --  '.git',
      --  'go.mod',
      --  'go.work'
      --},
      settings = {
        gopls = {
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          codelenses = {
            tidy = false,
          },
          staticcheck = true,
          gofumpt = true,
        }
      }
    })

    vim.lsp.config("lus_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "use" }
          }
        }
      }
    })
end

install_config()

-- Setup treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {"ipkg"},      -- List of parsers to ignore installing
  highlight = {
    enable = true,          -- false will disable the whole extension
    disable = {},           -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookbehind = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ic"] = "@comment.inner",
        ["ac"] = "@comment.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["am"] = "@class.outer",
        ["im"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer"
      }
    },
    move = {
      enable = true,
      set_jumps = false,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
      },
    },
  }
}
