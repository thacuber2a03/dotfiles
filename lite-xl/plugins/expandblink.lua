--mod-version:3
local core = require 'core'
local common = require 'core.common'
local config = require 'core.config'
local ime = require 'core.ime'
local style = require 'core.style'
local DocView = require 'core.docview'

-- the alignment thing wasn't really a good idea from the start

config.plugins.expandblink = common.merge({
	--alignment = "center",
	period = "half",
	config_spec = {
		name = "Expand Blink",
		--[[
		{
			label = "Alignment",
			description = "Where the caret shrinks towards.",
			path = "alignment",
			type = "selection",
			default = "center",
			values = {
				{ "Top",    "top"    },
				{ "Center", "center" },
				{ "Bottom", "bottom" },
			},
		},
		--]]
		{
			label = "Period Length",
			description = "How long the caret takes to blink.",
			path = "period",
			type = "selection",
			default = "half",
			values = { -- maybe change to boolean?
				{ "Half",  "half"  },
				{ "Whole", "whole" },
			},
		},
	},
}, config.plugins.expandblink)

function DocView:draw_overlay()
	if core.active_view == self then
		local minline, maxline = self:get_visible_line_range()
		-- draw caret if it overlaps this line
		for _, line1, col1, line2, col2 in self.doc:get_selections() do
			if line1 >= minline and line1 <= maxline
			and system.window_has_focus() then
				if ime.editing then
					self:draw_ime_decoration(line1, col1, line2, col2)
				else
					if not config.disable_blink then
						self:draw_caret(self:get_line_screen_position(line1, col1))
					end
				end
			end
		end
	end
end

local phaseShift = math.sqrt(2)/2

function DocView:draw_caret(x, y)
	local t = ((core.blink_timer - core.blink_start) % config.blink_period) / config.blink_period
	local halfP = config.plugins.expandblink.period == "half"
	if halfP and t < 0.5 then t = 1
	else
		t = 0.5+math.cos(t/(0.25 * (halfP and 1 or 2))*math.pi-(halfP and 0 or phaseShift))*0.5
		core.redraw = true
	end

	local lh = self:get_line_height()
	local h = common.lerp(0, lh, t)

	--[[
	local alignment = config.plugins.expandblink.alignment
	local dy = y
	if alignment == "center" then
		dy = y+lh/2-h/2
	elseif alignment == "bottom" then
		dy = (y+lh)-h
	end
	renderer.draw_rect(x, dy, style.caret_width, h, style.caret)
	--]]
	renderer.draw_rect(x, y+lh/2-h/2, style.caret_width, h, style.caret)
end
