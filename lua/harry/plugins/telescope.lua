local builtin = require('telescope.builtin')
require'telescope'.setup {
  defaults = {
    file_ignore_patterns = {"node_modules", ".git"},
    mappings = {
      i = {
        ["<C-j>"] = builtin.move_selection_next,
        ["<C-k>"] = builtin.move_selection_previous
      }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {["<C-d>"] = "delete_buffer"},
        n = {["<C-d>"] = "delete_buffer"}
      }
    }
  }
}

