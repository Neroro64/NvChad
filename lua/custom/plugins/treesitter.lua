local default = {
   ensure_installed = {
   "lua", "python", "cpp", "c",
   "vim", "c_sharp", "markdown", "html",
   "json", "javascript"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
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
