return require('packer').startup(function(use) 
    -- packer
        use 'wbthomason/packer.nvim' -- package manager

    -- prereqs
        use 'nvim-lua/plenary.nvim' -- prerequisite for telesscope.nvim

    -- themes
        use 'morhetz/gruvbox'
        use 'lifepillar/vim-gruvbox8'
        use 'marko-cerovac/material.nvim'
        use 'andersevenrud/nordic.nvim'
        use 'folke/tokyonight.nvim'
        use 'rebelot/kanagawa.nvim'
        use 'sainnhe/everforest'
        use 'catppuccin/nvim'

    -- file explorer

    -- buffers
        use "akinsho/bufferline.nvim"

    -- git
        use 'lewis6991/gitsigns.nvim'
        use 'kdheepak/lazygit.nvim'

    -- completion
        use 'windwp/nvim-autopairs' -- auto closes parentheses
        use 'windwp/nvim-ts-autotag' -- auto closes tags
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'

    -- lsp
        use 'neovim/nvim-lspconfig'

    -- syntax
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- syntax highlighting for all languages
        use 'p00f/nvim-ts-rainbow' -- different colours for matching parentheses

    -- markdown
        -- use {"ellisonleao/glow.nvim"}
        -- use {"davidgranstrom/nvim-markdown-preview"}

    -- terminal
        use 'numToStr/FTerm.nvim' -- terminal inside nvim

    -- snippets
        use 'L3MON4D3/LuaSnip'

    -- fuzzy find
        use 'nvim-telescope/telescope.nvim'
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
        use 'nvim-telescope/telescope-media-files.nvim'

    -- notes
    -- utility
        use 'justinmk/vim-sneak'
        use 'folke/which-key.nvim'
        use 'rcarriga/nvim-notify'

    -- debugging
    -- tabline
    -- statusline
    -- languages
    -- motion
    -- editing support
        use 'tpope/vim-commentary' -- add and remove comments

    -- formatting
    -- icons
        use 'kyazdani42/nvim-web-devicons'

    -- tmux
        use 'christoomey/vim-tmux-navigator'

    -- godot
        use 'habamax/vim-godot'
end)
