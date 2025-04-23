local flavour = "mocha"

return { "catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	opts = {
		flavour = flavour, -- latte, frappe, macchiato, mocha
		background = { -- :h background
			dark = flavour,
			light = "latte",
		},
		transparent_background = true, -- disables setting the background color.
		show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
		term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = true, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = { "bold" },
			keywords = {},
			strings = { "italic" },
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			alpha = true,
			barbar = true,
			cmp = true,
			coc_nvim = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
			neotree = true,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
			-- For more plugins integrations check (https://github.com/catppuccin/nvim#integrations)
		},
	},
	init = function()
		vim.opt.termguicolors = true
		vim.api.nvim_set_hl(0, "Normal", {guibg=nil, ctermbg=nil})
	end,
	config = function(opts)
		vim.cmd.colorscheme "catppuccin"
	end,
}
