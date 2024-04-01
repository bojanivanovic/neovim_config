local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'tpope/vim-sleuth' }, -- detect shiftwidth and tabstop automatically
  { 'numToStr/Comment.nvim', opts = {} }, -- comment visual selection
  { 'lewis6991/gitsigns.nvim' }, -- git-related signs in gutter
  { 'folke/which-key.nvim' }, -- show popup with keybind chains
  { 'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x', 
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    }
  },
  { 'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    }
  },
  { 'stevearc/conform.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-path' },
  {
    'L3MON4D3/LuaSnip',
    build = (function()
      -- Build Step is needed for regex support in snippets
      -- This step is not supported in many windows environments
      -- Remove the below condition to re-enable on windows
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)()
  },
  { 'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = { signs = false }
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'kdheepak/lazygit.nvim' },
  { 'p00f/nvim-ts-rainbow' }, -- different colours for matching parentheses
  { 'windwp/nvim-autopairs' },  -- auto closes parentheses
  { 'windwp/nvim-ts-autotag' }, -- auto closes tags
  { 'iamcco/markdown-preview.nvim' },
  { 'numToStr/FTerm.nvim' }, -- terminal inside nvim
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { 'christoomey/vim-tmux-navigator' },
  { 'habamax/vim-godot' },
  { "nvim-neotest/nvim-nio" }
})

-- old packer config, preserved for posterity
--    -- prereqs
--        use 'nvim-lua/plenary.nvim' -- prerequisite for telesscope.nvim
--
--    -- themes
--        use 'morhetz/gruvbox'
--        use 'lifepillar/vim-gruvbox8'
--        use 'marko-cerovac/material.nvim'
--        use 'andersevenrud/nordic.nvim'
--        use 'folke/tokyonight.nvim'
--        use 'rebelot/kanagawa.nvim'
--        use 'sainnhe/everforest'
--        use 'catppuccin/nvim'
--
--    -- file explorer
--
--    -- buffers
--        use "akinsho/bufferline.nvim"
--
--    -- git
--        use 'lewis6991/gitsigns.nvim'
--        use 'kdheepak/lazygit.nvim'
--
--    -- completion
--        use 'windwp/nvim-autopairs' -- auto closes parentheses
--        use 'windwp/nvim-ts-autotag' -- auto closes tags
--        use 'hrsh7th/nvim-cmp'
--        use 'hrsh7th/cmp-buffer'
--        use 'hrsh7th/cmp-path'
--        use 'hrsh7th/cmp-cmdline'
--        use 'hrsh7th/cmp-nvim-lsp'
--        use 'saadparwaiz1/cmp_luasnip'
--
--    -- lsp
--        use 'neovim/nvim-lspconfig'
--
--    -- syntax
--        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- syntax highlighting for all languages
--        use 'p00f/nvim-ts-rainbow' -- different colours for matching parentheses
--
--    -- markdown
--        -- use {"ellisonleao/glow.nvim"}
--        -- use {"davidgranstrom/nvim-markdown-preview"}
--        use "iamcco/markdown-preview.nvim"
--
--    -- terminal
--        use 'numToStr/FTerm.nvim' -- terminal inside nvim
--
--    -- snippets
--        use 'L3MON4D3/LuaSnip'
--
--    -- fuzzy find
--        use 'nvim-telescope/telescope.nvim'
--        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
--        use 'nvim-telescope/telescope-media-files.nvim'
--
--    -- notes
--    -- utility
--        use 'justinmk/vim-sneak'
--        use 'folke/which-key.nvim'
--        use 'rcarriga/nvim-notify'
--
--    -- debugging
--        use 'mfussenegger/nvim-dap'
--        use 'rcarriga/nvim-dap-ui'
--        use 'theHamsta/nvim-dap-virtual-text'
--    -- tabline
--    -- statusline
--    -- languages
--    -- motion
--    -- editing support
--        use 'tpope/vim-commentary' -- add and remove comments
--
--    -- formatting
--    -- icons
--        use 'kyazdani42/nvim-web-devicons'
--
--    -- tmux
--        use 'christoomey/vim-tmux-navigator'
--
--    -- godot
--        use 'habamax/vim-godot'
