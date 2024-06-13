return {
    {
        "williamboman/mason.nvim",

        config = function()
            require("mason").setup {}
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    'java-debug-adapter',
                    'java-test',
                }
            })
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
            lspconfig.kotlin_language_server.setup {
                capabilities = capabilities,
            }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to references" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })
        end,
    },
}
