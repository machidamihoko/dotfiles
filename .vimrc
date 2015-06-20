set nocompatible
filetype off

if has('vim_starting')
	set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shugo/neobundle.vim'

" 入力補完
NeoBundle 'Shugo/neocomplcache.git'

" IDE
NeoBundle 'Shugo/unite.vim.git'

" ツリー表示
NeoBundle 'scrooloose/nerdtree'

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
