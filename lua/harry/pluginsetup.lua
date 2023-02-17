return require('packer').startup(function(use)
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

	-- Git Related Plugins
	use "tpope/vim-fugitive"
	use "tpope/vim-rhubarb"
	use "lewis6991/gitsigns.nvim"
	use "airblade/vim-gitgutter"

	-- Colorschemes
	use "navarasu/onedark.nvim"
	use "morhetz/gruvbox"
	use "shaunsingh/nord.nvim"

	use "nvim-lualine/lualine.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "tpope/vim-surround"
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}


	-- LSP Related Plugins
	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = { 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwiz1/cmp_luasnip'
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formattersuse
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis 
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters 
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use "lervag/vimtex"
	use "SirVer/ultisnips"
	
--  Commenting
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}	
end)

