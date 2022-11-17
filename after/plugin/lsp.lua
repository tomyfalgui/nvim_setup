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
