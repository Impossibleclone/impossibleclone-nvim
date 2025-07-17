return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                hijack_netrw_behaviour = "open_current",

            },
        })
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
    end,
}
