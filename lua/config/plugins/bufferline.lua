return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			numbers = "none", -- Or "ordinal" or "buffer_id" or "both"
			close_command = "bdelete! %d", -- Can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- Can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- Can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- Can be a string | function, see "Mouse actions"
			indicator_icon = "▎",
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
				if buf.name:match("%.md") then
					return vim.fn.fnamemodify(buf.name, ":t:r")
				end
			end,
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 18,
			diagnostics = false, -- or "nvim_lsp"
			diagnostics_update_in_insert = false,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				return "(" .. count .. ")"
			end,
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
					return true
				end
				if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
					return true
				end
				if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
					return true
				end
			end,
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thin", -- | "thick" | "slant" | { 'any', 'any' }
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = "id", -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
		},
	},
}
