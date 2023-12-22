-- neo-tree
vim.keymap.set('n', '<C-n>', function()
  require("neo-tree.command").execute({toggle = true})
end, {}
)

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
