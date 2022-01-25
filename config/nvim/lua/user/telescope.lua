require('telescope').setup{
	defaults = {
		theme = 'ivy',
		layout_strategy = "vertical",
		layout_config = { height=0.95 },
		mappings = {
			i = {
			}
		}
	},
	pickers = {
		find_files = {
			theme = "ivy",
		}
	},
	extensions = {
		fzf = {

			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
