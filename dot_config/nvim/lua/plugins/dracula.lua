return {
	"Mofiqul/dracula.nvim",
	event = "VimEnter",
	config = function()
		vim.cmd([[colorscheme dracula]])
		require("dracula").setup({})
	end,
}
