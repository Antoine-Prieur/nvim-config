return {
  "ThePrimeagen/harpoon",
  cmd = "Harpoon",
  lazy = false,
  config = function()
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")

    vim.keymap.set('n', '<leader>a', function() harpoon_mark.add_file() end, { desc = 'Harpoon - [A]dd file' })
    vim.keymap.set('n', '<leader><tab>', function() harpoon_ui.toggle_quick_menu() end, { desc = 'Harpoon - Toggle menu' })
    vim.keymap.set('n', '<leader>j', function() harpoon_ui.nav_prev() end, { desc = 'Harpoon - Navigate previous' })
    vim.keymap.set('n', '<leader>k', function() harpoon_ui.nav_next() end, { desc = 'Harpoon - Navigate next' })
    vim.keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, { desc = 'Harpoon - Navigate to file [1]' })
    vim.keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, { desc = 'Harpoon - Navigate to file [2]' })
    vim.keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, { desc = 'Harpoon - Navigate to file [3]' })
    vim.keymap.set('n', '<leader>4', function() harpoon_ui.nav_file(4) end, { desc = 'Harpoon - Navigate to file [4]' })
  end
}
