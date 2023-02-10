require("lspconfig").rust_analyzer.setup({})
require("lspconfig").svelte.setup({})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").emmet_ls.setup({})
require("lspconfig").gopls.setup({})

require("lspconfig").jsonls.setup({
	capabilities = capabilities,
})

require("lspconfig").tsserver.setup({})
require("lspconfig").elixirls.setup({
	cmd = { "/Users/tomy/.local/bin/elixir-ls/language_server.sh" },
})

require("lspconfig").purescriptls.setup({
	settings = {
		purescript = {
			addSpagoSources = true,
		},
	},
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig").ocamllsp.setup({
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = require("lspconfig").util.root_pattern(
		"*.opam",
		"esy.json",
		"package.json",
		".git",
		"dune-project",
		"dune-workspace"
	),
	on_attach = on_attach,
	capabilities = capabilities,
})

local metals_config = require("metals").bare_config()
local api = vim.api
metals_config.init_options.statusBarProvider = "on"
-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
	-- NOTE: You may or may not want java included here. You will need it if you
	-- want basic Java support but it may also conflict if you are using
	-- something like nvim-jdtls which also works on a java filetype autocmd.
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
