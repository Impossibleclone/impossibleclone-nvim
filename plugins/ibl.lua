return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        -- 1. Define the custom highlight groups
        local highlight = {
            "color0",
            "color1",
            "color2",
            "color0",
            "color1",
            "color2",
            "color0",
        }

        local hooks = require("ibl.hooks")
        
        -- 2. Create the colors (based on standard OneDark/catppuccin palettes)
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "color0", { fg = "#7f8cbe" })
            vim.api.nvim_set_hl(0, "color1", { fg = "#b4befe" })
            vim.api.nvim_set_hl(0, "color2", { fg = "#89b4fa" })
            vim.api.nvim_set_hl(0, "color0", { fg = "#7f8cbe" })
            vim.api.nvim_set_hl(0, "color1", { fg = "#b4befe" })
            vim.api.nvim_set_hl(0, "color2", { fg = "#89b4fa" })
            vim.api.nvim_set_hl(0, "color0", { fg = "#7f8cbe" })
        end)

        -- 3. Setup with the defined list
        require("ibl").setup({ 
            indent = { highlight = highlight } 
        })
    end,
}
