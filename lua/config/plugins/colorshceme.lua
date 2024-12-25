return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			-- Main options
			style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = true, -- Show/hide background
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp menu

			-- Toggle theme style
			toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

			-- Change code style
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options
			lualine = {
				transparent = false, -- Lualine center bar transparency
			},

			-- Custom Highlights
			colors = {

				indicator_color = "#ff0000", -- Replace with your desired color
			}, -- Override default colors
			highlights = {

				NormalFloat = { bg = "#fff", fg = "#ffffff" }, -- Example for NormalFloat (popup windows)
			}, -- Override highlight groups

			-- Plugins Config
			diagnostics = {
				darker = true, -- Darker colors for diagnostics
				undercurl = true, -- Use undercurl instead of underline for diagnostics
				background = true, -- Use background color for virtual text
			},
		})
		vim.cmd("colorscheme onedark")
	end,
}
