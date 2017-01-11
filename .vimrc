set encoding=utf-8

set number

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set list
set listchars=tab:>-

set autoindent
set smartindent

set backspace=indent,eol,start

set ignorecase
set smartcase

set hlsearch

syntax on
set t_Co=256
colorscheme molokai
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

set nocompatible               " be iMproved
filetype on

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  " originalrepos on github
  NeoBundle 'Shougo/neobundle.vim'
  "NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'fatih/vim-go'

  NeoBundleLazy 'taichouchou2/vim-endwise.git', {
        \ 'autoload' : {
        \   'insert' : 1,
        \ } }

  NeoBundle 'tpope/vim-rails'

  NeoBundle 'Shougo/unite.vim'
  NeoBundleLazy 'ujihisa/unite-rake', {
        \ 'depends' : 'Shougo/unite.vim' }
  NeoBundleLazy 'basyura/unite-rails', {
        \ 'depends' : 'Shougo/unite.vim' }

  NeoBundleLazy 'taichouchou2/alpaca_complete', {
        \ 'depends' : 'tpope/vim-rails',
        \ 'build' : {
        \    'mac':  'gem install alpaca_complete',
        \    'unix': 'gem install alpaca_complete',
        \   }
        \ }
  NeoBundle 'kana/vim-submode'

  NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'skwp/vim-rspec', {
        \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundleLazy 'ruby-matchit', {
      \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundle "elixir-lang/vim-elixir"
  NeoBundleLazy 't9md/vim-foldtext', {
      \ 'autoload' : { 'filetypes': ['ruby', 'eruby', 'haml'] } }
  NeoBundle 'derekwyatt/vim-scala'

  NeoBundle 'justmao945/vim-clang'
  NeoBundle 'Shougo/neoinclude.vim'

  call neobundle#end()
endif

filetype plugin indent on     " required!
filetype indent on

" 行末スペースを殺害する
autocmd BufWritePre * :%s/\s\+$//ge

" スニペット用ディレクトリの指定
let g:neosnippet#snippets_directory = '~/.vim/bundle/ruby_snip'
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"highlight Normal ctermbg=none

noremap <C-M> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('split')
" " ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_play_open_browser = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = "/usr/local/bin/"

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

set foldmethod=indent
set foldlevel=4
set foldcolumn=3

runtime! userautoload/*.vim
