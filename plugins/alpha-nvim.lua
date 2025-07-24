return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local alpha = require("alpha")

        -- Read header from curl | sed
        -- local function get_clean_ascii_art()
        --     local cmd = "ping -q -c 1 -W 1 1.1.1.1 >/dev/null 2>&1 && curl -sS pkmn.li/icons/ | sed '1,3d'"
        --     local handle = io.popen(cmd)
        --     if not handle then return { "Failed to fetch Pokémon" } end
        --
        --     local result = handle:read("*a")
        --     handle:close()
        --
        --     local lines = {}
        --     for line in result:gmatch("[^\r\n]+") do
        --         -- Strip ANSI escape codes like \x1b[31m
        --         line = line:gsub("\27%[[%d;]*m", "")
        --         table.insert(lines, line)
        --     end
        --
        --     return lines
        -- end
        --
        -- dashboard.section.header.val = get_clean_ascii_art()


        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("ldr ff", "  > Find file", ":cd $HOME/prgm/ | Telescope find_files<CR>"),
            dashboard.button("ldr fo", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
    end,
}
