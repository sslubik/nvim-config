local home = os.getenv 'HOME'
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, 'jdtls')
if not status then
    return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        '-jar',
        vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data',
        workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },

    settings = {
        java = {
            signatureHelp = { enabled = true },
            extendedClientCapabilities = extendedClientCapabilities,
            maven = {
                downloadSources = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = 'all', -- literals, all, none
                },
            },
            format = {
                enabled = true,
                settings = {
                    url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
                    profile = "GoogleStyle",
                }
            },
            errors = {
                severity = "off",
            },
            validate = {
                enabled = false,
            },
            saveActions = {
                organizeImports = true,

            }
        },
    },

    init_options = {
        bundles = {
            vim.fn.glob(vim.env.HOME ..
            '/local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
        },
    },
}

config['on_attach'] = function(client, bufnr)
    jdtls.setup_dap({ hotcoderplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
end

require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<leader>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports (Java)' })
