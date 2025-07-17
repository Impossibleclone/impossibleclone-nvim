return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                else
                    return 10 -- Fallback size
                end
            end,
            start_in_insert = true,
            border = 'shadow',
            -- winblend = 3,
        }
    end,
}
