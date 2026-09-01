vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }
  -- ================================================================================
  -- CORE
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'rstacruz/vim-closer'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'justinmk/vim-sneak'
  use {
    'janko/vim-test',
    requires = { 'tpope/vim-dispatch', 'neomake/neomake' }
  }

  use {
    "williamboman/mason.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function() require('lsp') end,
  }

  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup({
        floating_window_off_x = 1,
        floating_window_off_y = -2,
        handler_opts = {
          border = "rounded"
        }
      })
    end,
  }

  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 100,
          hide_during_completion = true,
          keymap = {
            accept = '<C-y>',
          },
        },
        panel = { enabled = false },
      })
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmd-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-s>'] = cmp.mapping.complete({
            config = {
              sources = {
                { name = 'vsnip' },
              }
            }
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert })
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vsnip' },
        },
      }
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('status-line') end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use {
    'mfussenegger/nvim-dap',
    requires = {
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "simrat39/rust-tools.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("debugger").setup()
    end
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }

  --
  -- LANGUAGE SUPPORT
  -- elixir
  use {
    "elixir-tools/elixir-tools.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("elixir").setup({
        elixirls = { enable = false },
        nextls = { enable = false },
        credo = { enable = true }
      })
    end
  }
  -- rust
  use 'simrat39/rust-tools.nvim'
  -- salt
  use 'saltstack/salt-vim'
  -- go
  use {
    'fatih/vim-go',
    setup = function() vim.g.go_pls_enabled = false end,
  }
  -- markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })
  -- helm
  use 'towolf/vim-helm'

  -- ================================================================================

  -- THEME
  use 'ryanoasis/vim-devicons'
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd [[colorscheme gruvbox]]
    end
  }
  use {
    'embark-theme/vim',
    branch = 'treesitter-and-colorV2-new-red',
    as = 'embark',
  }
  use {
    'andersevenrud/nordic.nvim',
  }

  -- ================================================================================

  -- DATABASE
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  -- ================================================================================

  use 'skywind3000/asyncrun.vim'

  -- Browser
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
end)

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
