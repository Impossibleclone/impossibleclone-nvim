require("impossibleclone-nvim.config.lazy")
require("impossibleclone-nvim.config.keymaps")
require("impossibleclone-nvim.config.options")
-- vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.opt.laststatus = 0
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = 3
            end,
        })
    end,
})
