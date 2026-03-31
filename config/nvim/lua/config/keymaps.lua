-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set('n', '<leader>mx', function()
	vim.cmd('delmarks!')
end, { desc = 'Clear marks' })

vim.keymap.set('n', '<leader>mX', function()
	vim.cmd('delmarks!')
	vim.cmd('delmarks A-Z')
end, { desc = 'Clear Marks' })
