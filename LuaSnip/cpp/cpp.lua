return{
	s({trig='init'},
		{
			t({
				"#include <iostream>",
				"#include <vector>",
				"",
				"int main() {//int argc, char *argv[]",
				""
				}),
			t({"    "}), i(0),
			t({ "",
				"	return 0;",
				"}"
			}), 
		}
	),
	s({trig='pf'},
		{
			t({"printf(\"%"}), i(1), 
			t({"\\n\", "}), i(0),
			t({");"}), 
		}
	),
	s({trig="fori"},
		{
			t({"for (int i = 0; i < "}), i(1),
			t({"; i++){", ""}),
			t({"\t"}), i(0),
			t({	"",
				"}"
			}), 
		}
	),
	s({trig="forauto"},
		{
			t({"for (auto i: "}), i(1),
			t({"){", ""}),
			t({"\t"}), i(0),
			t({	"",
				"}"
			}), 
		}
	),
}
