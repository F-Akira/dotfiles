"表示設定"
set number
set ruler
set showmatch
set showcmd
set title
syntax on
set cindent
hi LineNr ctermfg=240 ctermbg=233
hi CursorLineNr ctermfg=11 ctermbg=233
set cursorline
hi clear CursorLine

"入力設定"
set backspace=indent,eol,start

"タブ設定"
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround

"検索設定"
set ignorecase
set smartcase
set wrapscan
set hlsearch

"key割当て"
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>
nnoremap Y y$
nnoremap x "_x
nnoremap s "_s
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
nnoremap <silent><Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent><TAB><TAB><TAB> :set noexpandtab<CR>:retab!<CR>
nnoremap :hs :GhcModCheck

"Plugin"
let g:syntastic_haskell_checkers = ["hlint"]

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
call plug#end()

