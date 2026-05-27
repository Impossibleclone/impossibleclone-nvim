return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle UndoTree" },
    },
    config = function()
        local undotree = require("undotree")

        undotree.setup({
            float_diff = true,
            layout = "left_bottom", -- alternatives: "left_left_bottom"
            position = "right", -- or "right", "bottom"
            ignore_filetype = {
                "undotree",
                "undotreeDiff",
                "qf",
                "TelescopePrompt",
                "spectre_panel",
                "tsplayground",
            },
            window = {
                winblend = 30,
            },
            keymaps = {
                ["move_next"] = "j",
                ["move_prev"] = "k",
                ["move2parent"] = "gj",
                ["move_change_next"] = "J",
                ["move_change_prev"] = "K",
                ["action_enter"] = "<cr>",
                ["enter_diffbuf"] = "p",
                ["quit"] = "q"
            },
        })
    end,
}
