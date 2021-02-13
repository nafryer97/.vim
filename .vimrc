"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" "set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely re"set options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default "settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" "set confirm
" "set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently "set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
"set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
"set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=0
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And re"set the terminal code for the visual bell. If visualbell is "set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is un"set, this does nothing.
"set t_vb=
 
" Enable use of the mouse for all modes
" "set mouse=a
 
" "set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation "settings according to personal preference.
 
" Indentation "settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this "setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation "settings for using hard tabs for indent. Display tabs as
" four characters wide.
""set shiftwidth=4
""set tabstop=4
 
 "------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
" Options that Noah F added in 

" Automatically read file when changed outside of vim
set autoread

" Wrapped line repeats indent
set breakindent

" Set the system clipboard as the unnamed register (ex: *p to put)
"set clipboard

" Set an 80 column border for good coding style
set colorcolumn=80

" Don't redraw while executing macros
set lazyredraw

"split horizontal buffer underneath current
set splitbelow

"split vertical buffer to the right
set splitright

" Briefly jump to matching bracket, or beep if there is none
set showmatch

" Get bash-like tab completions
set wildmode=longest,list

" Enable spell checking with US english
set spell spelllang=en_us

" antialias in GUI version on macOS
"set antialias

" Hide the mouse pointer while typing
set mousehide

" Minimum number of lines above and below the cursor
set scrolloff=2

"if(has('termguicolors'))
"  set termguicolors
"endif

"------------------------------------------------------------
" Plugins
"
" ----- polyglot
packadd! vim-polyglot

" ----- onedark
packadd! onedark.vim

" ----- neomake
packadd! neomake

" ----- nerdtree
packadd! nerdtree
" Start NERDTree and return cursor to file
"autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" ----- fugitive
packadd! vim-fugitive

" ----- tmuxline
packadd! tmuxline.vim

" ----- battery
packadd! battery.vim
let g:battery#update_statusline = 1

" ----- gutentags
packadd! vim-gutentags

" ----- airline
packadd! vim-airline
packadd! vim-airline-themes
let g:airline_statusline_ontop = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#battery#enabled = 1
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
"let g:airline_theme='onedark'

""------------------------------------------------------------
" Color Options
set background=dark
colorscheme onedark

""------------------------------------------------------------
" controls how often neomake runs makers
"
function MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif
