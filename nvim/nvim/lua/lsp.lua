require("mason").setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    "lua_ls", "elixirls", "tsserver", "bashls", "jsonls", "yamlls", "html", "cssls", "dockerls",
    "terraformls", "cmake", "gopls", "rust_analyzer", "sqlls", "vimls", "pylsp",
  }
}

local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'
local protocol = require 'vim.lsp.protocol'

-- LSP SERVER CONFIGURATION
-- ===================================================================
local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["elixirls"] = function()
    nvim_lsp.elixirls.setup {
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
    }
  end,
  ["sqlls"] = function()
    nvim_lsp.sqlls.setup {
      cmd = {
        "sql-language-server", "up", "--method", "stdio"
      }
    }
  end,
  ["rust_analyzer"] = function()
    nvim_lsp.rust_analyzer.setup {
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
    }

    require("rust-tools").setup {}
  end
}

-- Setup treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {},      -- List of parsers to ignore installing
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

