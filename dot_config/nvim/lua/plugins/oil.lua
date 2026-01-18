return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			keymaps = {
				["<C-j>"] = "actions.select", -- dive into the entry under cursor
				["<C-k>"] = "actions.parent", -- jump to parent directory
                ["<C-n>"] = "actions.refresh", -- refresh the tree
			},
		})
		vim.keymap.set("n", "<C-n>", require("oil").open)
	end,
}
