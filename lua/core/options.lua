vim.wo.number = true -- make like numbers show
vim.o.relativenumber = false
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = "a"
vim.o.autoindent = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.showmode = true

local python_path = "/home/hitoya/anaconda3/bin/python"

vim.lsp.config("pyright", {
	settings = {
		python = {
			pythonPath = python_path,
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})
