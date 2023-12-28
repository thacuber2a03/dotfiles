local common = require 'core.common'
local config = require 'core.config'
local style = require 'core.style'

config.ignore_files = {}
config.indent_size = 2
config.tab_type = "hard"

-- style.margin.tab.top = 3

---[[
do
	pcall(require, 'plugins.wal')
	if next(config.plugins.wal) then
		local wal = config.plugins.wal
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
		wal.syntax_colors["label"] = 3
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
		wal.syntax_colors["define"] = 5
		wal.syntax_colors["exception"] = 2
		wal.syntax_colors["include"] = 4
		wal.syntax_colors["keyword.function"] = 3
		wal.syntax_colors["keyword.return"] = 1
		wal.syntax_brightness["keyword.return"] = 1.5
		wal.syntax_colors["namespace"] = 1
		wal.syntax_colors["preproc"] = 3
		wal.syntax_colors["repeat"] = 3
		wal.syntax_colors["type.qualifier"] = 1
		wal.syntax_colors["storageclass.lifetime"] = 2

		wal.brightness.background = 0.7
		wal.brightness.background2 = 0.6
		wal.brightness.background3 = 0.5
		wal.syntax_colors["text"] = 7
		wal.syntax_colors["comment"] = 8
		wal.syntax_colors["number"] = 3
		wal.syntax_colors["string"] = 2
		wal.syntax_colors["literal"] = 6
		wal.colors.line_number = 8
		wal.colors.line_number2 = 8

		local command = require 'core.command'
		command.perform "wal:apply"
	end
end
--]]

do -- lsp
	local lspconfig = require 'plugins.lsp.config'

	lspconfig.rust_analyzer.setup()

	lspconfig.solargraph.setup()
end

--[[
do -- lspkind
	local lspkind = require 'plugins.lspkind'
	lspkind.setup {
		font_raw = renderer.font.load(USERDIR .. "/fonts/icon-nerd-font.ttf", 15 * SCALE),
	}
end
--]]

do -- lsp_snippets
	local lsp_snippets = require 'plugins.lsp_snippets'
	lsp_snippets.add_paths { USERDIR .. "/snippets/snippets" }
end

do -- nerdicons
	config.plugins.nerdicons.extension_icons = {
		[".moon"] = { "#405af0" , '' },
		[".asm"] = { "#cccccc", '' },
	}
end

--[[
if config.plugins.build then
	config.plugins.build.terminal = "kitty"
	config.plugins.build.shell = "fish"
end
--]]

--[[
do -- opacity
	local command = require 'core.command'
	command.perform "opacity:reset"
	command.perform "opacity:decrease"
	command.perform "opacity:toggle-mouse-wheel-use"
end
--]]

if style.visu then
	--config.plugins.visu.barsNumber = 20
	style.visu.bars = { common.color "rgba(255, 255, 255, 0.15)" }
end


if config.plugins.lsp_lua then
	config.plugins.lsp_lua.settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				userThirdParty = {
					common.home_expand "~/.local/bin/luaaddons",
				},
			},
		},
	}
end
