return{
	s({trig='nnn'},
		{
			t({
				"#include <stdio.h>",
				"",
				"int main() {//int argc, char *argv[]",
				""
				}),
			t({"    "}), i(1),
			t({ "",
				"	return 0;",
				"}"
			}), 
		}
	),
	s({trig='pf'},
		{
			t({"printf(\"%"}), i(1), 
			t({"\\n\", "}), i(2),
			t({");"}), 
		}
	),
	s({trig="fori"},
		{
			t({"for (int i = 0; i < "}), i(1),
			t({"; i++){", ""}),
			t({"\t"}), i(2),
			t({	"",
				"}"
			}), 
		}
	),
}
