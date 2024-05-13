return {
    {
        "williamboman/mason.nvim",

        config = function()
            require("mason").setup {}
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "phpactor", "tsserver", "pylsp", "jdtls",
                }
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require "lspconfig"

            lspconfig.tsserver.setup {
                capabilities = capabilities,
            }
            lspconfig.solargraph.setup {
                capabilities = capabilities,
            }
            lspconfig.html.setup {
                capabilities = capabilities,
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }
            lspconfig.phpactor.setup {
                capabilities = capabilities,
            }
            lspconfig.arduino_language_server.setup {
                capabilities = capabilities,
            }
            lspconfig.pylsp.setup {
                capabilities = capabilities,
            }
            lspconfig.pylsp.setup {
                capabilities = capabilities,
            }
            lspconfig.jdtls.setup {
                capabilities = capabilities,
            }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
