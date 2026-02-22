return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"go",
				"gomod",
				"gowork",
				"gosum",
				"html",
				"lua",
				"python",
				"rust",
				"terraform",
				"tsx",
				"typescript",
				"yaml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
