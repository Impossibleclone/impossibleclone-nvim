return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local alpha = require("alpha")

        dashboard.section.header.val = {
            [[   _                               _ _     _           _                       _   _       _             ]],
            [[  (_)_ __ ___  _ __   ___  ___ ___(_) |__ | | ___  ___| | ___  _ __   ___     | \ | |_   _(_)_ __ ___    ]],
            [[  | | '_ ` _ \| '_ \ / _ \/ __/ __| | '_ \| |/ _ \/  _| |/ _ \| '_ \ / _ \____|  \| \ \ / / | '_ ` _ \   ]],
            [[  | | | | | | | |_) | (_) \__ \__ \ | |_) | |  __/| |_| | (_) | | | |  __/____| |\  |\ V /| | | | | | |  ]],
            [[  |_|_| |_| |_| .__/ \___/|___/___/_|_.__/|_|\___|\___|_|\___/|_| |_|\___|    |_| \_| \_/ |_|_| |_| |_|  ]],
            [[              |_|                                                                                        ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("o", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "  > Config", ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
            dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
        }

        local version = vim.version()
        dashboard.section.footer.val = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

        dashboard.config.layout = {
            { type = "padding", val = 12 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            command = "setlocal nofoldenable",
        })
    end,
}
