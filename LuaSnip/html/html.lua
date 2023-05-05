return{
	s(
		{trig="init", name="init html"},
		fmt(
			[[
			<!DOCTYPE html>
			<html>
			{}
			</html>
			]],
			{i(0)},{}
		)
	),
	s(
		{
			trig = "<(.*)>",
			dscr = "html tag",
			regTrig = true,
		},
		fmt(
			[[
			<{}>{}</{}>
			]],
			{
				f(function(args, snip) return
					snip.captures[1] end,{}),
				i(0),
				f(function(args, snip) return
					snip.captures[1] end,{}),
			},
			{}
		)
	),
	s(
		{
			trig = "<!--",
			dscr = "comment",
		},
		fmt(
			[[
			{}{}{}
			]],
			{
				t"<!--",
				i(0),
				t"-->"
			},
			{}
		)
	),
}
