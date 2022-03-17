-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

M.plugins = {
  default_plugin_config_replace = {
      treesitter = "custom.plugins.treesitter",
   },
   options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.mappings = {
  misc = {
      cheatsheet = "<leader>ch",
      close_buffer = "<leader>x",
      copy_whole_file = false, -- copy all contents of current buffer
      copy_to_system_clipboard = "<C-c>", -- copy selected text (visual mode) or curent line (normal)
      line_number_toggle = false, -- toggle line number
      relative_line_number_toggle = false,
      update_nvchad = false,
      new_buffer = "<leader>tn",
      new_tab = "<leader>tb",
      save_file = "<leader>w", -- save file using :w
  },
  -- terminal related mappings
  terminal = {
      -- multiple mappings can be given for esc_termmode, esc_hide_termmode

      -- get out of terminal mode
      esc_termmode = { "jl" },

      -- get out of terminal mode and hide it
      esc_hide_termmode = { "JL" },
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<leader>M",

      -- spawn terminals
      new_horizontal = "<leader>mh",
      new_vertical = "<leader>mv",
      new_window = "<leader>m",
   },
}

-- plugins related mappings
-- To disable a mapping, equate the variable to "" or false or nil in chadrc
M.mappings.plugins = {
   bufferline = {
      next_buffer = "<TAB>",
      prev_buffer = "<S-Tab>",
      buffer_pick = "<leader>i",
      buffer_pick_close = "<leader>I",
  },

   comment = {
      toggle = "<leader>cc",
   },

   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = { "jl" }, -- multiple mappings allowed
   },

   lspconfig = {
      declaration = "gD",
      definition = "gd",
      hover = "K",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>wa",
      remove_workspace_folder = "<leader>wr",
      list_workspace_folders = "<leader>wl",
      type_definition = "<leader>D",
      rename = "<leader>rn",
      code_action = "<leader>ca",
      references = "gr",
      float_diagnostics = "ge",
      goto_prev = "[d",
      goto_next = "]d",
      set_loclist = "<leader>ll",
      formatting = "<leader>fd",
   },

   nvimtree = {
      toggle = "<leader>ee",
      find_file = "<leader>ef",
   },

   telescope = {
    open = "<leader>op",
    buffers = "<leader>oi",
    find_files = "<leader>of",
    find_hiddenfiles = "<leader>oh",
    git_commits = "<leader>ogc",
    git_status = "<leader>ogs",
    help_tags = "<leader>ot",
    live_grep = "<leader>o/",
    oldfiles = "<leader>ou",
    marks = "<leader>om",
    themes = "<leader>oth", -- NvChad theme picker
   },
}
   
return M
