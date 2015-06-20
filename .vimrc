set nocompatible
filetype off

if has('vim_starting')
	set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shugo/neobundle.vim'

NeoBundle 'Shugo/neocomplcache.git'
NeoBundle 'Shugo/unite.vim.git'

call neobundle#end()

filetype plugin indent on
