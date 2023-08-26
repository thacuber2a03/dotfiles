local common = require 'core.common'
local config = require 'core.config'
local style = require 'core.style'

config.ignore_files = {}
config.indent_size = 2
config.tab_type = "hard"

config.plugins.tetris.cell_size = 12

style.margin.tab.top = 3

---[[
do -- wal.lxl
	local wal = config.plugins.wal
	if wal.syntax_colors then
		-- evergreen shit (this took too much)
		style.syntax.error = { common.color "#ff0000" }
		wal.syntax_colors["field"] = 1
		wal.syntax_brightness["field"] = 1.1
		wal.syntax_colors["punctuation.brackets"] = 3
		wal.syntax_colors["punctuation.delimiter"] = 3
		wal.syntax_colors["variable"] = 6
		wal.syntax_colors["boolean"] = 2
		wal.syntax_colors["constant"] = 4
		wal.syntax_colors["float"] = 4
		wal.syntax_colors["label"] = 2
		wal.syntax_colors["method.call"] = 5
		wal.syntax_colors["function.call"] = 1
		wal.syntax_brightness["function.call"] = 1.8
		wal.syntax_colors["function.macro"] = 3
		wal.syntax_brightness["function.macro"] = 1
		wal.syntax_colors["method"] = 5
		wal.syntax_colors["type"] = 1
		wal.syntax_colors["type.builtin"] = 1
		wal.syntax_brightness["type.builtin"] = 1.5
		wal.syntax_colors["variable.builtin"] = 4
		wal.syntax_colors["type.definition"] = 2
		wal.syntax_colors["definition"] = 2
		wal.syntax_colors["conditional.ternary"] = 1
		wal.syntax_colors["keyword.operator"] = 1
		wal.syntax_brightness["keyword.operator"] = 1.5
		wal.syntax_colors["punctuation.special"] = 2
		wal.syntax_colors["storageclass"] = 2
		wal.syntax_colors["constant.builtin"] = 4
		wal.syntax_colors["attribute"] = "cursor"
		wal.syntax_colors["conditional"] = 1
		wal.syntax_colors["define"] = 4
		wal.syntax_colors["exception"] = 2
		wal.syntax_colors["include"] = 4
		wal.syntax_colors["keyword.function"] = 3
		wal.syntax_colors["keyword.return"] = 1
		wal.syntax_brightness["keyword.return"] = 1.5
		wal.syntax_colors["namespace"] = 1
		wal.syntax_colors["preproc"] = 2
		wal.syntax_colors["repeat"] = 1
		wal.syntax_colors["type.qualifier"] = 1
		wal.syntax_colors["storageclass.lifetime"] = 2

		local command = require 'core.command'
		command.perform "wal:apply"
	end
end
--]]

do -- treeview
	local treeview = require 'plugins.treeview'
	treeview.visible = false
end

do -- lspconfig
	local lspconfig = require 'plugins.lsp.config'
	lspconfig.sumneko_lua.setup {
		command = { HOME .. "/.local/bin/luals/bin/lua-language-server" },
		settings = {
			Lua = {
				workspace = {
					library = {
						DATADIR, USERDIR
					},
				},
			},
		},
	}

	lspconfig.clangd.setup {
		command = { "clangd-15", "-background-index" },
	}

	lspconfig.rust_analyzer.setup()

	lspconfig.solargraph.setup()
end

do -- lspkind
	local lspkind = require 'plugins.lspkind'
	lspkind.setup {
		font_raw = renderer.font.load(USERDIR .. "/fonts/icon-nerd-font.ttf", 15 * SCALE),
	}
end

do -- lsp_snippets
	local lsp_snippets = require 'plugins.lsp_snippets'
	lsp_snippets.add_paths { USERDIR .. "/snippets/snippets" }
end

--[[
do -- sticky_scroll
	local common = require 'core.common'
	local SS = require 'plugins.sticky_scroll'
	config.plugins.sticky_scroll.filetype_overrides = common.merge(
		{
			["Lua"] = SS.get_indent_ignore_open_bracket,
		},
		config.plugins.sticky_scroll.filetype_overrides
	)
end
--]]
