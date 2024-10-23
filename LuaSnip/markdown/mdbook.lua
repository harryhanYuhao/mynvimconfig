return {
	s({ trig = "link", dscr = "link in <a> with target blank" },
		fmt( -- The snippet code actually looks like the equation environment it produces.
		-- [[ ]] are lua string delimiters
			[[
			<a href="{}" target="_blank">{}</a>
			{}
			]],
			-- The insert node is placed in the <> angle brackets
			{ i(1), i(2), i(0) },
			-- This is where to specify that angle brackets are used as node positions.
			-- To escape delimiter, repeat it twice
			{ delimiters = "{}" }
		)
	),
}
