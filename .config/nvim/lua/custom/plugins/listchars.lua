return {
	{ "fraso-dev/nvim-listchars",
		config = function ()
			require 'nvim-listchars'.setup {
				save_state = true,
				listchars = {
					trail = "-",
					eol = "↲",
					tab = "» ",
					space = "∙",
				},
				exclude_filetypes = {
					"markdown",
				},
				--lighten_step = 10,
			}
		end
	},
}
