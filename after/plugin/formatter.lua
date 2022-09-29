-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},

		typescript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		go = {
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").golines,
		},
	},
})

local formatAutogroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWrite",
	group = formatAutogroup,
})
