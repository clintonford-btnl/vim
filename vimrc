set ts=2
set expandtab
set sw=2

" faster tab navigation
nnoremap <silent> <C-Left> :tabprev<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
syntax on

" bind enter to save in normal mode for non-special buffers
nnoremap <expr> <cr> &buftype=="" ? ":w<cr>" : "<cr>"

call plug#begin()
  Plug 'LnL7/vim-nix'
  Plug 'hashivim/vim-terraform'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-fugitive'
call plug#end()

command! -nargs=1 GC Git commit -m "<args>"
