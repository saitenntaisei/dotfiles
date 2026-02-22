local api = vim.api

local indent_augroup = api.nvim_create_augroup("IndentSettings", { clear = true })

api.nvim_create_autocmd("FileType", {
    group = indent_augroup,
    pattern = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "vue",
        "json",
        "yaml",
        "html",
    },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
    end,
})
