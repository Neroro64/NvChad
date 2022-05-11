-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local userPlugins = require "custom.plugins"

M.ui = {
   hl_override = {},
   changed_themes = {},
   colors = {}, -- dynamically generated, never edit this in chadrc
   theme_toggle = { "onedark", "one_light" },
   theme = "rxyhn", -- default theme
   transparency = false,
}

M.plugins = {
   user = userPlugins,
   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
         ensure_installed = {
            "lua", "python", "cpp", "c",
            "vim", "c_sharp", "markdown", "html",
            "json", "org", 
            },
         highlight = {
            enable = true,
            use_languagetree = true,
            disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
            additional_vim_regex_highlighting = {'org'}
         },
      },
   },
   options = {
     lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of lspconfig file
      },
   }
}

return M
