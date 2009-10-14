set modeline
set nocompatible

set termencoding=utf-8
set encoding=utf-8

syntax on
filetype on
filetype indent on
filetype plugin on

"-----------------------------------------------------------------
" NICE Plugins/extensions: VimExplorer,Perl-support, Bash-support
"-----------------------------------------------------------------

" Don't use Ex mode, use Q for formatting
map Q gq
set autoindent 
set backspace=indent,eol,start 
set cindent autoindent
set clipboard+=unnamed   
set commentstring=\ #\ %s 
set encoding=utf8 
set expandtab 
"set foldlevel=0 
set history=50		" keep 50 lines of command line history
set hlsearch
set ignorecase 
set incsearch		" do incremental searching
set hid " you can change buffer without saving
set nolz " do not redraw while running macros (much faster)
set nowrap
set number
set paste            
set ruler " Always show current positions along the bottom
set shiftround      " wcinanie do najblizszego przystanky tab
set shiftwidth=4 
set showcmd
set showcmd		    " display incomplete commands
set tabstop=4
set textwidth=0 
set whichwrap+=,h,l  " backspace and cursor keys wrap to
set wildmenu " turn on wild menu

colorscheme desert
set background=dark

autocmd Filetype sh,awk set tabstop=2
autocmd Filetype sh,awk set shiftwidth=2
autocmd FileType perl set smartindent

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" THIS SUCKS with SCREEN !!!!
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
filetype plugin on

