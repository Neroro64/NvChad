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
<<<<<<< HEAD
  org_agenda_files = {'D:/GitLab/DICE-Log/Org/Work', 'D:/GitLab/DICE-Log/Org/**/*'},
  org_default_notes_file = 'D:/GitLab/DICE-Log/Org/refile.org',
=======
  org_agenda_files = {'E:/dev/dice-log/Org/Home', 'E:/dev/dice-log/**/*'},
  org_default_notes_file = 'E:/dev/dice-log/Org/Home/refile.org',
>>>>>>> bb8a1f04897dc63d3b6181a29573debdb8b688ae
  org_todo_keywords = {'TODO', 'PENDING', '|', 'DONE'},
})
