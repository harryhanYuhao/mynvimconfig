-------
-- WARNING need to run :PackerSync everytime this file is changed
-------
return require('packer').startup(function(use)
	----------------------
	-- Core Plugins
	----------------------
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" } } })
	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				ignore_install = { "latex", "md" },
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn", -- set to `false` to disable one of the mappings
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				textsubjects = {
					enable = true,
					prev_selection = ',', -- (Optional) keymap to select the previous selection
					keymaps = {
						['.'] = 'textsubjects-smart',
						[';'] = 'textsubjects-container-outer',
						['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
					},
				},
			}
		end,
		run = function()
			pcall(require("nvim-treesitter.install").update { with_sync = true })
		end,
		cond = function()
			local filetype = vim.fn.expand('%:e')
			if filetype == 'tex' or filetype == 'md' then
				return false
			else
				return true
			end
		end
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
	use { -- Hopping: mouse alternative
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "t", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "T", ":HopWord<cr>", { silent = true })
		end,

	}
	--  Commenting
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	-- TODO Comment
	use { "folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				signs = true,
				keywords = {
					HACK = { icon = " ", color = "warning", alt = { "DEBUG" } },
				},
				highlight = {
					before = "bg", -- "fg" or "bg" or empty
					keyword = "wide", -- "wide" or "gui" or "guitext"
					after = "fg", -- "fg" or "bg" or empty
				},
			})
		end,
	}
	use {
		'm4xshen/autoclose.nvim',
		config = function()
			require('autoclose').setup()
		end
	}

	----------------------
	-- Git Related Plugins
	----------------------
	-- use "tpope/vim-fugitive"
	-- use "tpope/vim-rhubarb"
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end
	}


	----------------------
	-- UI Related Plugins
	----------------------
	use "navarasu/onedark.nvim"
	use "morhetz/gruvbox"
	use "shaunsingh/nord.nvim"
	use "savq/melange-nvim"
	use { "nvim-lualine/lualine.nvim",

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

	use { "lukas-reineke/indent-blankline.nvim",
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

	use {
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--  Uncomment these if you want to manage the language servers from neovim
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}
	-- Latex
	use "lervag/vimtex"

	use { 'github/copilot.vim',
		branch = 'release',
		config = function()
			vim.cmd [[let g:copilot_filetypes={
		\'cpp': v:false,
		\'c': v:false,
		\'haskell': v:false,
		\'py': v:true,
		\'markdown': v:true,
		\'txt': v:true,
		\}]]
		end,
	}
	use "fatih/vim-go"

	-- Wakatime
	use { 'wakatime/vim-wakatime' }
	-- use { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' }
	use {
		'preservim/vim-markdown',
		ft = 'markdown',
		config = function()
			vim.cmd [[
			let g:vim_markdown_folding_disabled = 1
			" let g:vim_markdown_folding_level = 4
			]]
		end,
	}
end)
