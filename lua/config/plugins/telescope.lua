return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/trouble.nvim", -- Ensure trouble is listed as a dependency
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- Load trouble and its telescope integration
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")

		-- Define custom actions
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		-- Configure Telescope with trouble integration
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = function()
							require("trouble.sources.telescope").open()
						end,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		local keymap = vim.keymap -- for conciseness

		local builtin = require("telescope.builtin")
		--keymap.set("n", "<leader>fs", function()
		--builtin.find_files({ search_dirs = { "/home/wae_lb23/" }, hidden = true })
		--end, { desc = "Fuzzy find files in home directory (including hidden files)" })
		keymap.set("n", "<leader>fs", builtin.find_files, {})
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
