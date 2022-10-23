local nnoremap = require("tomy.keymap").nnoremap
local inoremap = require("tomy.keymap").inoremap
local telescope = require("telescope.builtin")

nnoremap("<leader>pv", "<cmd>Ex<CR>")
inoremap("jk", "<ESC>")
nnoremap("<leader>ps", function()
	telescope.grep_string({ search = vim.fn.input("Grep for >") })
	return "\n"
end)

nnoremap("<C-p>", function()
	telescope.git_files()
	return "\n"
end)

nnoremap("<leader>pf", function()
	telescope.find_files()
	return "\n"
end)
nnoremap("<leader>pb", function()
	telescope.buffers()
	return "\n"
end)
nnoremap("<leader>vh", function()
	telescope.help_tags()
	return "\n"
end)

nnoremap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
