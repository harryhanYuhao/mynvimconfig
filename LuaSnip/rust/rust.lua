return {
	s(
		{
			trig = 'pr',
			desr = 'println!',
		},
		{
			t({ "println!(\"{}\"," }), i(1),
			t({ ");" }),
		}
	),
	s(
		{
			trig = 'whle',
			desr = 'while let Some()',
		},
		fmt(
			[[
		while let Some(<>) = <> {	
			<>
		}
		]],
			{
				i(1), i(2), i(0),
			},
			{ delimiters = "<>" }
		)
	),
}
