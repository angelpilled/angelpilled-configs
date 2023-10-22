:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard+=unnamedplus

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

call plug#end()

lua require('Comment').setup()

" Editor Theme
:colorscheme challenger_deep

nmap <C-t> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFocus<CR>
nmap <C-Up> :t-<CR>
nmap <C-Down> :t.<CR>
nmap <C-l> :noh<CR>
nmap <C-i> :move -2<CR>
nmap <C-k> :move +1<CR>
nmap <C-x> dd
nmap <C-f> /

" Toggle relative line numbers
nmap <C-q> :set rnu!<CR>

" Jump minus plus numbers
nmap <C-w> :-
nmap <C-e> :+

" Write/Quit
nmap <C-s> :w!<CR>
nmap <C-d> :q!<CR>

autocmd BufEnter * set nowrap
