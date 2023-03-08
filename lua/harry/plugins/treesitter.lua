local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

treesitter.setup ({
 highlight = {
   enable = true,
 },
 indent = {
   enable = true,
 },
 autotag = {
   enable = true,
 },
 rainbow = {
   enable = true,
   extended_mode = true,
   max_file_lines = 1000,
 },
})

require('nvim-treesitter.configs').setup{
	eusure_installed = {'c', 'cpp', 'go', 'lua', 'python', 'rust', 'help', 'vim', 'java'},
	highlight = {enable = true},
	indent = {enable = true, disable = {'python'}},
	incremental_selection = {
		enalbe = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-backspace>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			[']m'] = '@function.outer',
			[']]'] = '@class.outer',
		},
		goto_next_end = {
			[']M'] = '@function.outer',
			[']['] = '@class.outer',
		},
		goto_previous_start = {
			['[m'] = '@function.outer',
			['[['] = '@class.outer',
		},
		goto_previous_end = {
			['[M'] = '@function.outer',
			['[]'] = '@class.outer',
		},
	},
	swap = {
		enable = true,
		swap_next = {
			['<leader>a'] = '@parameter.inner',
		},
		swap_previous = {
			['<leader>A'] = '@parameter.inner',
		},
	},
	},
}


