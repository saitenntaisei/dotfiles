-- キーマップ設定
local keymap = vim.keymap

-- アンドゥ/リドゥ
keymap.set("n", "<C-z>", "u", { desc = "Undo" })
keymap.set("n", "<C-y>", "<C-r>", { desc = "Redo" })
