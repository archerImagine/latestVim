" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
" " call pathogen#runtime_append_all_bundles() This doesnot work, used the
" next link.

call pathogen#helptags()

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
set ruler                           " show line and column number
set nu
" -------------------------- Solarized Configuration -------------------------

syntax enable
colorscheme solarized

if has('gui_running')
	    set background=dark
else
	    set background=light
endif
" ------------------------------------------------------------------------------

" ----------------------------- NERDTree  Configuration------------------------

"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

"open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

"map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"cursor always starts in the NERDTree window
""http://stackoverflow.com/questions/1447334/how-do-you-add-nerdtree-to-your-vimrc
autocmd VimEnter * wincmd p

"Easy window navigation, Just use CTRL + hjkl for navigation inplace of CTRL +
"W

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" ------------------------------------------------------------------------------

"http://stackoverflow.com/questions/10964681/enabling-markdown-highlighting-in-vim
"Enabling markdown highlighting in Vim
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


" http://stackoverflow.com/questions/65076/how-to-setup-vim-autoindentation-properly-for-editing-python-files-py
" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


" --------------------------------------------------------------------------------
"  " configure editor with tabs and nice stuff...
"  "
"  --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start
