return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp", -- Required to link LSP with your new menu
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        -- 1. DEFINE CAPABILITIES (Crucial for your new icons/snippets to work)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 2. DEFINE ON_ATTACH (Must be up here, before you use it)
        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, { desc = "Format current buffer", buffer = bufnr })

            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    -- Added a group to prevent commands from stacking up
                    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end

        -- 3. SETUP SERVERS
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "ast_grep", "rust_analyzer", "gopls", "clangd", "bashls"
            },
            handlers = {
                -- Default handler for standard servers
                function(server_name)
                    if server_name == "gopls" then return end -- Skip gopls
                    
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities, -- Pass capabilities here
                    })
                end,

                -- Custom gopls handler
                gopls = function()
                    lspconfig.gopls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            gopls = {
                                analyses = { unusedparams = true },
                                staticcheck = true,
                            },
                        },
                    })
                end,
            },
        })
    end,
}
