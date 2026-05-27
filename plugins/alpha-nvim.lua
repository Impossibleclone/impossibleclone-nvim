return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "amansingh-afk/milli.nvim"
    },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local alpha = require("alpha")

        local my_splash = "cactus"

        local splash = require("milli").load({ splash = my_splash })
        dashboard.section.header.val = splash.frames[1]

        -- local secondary_header = {
        --     type = "text",
        --     val = {
        --     [[   _                               _ _     _           _                       _   _       _             ]],
        --     [[  (_)_ __ ___  _ __   ___  ___ ___(_) |__ | | ___  ___| | ___  _ __   ___     | \ | |_   _(_)_ __ ___    ]],
        --     [[  | | '_ ` _ \| '_ \ / _ \/ __/ __| | '_ \| |/ _ \/  _| |/ _ \| '_ \ / _ \____|  \| \ \ / / | '_ ` _ \   ]],
        --     [[  | | | | | | | |_) | (_) \__ \__ \ | |_) | |  __/| |_| | (_) | | | |  __/____| |\  |\ V /| | | | | | |  ]],
        --     [[  |_|_| |_| |_| .__/ \___/|___/___/_|_.__/|_|\___|\___|_|\___/|_| |_|\___|    |_| \_| \_/ |_|_| |_| |_|  ]],
        --     [[              |_|                                                                                        ]],
        --     },
        --     opts = {
        --         position = "center",
        --         hl = "Keyword"
        --     }
        -- }

        dashboard.section.buttons.val = {
            dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
            dashboard.button("o", "Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "Config", ":cd $HOME/.config/nvim | Telescope find_files<CR>"),
            dashboard.button("q", "Quit NVIM", ":qa<CR>"),
        }

        local version = vim.version()
        dashboard.section.footer.val = "Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

        dashboard.config.layout = {
            { type = "padding", val = 8 },
            dashboard.section.header,
            -- { type = "padding", val = 2 },
            -- secondary_header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)

        require("milli").alpha({
            splash = my_splash,
            loop = true
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            command = "setlocal nofoldenable",
        })
    end,
}
