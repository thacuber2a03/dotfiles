return { "rcarriga/nvim-notify",
	opts = {
		background_colour = "#000000",
	},
	init = function()
		vim.opt.termguicolors = true
	end,
	config = function(opts)
		local notify = require 'notify'
		notify.setup(opts)
		vim.notify = notify
	end,
}
