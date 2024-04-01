local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup{
  defaults = {
    sorting_strategy = "descending",
    layout_config = {
            vertical = {
                width = 1,
                height = 0.3
            }
        },
    mappings = {
      i = { -- bindings in insert mode
        ["<C-h>"] = "which_key", -- show which_key for telescope
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-c>"] = actions.close,
      }
    }
  },
  extensions = {
      fzf = { -- telescope fzf integration
          fuzzy = true, -- enable fzf
          override_generic_sorter = true, -- override telescope's sorter
          override_file_sorter = true, -- override telescope's file sorter
          case_mode = "smart_case" -- "ignore_case", "respect_case", or "smart_case" (ingores unless upper case in query)
      },
      ['ui-select'] = {
        require('telescope.themes').get_dropdown()
      }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
