require("go").setup()

-- Go formatter
vim.cmd([[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]])
