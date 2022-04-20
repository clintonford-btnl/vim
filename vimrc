set ts=2
set expandtab
set sw=2
set splitright
set splitbelow

" faster tab navigation
nnoremap <silent> <C-Left> :tabprev<CR>
nnoremap <silent> <C-Right> :tabnext<CR>

" bind enter to save in normal mode for non-special buffers
nnoremap <expr> <cr> &buftype=="" ? ":w<cr>" : "<cr>"

call plug#begin()
  Plug 'LnL7/vim-nix'
  Plug 'hashivim/vim-terraform'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-fugitive'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-airline/vim-airline'
call plug#end()

command! -nargs=1 GC Git commit -m "<args>"

if (has("termguicolors"))
 set termguicolors
endif

set bg=dark
syntax enable
colorscheme tender

