function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local handle = io.popen('echo $HOME')
local output = handle:read('*a')
local home = output:gsub('[\n\r]', '')
handle:close()

-- the local home variable records the home directory of the user

function build()
	if file_exists(home.."/psu/bin/myc") then
		return "<Esc>:w<CR>:!myc <C-R>% <CR>"
	else
		return "<Esc>:w<CR>:!gcc <C-R>% -lm<CR>"
	end
end

vim.keymap.set('i', '<F3>', build(), {noremap = true})
-- vim.keymap.set('i', '<F3>', '<Esc>:w<CR>:!gcc <C-R>% -lm<CR>', {noremap = true}) -- -w to hide warnings
vim.keymap.set('n', '<F3>', ':!./a.out<CR>', {noremap = true})
