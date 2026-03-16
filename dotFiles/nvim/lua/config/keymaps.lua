-- move arround panels


-- telescope keymap
local tsBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', tsBuiltin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sk', tsBuiltin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sg', tsBuiltin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb', tsBuiltin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh', tsBuiltin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>sd', tsBuiltin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', tsBuiltin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', tsBuiltin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sc', tsBuiltin.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader><leader>', tsBuiltin.buffers, { desc = '[ ] Find existing buffers' })

-- neotree keymaps
vim.keymap.set( 'n', '\\', ':Neotree filesystem toggle left<cr>', { desc = 'Reveal filesystem on left' })

-- Window navigation remaps
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
