" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
" " call pathogen#runtime_append_all_bundles() This doesnot work, used the
" next link.

call pathogen#helptags()

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
set ruler                       " show line and column number
set nu

" https://github.com/skwp/dotfiles/blob/master/vimrc

set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" ================ Turn Off Swap Files ==============
"
set noswapfile
set nobackup
set nowb

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·


" -------------------------- Solarized Configuration -------------------------

syntax enable
colorscheme solarized

" http://serverfault.com/questions/70196/how-to-tell-if-im-in-macvim-in-vimrc
if has("gui_macvim")
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


" ----------------------------------------------Python Specific settings------------------------------------------------
" The following line sets the smartindent mode for *.py files. It means that after typing lines which start with any of
" the keywords in the list (ie. def, class, if, etc) the next line will automatically indent itself to the next level of
" indentation
" http://www.vex.net/~x/python_and_vim.html
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Trim Trailing Whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" -----------------------------------------------------------------------------------------------------------------------
"
"  ---------------------------------------------Ctags Settings----------------------------------------------------------
set tags=./tags;/,tags;/,~/.ctags/tags

" --------------------------------------------------------------------------------------------------------------------
"
" ---------------------------------------------- CtrlP Settings-------------------------------------------------------
" http://blog.endpoint.com/2015/02/vim-plugin-spotlight-ctrlp.html
let mapleader = ","
map <leader>b :CtrlPBuffer<cr> " Launches the buffer search directly on ,b key.

set exrc
set secure

"------------------------------------------------ YouCompleteMe Setting ------------------------------------------------
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"-----------------------------------------------------------------------------------------------------------------------

"------------------------------------------------ syntastic Settings ---------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"-----------------------------------------------------------------------------------------------------------------------

"----------------------------------------------- Python Mode -----------------------------------------------------------
"https://www.youtube.com/watch?v=67OZNp9Z0CQ
"Press K for Documentation
"<leader>r ,r for running the program
"" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

"" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1
"
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"
"" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
