-- TODO does it support copilot?
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
	-- use "navarasu/onedark.nvim"
	use "morhetz/gruvbox"
	-- use "shaunsingh/nord.nvim"

	use "nvim-lualine/lualine.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "tpope/vim-surround"
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}

	use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
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
	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	  config = function()
	    require("todo-comments").setup {
	      -- your configuration comes here
	      -- or leave it empty to use the default settings
	      -- refer to the configuration section below
				signs = true, -- show icons in the signs column
			  sign_priority = 12, -- sign priority
				  gui_style = {
				    fg = "BOLD", -- The gui style to use for the fg highlight group.
				    bg = "BOLD", -- The gui style to use for the bg highlight group.
				  },
				highlight = {
			    multiline = false, -- enable multine todo comments
			    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			    before = "fg", -- "fg" or "bg" or empty
			    keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			    after = "fg", -- "fg" or "bg" or empty
			    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
			    comments_only = true, -- uses treesitter to match keywords in comments only
			    max_line_len = 100, -- ignore lines longer than this
			    exclude = {}, -- list of file types to exclude highlighting
			  },
	    }
	  end
	}
end)

