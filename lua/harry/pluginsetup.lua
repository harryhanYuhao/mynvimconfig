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
  -- Improve Usability
  ----------------------
	use 'mbbill/undotree'
	--  Commenting
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}
	-- TODO Comment
	use "folke/todo-comments.nvim"

  ----------------------
  -- Git Related Plugins
  ----------------------
  -- use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use "lewis6991/gitsigns.nvim"

  ----------------------
  -- UI Related Plugins
  ----------------------
  -- use "navarasu/onedark.nvim"
  use "morhetz/gruvbox"
  -- use "shaunsingh/nord.nvim"
  use {"nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          icons_enabled = false,
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  }

  -- TODO: Update to indent blankline v3
  -- Note For packer to work, nvim shall be closed and :PackerSync shall be run
  use {"lukas-reineke/indent-blankline.nvim", 
    commit = "9637670",
    -- config for version 2 (in use)
    config = function()
      require('indent_blankline').setup {
        char = '┊',
        show_trailing_blankline_indent = false,
      }
    end,
    -- config for version 3
    -- config = function()
    --   require "ibl".setup()
    --   require "ibl".update({
    --     indent = { char = "┊" },
    --   })
    -- end,
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
		tag = "v2.*", 
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

  -- use {
  -- "williamboman/mason.nvim",
  -- config = function()
  --   require("mason").setup({
  --     ui = {
  --       icons = {
  --         package_installed = "✓",
  --         package_pending = "➜",
  --         package_uninstalled = "✗"
  --       }
  --     }
  --   })
  -- end
  -- }



  -- Latex
	use "lervag/vimtex"

  use {'github/copilot.vim', 
    branch = 'release' ,
    config = function()
      vim.cmd[[let g:copilot_filetypes={
                  \'cpp': v:false,
                  \'c': v:false,
                  \'haskell': v:false,
                  \'py': v:true,
                  \'markdown': v:true,
                  \'txt': v:true,
                  \}]]
    end,
  }

	
end)

