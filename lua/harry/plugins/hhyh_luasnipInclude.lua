M= {} 

my_LuaSnipBuffer = {{"a", "b"}, "temp Table2"}
M.my_LuaSnipBuffer = my_LuaSnipBuffer

function toTextNode(list) 
	local textNode = {}
	for i, v in pairs(list) do
		textNode[i] = t(v)
	end
	return textNode
end
M.toTextNode = toTextNode

function scandir()
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('find')
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end
M.scandir = scandir

function findPictureFiles()
	local all_files = scandir() 
	local picture_files = {}
	for k, v in pairs(all_files) do
		if string.match(v, "%.png$") 
			or string.match(v, "%.jpg$")
			or string.match(v, "%.jpeg") then
			table.insert(picture_files, v)
		end
	end
	return picture_files
end 
M.findPictureFiles = findPictureFiles

return M
