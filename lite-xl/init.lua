do -- config
	local config = require 'core.config'
	config.ignore_files = {}
	config.indent_size = 2
	config.tab_type = "hard"
end

do
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
