set number 
set nocompatible
set autoindent
set backupdir =$HOME/.vimbackup
set showmatch
set smartcase 
set smartindent
  "タブ関連の設定
set shiftwidth=4
set expandtab
set tabstop=4
set shiftround
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase
set wildmenu
set wrap
set wrapscan
syntax on
set laststatus=2
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" backupファイルを作成しない
set nobackup
set noswapfile
set backupdir=/tmp
" カッコを書いたら中に移動する
imap () ()<LEFT>
imap [] []<LEFT>
imap {} {}<LEFT>
imap '' ''<LEFT>
imap "" ""<LEFT>
imap <> <><LEFT>
" backspace で色々消去できるようにする
set backspace=indent,eol,start
"カーソルラインの設定
set cursorline
"カレントウィンドウにのみ罫線を引く
  augroup cch
   autocmd! cch
   autocmd WinLeave * set nocursorline
   autocmd WinEnter,BufRead * set cursorline
  augroup END
"縦方向のカーソルライン
"set cursorcolumn
"検索でのハイライト
set hlsearch
"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><ESC>

"エンコード
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileencoding=utf-8
"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

filetype plugin on

" vundleを使うためのおまじない
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/taglist.vim'
Bundle 'wesleyche/Trinity'
Bundle 'ack.vim'
"Bundle 'errormarker.vim'

let g:acp_enableAtStartup = 0
"Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_ctags_arguments_list = {
    \ 'perl' : '-R -h ".pm"'
        \ }
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
          \ 'default'    : '',
          \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
          \ }
     " Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
     let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" vim quickrun のエンコード設定
let g:quickrun_config = {}
let g:quickrun_config['vim'] = {
    \   "hook/output_encode/enable" : 1,
    \   "hook/output_encode/encoding" : "utf-8",
    \}
" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"NERDTreeToggleのショートカット
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :NERDTreeToggle<CR>
"perltidyのショートカット
nmap ,pt <Esc>:%! perltidy<CR>
" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
