require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {'dart'}
  },
}

-- (https://github.com/nvim-treesitter/nvim-treesitter/issues/4945)
-- (https://github.com/UserNobody14/tree-sitter-dart/issues/60)
-- Fix super slow dart parsing
-- local parser = require("nvim-treesitter.parsers").get_parser_configs()
-- parser.dart = {
--   install_info = {
--     url = "https://github.com/UserNobody14/tree-sitter-dart",
--     files = { "src/parser.c", "src/scanner.c" },
--     revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
--   },
-- }
