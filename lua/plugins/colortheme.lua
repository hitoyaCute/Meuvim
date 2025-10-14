-- lua/meuvim/plugins/colorscheme.lua
-- MeuVim Tokyonight Colorscheme + Background Transparency Toggle

local function apply_colorscheme(is_transparent)
	vim.cmd "hi clear"
	if vim.fn.exists "syntax_on" then
		vim.cmd "syntax reset"
	end
	vim.g.colors_name = "tokyonight"

	local colors = {
		bg = "#1a1b26",
		bg_dark = "#16161e",
		bg_highlight = "#292e42",
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		comment = "#565f89",

		cyan = "#7dcfff",
		blue = "#7aa2f7",
		magenta = "#bb9af7",
		purple = "#9d7cd8",
		red = "#f7768e",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
	}

	local bg_normal = is_transparent and "none" or colors.bg
	local bg_dark = is_transparent and "none" or colors.bg_dark

	local highlights = {
		Normal = { fg = colors.fg, bg = bg_normal },
		NormalNC = { fg = colors.fg_dark, bg = bg_dark },
		NormalFloat = { fg = colors.fg, bg = bg_dark },
		FloatBorder = { fg = colors.fg_gutter, bg = bg_dark },
		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.cyan },
		String = { fg = colors.green },
		Character = { fg = colors.orange },
		Number = { fg = colors.orange },
		Boolean = { fg = colors.orange },
		Identifier = { fg = colors.blue },
		Function = { fg = colors.cyan },
		Statement = { fg = colors.magenta },
		Conditional = { fg = colors.magenta },
		Repeat = { fg = colors.magenta },
		Operator = { fg = colors.purple },
		Keyword = { fg = colors.purple },
		Exception = { fg = colors.red },
		PreProc = { fg = colors.yellow },
		Type = { fg = colors.yellow },
		Special = { fg = colors.orange },
		Underlined = { underline = true },
		Todo = { fg = colors.magenta, bold = true },
		Error = { fg = colors.red, bold = true },
		Pmenu = { fg = colors.fg, bg = colors.bg_highlight },
		PmenuSel = { fg = colors.bg, bg = colors.blue, bold = true },
		Visual = { bg = colors.bg_highlight },
		Search = { fg = colors.bg, bg = colors.yellow },
		IncSearch = { fg = colors.bg, bg = colors.orange },
		StatusLine = { fg = colors.fg, bg = colors.bg_highlight },
		StatusLineNC = { fg = colors.comment, bg = colors.bg_dark },
		VertSplit = { fg = colors.bg_highlight },
		LineNr = { fg = colors.fg_gutter },
		CursorLineNr = { fg = colors.yellow, bold = true },
		CursorLine = { bg = colors.bg_highlight },
		SignColumn = { bg = bg_normal },
		DiffAdd = { bg = "#283b4d" },
		DiffChange = { bg = "#272d43" },
		DiffDelete = { bg = "#3f2d3d" },
		DiffText = { bg = "#394b70" },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

-- Keep track of transparency state
local transparent_enabled = false

-- Toggle function
local function toggle_transparency()
	transparent_enabled = not transparent_enabled
	apply_colorscheme(transparent_enabled)
	vim.notify(
		"MeuVim background: " .. (transparent_enabled and "Transparent 🪟" or "Opaque 🌑"),
		vim.log.levels.INFO,
		{ title = "MeuVim" }
	)
end

-- Keymap for toggling background
vim.keymap.set("n", "<leader>bgt", toggle_transparency, { desc = "Toggle background transparency" })

-- Plugin registration (for lazy.nvim)
return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			apply_colorscheme(true) -- Start with opaque background
		end,
	},
}
