local default = {
   ensure_installed = {
   "lua", "python", "cpp", "c",
   "vim", "c_sharp", "markdown", "html",
   "json", "org",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
	  -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
	  additional_vim_regex_highlighting = {'org'}
   },
}

local M = {}
M.setup = function(override_flag)
   if override_flag then
      default = require("core.utils").tbl_override_req("nvim_treesitter", default)
   end
   ts_config.setup(default)
end

return M
