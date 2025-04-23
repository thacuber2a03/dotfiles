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

			local opts = { noremap = true, silent = true }
			local function map(mode, lhs, rhs)
				vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
			end

			-- Move to previous/next
			map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
			map('n', '<A-.>', '<Cmd>BufferNext<CR>')
			-- Re-order to previous/next
			map('n', '<C-,>', '<Cmd>BufferMovePrevious<CR>')
			map('n', '<C-.>', '<Cmd>BufferMoveNext<CR>')

			map('n', '<A-x>', '<Cmd>BufferDelete<CR>')
		end,
		version = '^1.0.0',
	}
}
