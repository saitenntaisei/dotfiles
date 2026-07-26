return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"astro",
			"bash",
			"css",
			"go",
			"gomod",
			"html",
			"json",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"terraform",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)
				if not lang then
					return
				end
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}
