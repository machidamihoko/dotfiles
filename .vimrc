" ---------------------------
"" Start Neobundle Settings.
" ---------------------------

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルをツリー表示
NeoBundle 'scrooloose/nerdtree'

" vim IDE"
NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/neomru.vim'

" golang IDE
NeoBundle 'fatih/vim-go'

" Ruby"
NeoBundle 'tpope/vim-rails'

" 補完
NeoBundle 'Shougo/neocomplete'

" スニペット
NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/neosnippet-snippets'

" カラースキーム
NeoBundle 'tomasr/molokai'

" ステータスライン
NeoBundle 'itchyny/lightline.vim'

" コメントアウト
NeoBundle 'tyru/caw.vim'

" 閉じカッコ
NeoBundle 'cohama/lexima.vim'

call neobundle#end()
filetype plugin indent on

" -------------------------
"" End Neobundle Settings.
" -------------------------

"構文ハイライト
syntax on "シンタックスハイライトを有効に

set encoding=utf-8
set listchars=eol:¬,tab:▸\
set history=2000
set number       "行番号
set ruler        "カーソルが何行目の何列目にあるか
set title        "ターミナルのタイトルをセット
set cursorline   "カーソル行を強調表示
set cursorcolumn "カーソル桁強調表示
set list         "空白文字の可視化
set laststatus=2 "ステータスラインを表示するウインドウ
set ignorecase   "検索の大文字小文字を区別しない
set shiftwidth=2 "自動インデント幅
set tabstop=2    "タブ幅
set showcmd      "コマンドをステータスラインに表示
set showmode     "ステータスラインに現在のモードを表示
set smartindent  "新しい行を作った時に自動インデント
set wildmenu     "補完候補の表示
set wrap         "長い行を折り返して表示
set noswapfile   "swpファイルを生成しない
autocmd BufWritePre * :%s/\s\+$//ge "保存時に行末の空白を除去

" 閉じカッコの設定
" 自動閉じカッコ　文末以外では無効
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})

" 自動閉じカッコ　次の行に閉じカッコがあってもタイプ出来るように
call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})

" <C-_>でコメントアウト
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)>

" 入力補完
let g:neocomplete#enable_at_startup = 1

" Unite.vim の設定
" インサートモードで始める
let g:unite_enable_start_insert=1

" バッファ一覧
noremap <C-P> :Unite buffer<CR>

" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>

" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

" esc で終了
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
 nmap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

" vim-go の設定
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" NERDTree の設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ステータスラインの設定
scriptencoding utf-8
let g:lightline = {
	\	'colorscheme': 'wombat',
	\	}

" カラースキーマの設定
let g:molokai_original = 1
colorscheme molokai
set t_Co=256

" vimrcの保存時に自動再読み込み
augroup source-vimrc
	autocmd!
	autocmd BufWritePost *vimrc source $MYVIMRC
augroup END

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" PHP関係
" .ctpはPHP扱いで
autocmd BufNewFile,BufRead *.ctp set filetype=php
" phpはHTMLのシンタックスも有効
let php_htmlInStrings=1
