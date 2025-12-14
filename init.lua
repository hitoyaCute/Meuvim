-- Add at the very top for faster startup
vim.loader.enable()


local base_dir = vim.env.MEUVIM_BASE_DIR
  or (function()
    local init_path = debug.getinfo(1, "S").source
    return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
  end)()

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:prepend(base_dir)
end

require("_lazy")
require("core.options")
require("core.keymaps")
require("core.snippets")




require("lazy").setup({
	-- editing
	require("plugins.lsp"),
	require("plugins.which-key"),
	require("plugins.none-ls"),
	require("plugins.autocompletion"),
	require("plugins.avante"),

	-- navigation
	require("plugins.telescope"),
	require("plugins.neotree"),

	-- Aesthetics
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.colortheme"),
	require("plugins.indent-blankline"),
	require("plugins.alpha"),
	require("plugins.gitsigns"),
	
	-- require("plugins.mini-animate"),


	-- other
	require("plugins.neocord"),
	require("plugins.misc"),
	-- require("plugins.java"),

})


require("core.conf.pyright")
require("core.conf.jdtls")
require("core.conf.clangd")









