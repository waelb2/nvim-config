-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

-- Define visual mode mapping to yank to clipboard using leader key
vim.api.nvim_set_keymap("n", "<leader>y", '"+y<CR>', { noremap = true })

-- Example key mappings for bufferline navigation
vim.api.nvim_set_keymap("n", "<C-o>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>BufferLinePickClose<CR>", { desc = "Close buffer" })
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>bd<CR>", { desc = "Close current buffer" })

require("lazy").setup({
	{ import = "config.plugins" },
	{ import = "config.plugins.lsp" },
}, {
	install = {
		colorscheme = { "nightfly" },
	},
	checker = {
		enabled = true,
		notify = true,
	},
	change_detection = {
		notif = false,
	},
})
