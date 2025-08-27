return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls", "ts_ls", "ast_grep", "pyright", "rust_analyzer", "gopls", "clangd", "jsonls", "html", "cssls",
                "bashls",
            },
            handlers = {
                function(server_name)
                    -- Skip gopls here to avoid duplicate setup
                    if server_name == "gopls" then
                        return
                    end
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                    })
                end,
                -- Explicitly configure gopls
                gopls = function()
                    lspconfig.gopls.setup({
                        on_attach = on_attach,
                        settings = {
                            gopls = {
                                analyses = {
                                    unusedparams = true,
                                },
                                staticcheck = true,
                            },
                        },
                    })
                end,
            },
        })

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, { desc = "Format current buffer", buffer = bufnr })

            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end
    end,
}
