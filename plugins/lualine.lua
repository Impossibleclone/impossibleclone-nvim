return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function load_lualine()
            package.loaded['lualine.themes.pywal'] = nil
            local custom_theme = require('lualine.themes.pywal')

            local modes = { 'normal', 'insert', 'visual', 'replace', 'command', 'inactive' }
            for _, mode in ipairs(modes) do
                if custom_theme[mode] and custom_theme[mode].c then
                    custom_theme[mode].c.bg = 'NONE'
                end
            end

            require("lualine").setup({
                options = {
                    theme = custom_theme,
                    disabled_filetypes = { "neo-tree", "alpha" },
                    globalstatus = true,
                    icons_enabled = true,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },

                },
                extensions = { 'neo-tree' },
                sections = {
                    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end, right_padding = 0 } },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = {},
                    lualine_y = { 'progress' },
                    lualine_z = { { 'location', left_padding = 0 } },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end

        load_lualine()

        local wal_file = vim.fn.expand("~/.cache/wal/colors.sh")
        local uv = vim.uv or vim.loop

        if vim.fn.filereadable(wal_file) == 1 then
            local watcher = uv.new_fs_event()
            watcher:start(wal_file, {}, vim.schedule_wrap(function(err, fname, status)
                if not err then
                    load_lualine()
                end
            end))
        end

    end,
}
