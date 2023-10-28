-- Set Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- Integraing Vimscript to lua with vim.cmd:
vim.cmd [[
call plug#begin()

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/neoclide/coc-pairs'
Plug 'https://github.com/numToStr/Comment.nvim' " Neovim Commenting
Plug 'https://github.com/ziontee113/color-picker.nvim'

call plug#end()
]]

-- Plugin Setup
require('Comment').setup()
require('color-picker').setup()

-- Theme
vim.cmd('colorscheme hybrid')

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':t-<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':t.<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-i>', ':move -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':move +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':set rnu!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>', ':-', { noremap = true})
vim.api.nvim_set_keymap('n', '<C-e>', ':+', { noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':PickColor<CR>', { noremap = true, silent = true })

-- Autocommands - setting nowrap on buffer enter
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'set nowrap'
})
