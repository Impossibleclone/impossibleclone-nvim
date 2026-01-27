return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                },
            },
            
            filesystem = {
                hijack_netrw_behaviour = "open_current",
                use_libuv_file_watcher = true,
                
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true, 
                },
                
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            
            git_status = {
                window = {
                    position = "float",
                },
            },
        })

        -- Keymap
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
    end,
}
