return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local alpha = require("alpha")

        dashboard.section.header.val = {
            [[                                                                                                         ]],
            [[   _                               _ _     _           _                       _   _       _             ]],
            [[  (_)_ __ ___  _ __   ___  ___ ___(_) |__ | | ___  ___| | ___  _ __   ___     | \ | |_   _(_)_ __ ___    ]],
            [[  | | '_ ` _ \| '_ \ / _ \/ __/ __| | '_ \| |/ _ \/  _| |/ _ \| '_ \ / _ \____|  \| \ \ / / | '_ ` _ \   ]],
            [[  | | | | | | | |_) | (_) \__ \__ \ | |_) | |  __/| |_| | (_) | | | |  __/____| |\  |\ V /| | | | | | |  ]],
            [[  |_|_| |_| |_| .__/ \___/|___/___/_|_.__/|_|\___|\___|_|\___/|_| |_|\___|    |_| \_| \_/ |_|_| |_| |_|  ]],
            [[              |_|                                                                                        ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  > Find file", ":cd $HOME/prgm/ | Telescope find_files<CR>"),
            dashboard.button("fo", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "  > Config", ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
            dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
    end,
}
