local set = vim.opt
local tabwidth = 2
set.tabstop = tabwidth
set.shiftwidth = tabwidth
set.expandtab = false
set.autoindent = true
set.smartindent = true
set.cindent = false
set.relativenumber = true
set.runtimepath:prepend("/home/thacuber2a03/.opam/5.1.1+options/ocp-indent/vim")

local opts = { silent = true, noremap = true }
local map = function(mode, lhs, rhs) vim.api.nvim_set_keymap(mode, lhs, rhs, opts) end
map('n', "<leader>t", ":sp<CR><C-w>j:term<CR>i")
map('n', "<leader>T", ":vs<CR><C-w>l:term<CR>i")

return {
	"marekmaskarinec/vim-umka",
	"lluchs/vim-wren",
	"Olical/conjure",
	{ 'clojure-vim/vim-jack-in',
		dependencies = {
			'radenling/vim-dispatch-neovim',
			'tpope/vim-dispatch',
		},
	},
	"jaawerth/fennel.vim",
	"tpope/vim-repeat",
	{ "tpope/vim-sexp-mappings-for-regular-people",
		dependencies = {
			"guns/vim-sexp",
		},
	},
	"leafo/moonscript-vim",
	
	"nvim-treesitter/playground",
}
