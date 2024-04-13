return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},

		config = function()
			require("mason").setup()
			require("mason-nvim-dap").setup({
				ensure_installed = { "php" },
				automatic_setup = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,

					php = function(config)
						config.configurations = {
							{
								type = "php",
								request = "launch",
								name = "Launch currently open PHP script",
								program = "${file}",
								cwd = "${fileDirname}",
								port = 0,
								log = true,
								runtimeArgs = { "-dxdebug.start_with_request=yes" },
								env = {
									XDEBUG_MODE = "debug,develop",
									XDEBUG_CONFIG = "client_port=${port}",
								},
							},
						}

						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
}
