return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                section_separators = { left = '', right = '' },
                component_separators = { left = '\\', right = '/' },

                { fmt = string.lower },
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end, separator = { left = ' ⏽ ', right = '' }, component_separators = { right = '⏽', left = '' }, right_padding = 2 } },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { { 'location', separator = { right = ' ⏽ ', left = '' }, left_padding = 2 } },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = { { 'lsp_status', separator = { left = ' ⏽ ', right = '◤' }, component_separators = { right = '⏽', left = '◥' }, right_padding = 2 } },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { { 'filesize', separator = { right = ' ⏽ ', left = '◥' }, left_padding = 2 } },
            },
            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = { 'filetype' }
            -- },
            --
            -- inactive_winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- },
        })
    end,
}
