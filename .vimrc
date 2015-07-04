set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shugo/neobundle.vim'

"ディレクトリツリー表示
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" カラースキーマ
NeoBundle 'nanotech/jellybeans.vim'

" statusline
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
	  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
	      return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
	              \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
	              \  &ft == 'unite' ? unite#get_status_string() :
	              \  &ft == 'vimshell' ? vimshell#get_status_string() :
	              \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
	              \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
   try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
       return fugitive#head()
      endif
     catch
     endtry
     return ''
endfunction

function! MyFileformat()
     return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
     return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
     return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
     return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


call neobundle#end()

filetype plugin indent on
filetype indent on
syntax on

set number	"行番号
set ruler	"ルーラー
set title	"ターミナルのタイトルをセット
set cursorline	"カーソル行を強調表示
set cursorcolumn "カーソル桁強調表示
set list	"空白文字の可視化
autocmd BufWritePre * :%s/\s\+$//ge "保存時に行末の空白を除去
set laststatus=2 "ステータスラインを表示するウインドウ
set encoding=utf-8
set listchars=eol:¬,tab:▸\
set history=2000
set ignorecase	"検索の大文字小文字を区別しない
set shiftwidth=2 "自動インデント幅
set tabstop=2	"タブ幅
set showcmd	"コマンドをステータスラインに表示
set showmode	"ステータスラインに現在のモードを表示
set smartindent "新しい行を作った時に自動インデント
set wildmenu	"補完候補の表示
set wrap	"長い行を折り返して表示
set noswapfile	"swpファイルを生成しない
