vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

packer.startup(function ()
  use {'wbthomason/packer.nvim', opt = true}
  -- ================================================================================
  -- CORE
  use 'tpope/vim-fugitive'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'justinmk/vim-sneak'
  use {
    'janko/vim-test',
    requires = { 'tpope/vim-dispatch', 'neomake/neomake' }
  }
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require'compe'.setup {        
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,
        source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          vim_dadbod_completion = true,
          vsnip = true
        }
      }
    end
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {{'kabouzeid/nvim-lspinstall'}},
    config = function() require('lsp') end,
  }
  use {
    'ray-x/lsp_signature.nvim'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
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
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- ================================================================================

  -- FILESYSTEM
  use{'francoiscabrol/ranger.vim', requires = {'rbgrouleff/bclose.vim'}}
  -- ================================================================================

  -- LANGUAGE SUPPORT
  -- elixir
  use 'elixir-editors/vim-elixir'
  -- rust
  use 'simrat39/rust-tools.nvim'
  -- ================================================================================

  -- THEME
  use 'ryanoasis/vim-devicons'
  --use {
  --  '~/dev/private/gruvbox.nvim',
  --  requires = {'rktjmp/lush.nvim'},
  -- config = 'vim.cmd[[colorscheme gruvbox]]'
  --}
  use {
    'embark-theme/vim',
    as = 'embark',
    config = function()
      vim.g.embark_terminal_italics = false
      vim.cmd[[colorscheme embark]]
    end
  }
  -- ================================================================================

  -- DATABASE
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  -- ================================================================================

  -- Browser
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
end)

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
