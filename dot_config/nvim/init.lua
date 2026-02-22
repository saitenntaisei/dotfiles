if vim.g.neovide then
	vim.g.neovide_transparency = 0.9
end
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")
