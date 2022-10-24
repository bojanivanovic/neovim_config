-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
	check_ts = true, -- check for treesitter
	ts_config = { -- treesitter configs for specific languages
		lua = { "" }, -- add treesitter nodes to ignore
		javascript = { "" }
	},
	disable_filetype = { -- disables autopair for specific file types
		"TelescopePrompt" -- disable for Telescope
	},
	fast_wrap = { -- on key press, prompts for placment of closing pair
		map = "<M-e>", -- maps fast wrap to Alt+e
		chars = { -- define chars for which to trigger fast wrap
			"{",
			"[",
			"(",
			'"',
			"'"
		},
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$", -- defines the end key
		keys = "qwertyuiopzxcvbnmasdfghjkl", -- which characters will show up as placement options
		check_comma = true,
		highlight = "PmenuSel", -- which highlight to use for pairs
		highlight_grey = "LineNr"
	}
}

-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--   return
-- end
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

