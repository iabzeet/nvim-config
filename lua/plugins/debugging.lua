return {
	-- C/C++/Rust Debugging Setup
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Define the LLDB adapter (C/C++/Rust)
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- adjust this path if necessary
				name = "lldb",
			}
			-- Define configurations for C/C++
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

			-- Initialize dapui
			dapui.setup()

			-- Open dapui on dap events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Set keybindings for dap
			vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>dc", dap.continue, {})
			vim.keymap.set("n", "<Leader>di", dap.step_into, {})
			vim.keymap.set("n", "<Leader>do", dap.step_out, {})
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})
		end,
	},

	-- Java Debugging Setup
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')

			-- Define configurations for Java
			dap.configurations.java = {
				{
					type = 'java',
					request = 'launch',
					name = 'Launch YourClassName', -- Change to your main class name
					mainClass = 'your.package.name.MainClassName', -- Adjust this to your main class
					projectName = "yourProjectName", -- Change to your project name
					javaExec = "/path/to/your/bin/java", -- Adjust this to your Java executable path
					classPaths = {}, -- You can specify classpaths here if needed
					modulePaths = {}, -- Adjust if using the JDK9+ module system
				},
				{
					type = 'java',
					request = 'attach',
					name = "Debug (Attach) - Remote",
					hostName = "127.0.0.1",
					port = 5005, -- Change this to your debug port
				},
			}
		end,
	},
}

