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
