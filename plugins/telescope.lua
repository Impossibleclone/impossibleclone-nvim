return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 
            'nvim-telescope/telescope-fzf-native.nvim', 
            build = 'make' 
        }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate " }, -- Truncate path if too long
                sorting_strategy = "ascending", -- Show top result at top
                layout_config = {
                    horizontal = {
                        -- prompt_position = "top",
                        preview_width = 0.55,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<Esc>"] = actions.close,
                    },
                },
            },
        })

        -- Load the FZF extension
        telescope.load_extension("fzf")
    end,
}
