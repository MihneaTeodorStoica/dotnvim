-- Key mappings
local map = vim.keymap.set

-- Telescope mappings (only if plugin available)
local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
  map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
  map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
  map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
  map('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
end

-- LSP mappings
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Quick save/quit
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- CompetiTest mappings
map('n', '<leader>tr', '<cmd>CompetiTest run<CR>', { desc = 'Run testcases' })
map('n', '<leader>ta', '<cmd>CompetiTest add_testcase<CR>', { desc = 'Add testcase' })
map('n', '<leader>te', '<cmd>CompetiTest edit_testcase<CR>', { desc = 'Edit testcase' })
map('n', '<leader>td', '<cmd>CompetiTest delete_testcase<CR>', { desc = 'Delete testcase' })
map('n', '<leader>tp', '<cmd>CompetiTest receive problem<CR>', { desc = 'Receive problem' })
