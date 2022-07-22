set ts=2
set expandtab
set sw=2
set splitright
set splitbelow

let mapleader = ","

" faster tab navigation
nnoremap <silent> <C-p> :tabprev<CR>
nnoremap <silent> <C-n> :tabnext<CR>

" bind enter to save in normal mode for non-special buffers
nnoremap <expr> <cr> &buftype=="" ? ":w<cr>" : "<cr>"

call plug#begin()
  Plug 'LnL7/vim-nix'
  Plug 'hashivim/vim-terraform'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-fugitive'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'dense-analysis/ale'
  Plug 'kana/vim-arpeggio'
  Plug 'sdiehl/vim-ormolu'
call plug#end()

call arpeggio#load()

" Do we really need arpeggio for this?
Arpeggio inoremap jk <esc>

if (has("termguicolors"))
 set termguicolors
endif

set bg=dark
syntax enable
colorscheme tender


" TODO put this into an ftplugin
let g:ale_fixers = {
      \   'haskell': [
      \       'trim_whitespace',
      \       'remove_trailing_lines',
      \   ],
      \}

let g:ale_linters_ignore = {
      \ 'haskell':
      \  [ 'cabal_ghc',
      \    'stack_ghc',
      \    'stack_build',
      \    'ghc'
      \    ]
      \}


"let g:ale_haskell_hls_executable = "haskell-language-server -dl /tmp/hls.out"
let g:ale_list_window_size = 8
let g:ale_completion_enabled = 1
"let g:ale_haskell_hls_executable = "/home/clintonford/gt/btnl_master/frob"
let g:ale_haskell_hls_args = ["-dl", "/tmp/hls.out"]
let g:ale_haskell_hls_config = {
      \  'haskell':
      \    { 'checkProject': 'false',
      \      'formattingProvider': 'fourmolu',
      \    }
      \  }



set omnifunc=ale#completion#OmniFunc

nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

set hlsearch

augroup haskell_save | au!
  autocmd BufWritePre *.hs ALEFix
augroup end

let g:ormolu_command="fourmolu"
let g:ormolu_suppress_stderr=1

let g:ale_floating_preview=1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

nnoremap <F1> :ALEHover<cr>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Don't lose selection when in/outdenting
vnoremap < <gv
vnoremap > >gv

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

cnoremap <expr> %% expand('%:p:h') . '/'
