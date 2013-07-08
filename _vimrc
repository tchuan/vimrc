" enable all features
set nocompatible

filetype off

if has("win32")
    set rtp+=$VIM/vimfiles/bundle/vundle
    call vundle#rc('$VIM/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
endif

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'AutoClose'
Bundle 'FencView.vim'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'Valloric/YouCompleteMe'

" 配置多语言环境
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set formatoptions+=mM
    set fileencodings=ucs-bom,utf-8,cp936,gb18030

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
endif

" auto-detect the filetype
filetype plugin indent on
" auto change dir
set bsdir=buffer
set autochdir
" Gui Font
set guifont=Dejavu\ Sans\ Mono:h10.5
"set guifontwide=Dejavu\ Sans\ Mono:10.5:cGB2312
" Background 
set background=light
" ColorScheme
colorscheme mayansmoke
" Wrap too long lines
set nowrap
" Show linenum
set number
" ScrollOff 3 lines
set scrolloff=5
" Tabs are 4 characters
set tabstop=4
" Let backspace delete indent
set softtabstop=4
" spaces instead of tabs
set expandtab
" guess indentation
set autoindent shiftwidth=4
" Expand the command line using tab
set wildchar=<Tab>
" Fold using markers {{{ like this }}}
set foldmethod=syntax
set foldlevel=99
" powerful backspaces
set backspace=indent,eol,start
" highlight the searchterms
set hlsearch
" jump to the matches while typing
set incsearch
" ignore case while searching
set ignorecase
" don't wrap words
set textwidth=0
" history
set history=50
" 1000 undo levels
set undolevels=100
" show a ruler
set ruler
" show partial commands
set showcmd
" show matching braces
set showmatch
" write before hiding a buffer
set autowrite
" no backup
set nobackup
" syntax highlight
syntax on
" Always show the menu, insert longest match
set completeopt=menuone,longest
" find tags 
set tags=tags;/

" Some maps
:map <C-J> <C-W>w
:map <F5> :!%<CR>

" Tagbar
:map <F4> :TagbarToggle<CR>
if has("win32")
    let g:tagbar_ctags_bin="V:\\KuaiPan\\SoftWare\\Vim\\vimfiles\\extras\\ctags.exe" 
else
    let g:tagbar_ctags_bin=
endif

" NERDTree Support
let NERDTreeChDirMode=2
:map <C-n> :NERDTreeToggle<CR>

" Python Support
" let python_no_number_highlight = 1
let python_highlight_all=1
if has("win32") 
    let g:flake8_cmd="C:\\Python27\\Scripts\\flake8.cmd"
endif
autocmd FileType python set foldmethod=indent
autocmd FileType python set omnifunc=pythoncomplete#Complete

"Toggle Menu and Toolbar
set guioptions-=T 

if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
