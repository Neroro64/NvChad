require("orgmode").setup_ts_grammar()

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.org = {
--   install_info = {
--     url = 'https://github.com/milisims/tree-sitter-org',
--     revision = 'main',
--     files = {'src/parser.c', 'src/scanner.cc'},
--   },
--   filetype = 'org'
-- }

require('orgmode').setup({
  org_agenda_files = {'D:/GitLab/DICE-Log/Org/Work', 'D:/GitLab/DICE-Log/Org/**/*'},
  org_default_notes_file = 'D:/GitLab/DICE-Log/Org/refile.org',
  org_todo_keywords = {'TODO', '|', 'DONE'},
})
