return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		},
		inlay_hints = {
			enabled = true,
		},
	},
	config = function(_, opts)
		vim.diagnostic.config(opts.diagnostics)
		vim.lsp.inlay_hint.enable(opts.inlay_hints.enabled)
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
		})
	end,
}
