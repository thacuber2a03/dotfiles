return {
	{ "romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			animation = true,
			clickable = true,
			sidebar_filetypes = {
				-- Or, specify the text used for the offset:
				undotree = {text = 'undotree'},
				-- Or, specify the event which the sidebar executes when leaving:
				['neo-tree'] = {event = 'BufWipeout'},
			},
		},
		config = function(o)
			require 'barbar' .setup(o)

			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Move to previous/next
			map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
			map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
			-- Re-order to previous/next
			map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
			map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
		end,
		version = '^1.0.0',
	}
}
