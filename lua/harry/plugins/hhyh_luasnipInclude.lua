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

function refactoredSearch()
end

M.refactoredSearch = refactoredSearch
return M
