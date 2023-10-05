return require('packer').startup(function(use)
	----------------------
	-- Core Plugins
	----------------------
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use({"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}}})
	use {
		"nvim-treesitter/nvim-treesitter", 
		run = function()
			pcall(require("nvim-treesitter.install").update{ with_sync = true})
		end,
	}
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}
	-- use { 'nvim-treesitter/playground' }
	use "tpope/vim-surround"
	
	----------------------
	-- Git Related Plugins
	----------------------
	-- use "tpope/vim-fugitive"
	use "tpope/vim-rhubarb"
	use "lewis6991/gitsigns.nvim"
	use "airblade/vim-gitgutter"

  ----------------------
  -- UI Related Plugins
  ----------------------
  -- use "navarasu/onedark.nvim"
  use "morhetz/gruvbox"
  -- use "shaunsingh/nord.nvim"
  use "nvim-lualine/lualine.nvim"

  -- TODO: Update to indent blankline v3
  -- Note For packer to work, nvim shall be closed and :PackerSync shall be run
  use {"lukas-reineke/indent-blankline.nvim", 
    commit = "9637670"
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup()
  end
  }

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

	-- LSP Related Plugins
	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = { 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	
--	use { -- Autocompletion
--		'hrsh7th/nvim-cmp',
--		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
--	}
	use "lervag/vimtex"

	use {'github/copilot.vim', branch = 'release' }
	
	--  Commenting
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}
	-- TODO Comment
	use "folke/todo-comments.nvim"
	

	use 'mbbill/undotree'
	-- use 'ThePrimeagen/vim-be-good'
end)

