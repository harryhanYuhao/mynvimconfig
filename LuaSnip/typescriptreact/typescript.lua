local filename = vim.fn.expand("%:t:r")
return{
	s(
		{
			trig = "rafce",
			desc = "React Arrow Function Component",
		}, 
		{
			t({"import React from 'react';", ""}),
			t({"const " .. filename .. " = () => {", ""}),
			t({"  return (", ""}),
			t({"    <div>",""}),
			t({"      <h1>" .. filename .. "</h1>",""}),
			t({"    </div>",""}),
			t({"  )",""}),
			t({"};", ""}),
			t({""}),
			t({"export default " .. filename .. ";"}),
		}
	),
}
