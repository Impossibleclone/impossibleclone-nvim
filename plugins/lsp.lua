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
            automatic_installation = true,
        })

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            -- -- LSP keymaps
            -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            -- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
            -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
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

        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
            },
        })

        lspconfig.ast_grep.setup({
            on_attach = on_attach,
        })

        lspconfig.ts_ls.setup({
            on_attach = on_attach,
        })

        lspconfig.pyright.setup({
            on_attach = on_attach,
        })

        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
        })

        lspconfig.gopls.setup({
            on_attach = on_attach,
        })

        lspconfig.clangd.setup({
            on_attach = on_attach,
        })

        lspconfig.jsonls.setup({
            on_attach = on_attach,
        })

        lspconfig.html.setup({
            on_attach = on_attach,
        })

        lspconfig.cssls.setup({
            on_attach = on_attach,
        })

        lspconfig.bashls.setup({
            on_attach = on_attach,
        })
    end,
}
