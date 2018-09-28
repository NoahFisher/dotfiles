"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Noah's .vimrc file
"
set nocompatible              " be iMproved, required
filetype off                  " required

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" Plugins
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             " manage dependencies

" Experimental Plugins
Plugin 'fatih/vim-go'
Plugin 'junegunn/goyo.vim'
Plugin 'mxw/vim-jsx'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'chrisbra/csv.vim'
" Plugin 'sirver/ultisnips'             " deactivating bc it's slowing things down
" Plugin 'honza/vim-snippets'           " deactivating bc it's slowing things down
" Plugin 'airblade/vim-gitgutter'       " deactivating bc it's slowing things down
"
"
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'austintaylor/vim-indentobject'
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plugin 'itchyny/lightline.vim'
Plugin 'jgdavey/tslime.vim'               " send things to tmux
Plugin 'junegunn/fzf'                     " fuzzy file finder
Plugin 'junegunn/fzf.vim'                 " vim keybindings
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'                     " search
Plugin 'scrooloose/nerdtree'              " file system explorer
Plugin 'sheerun/vim-polyglot'             " language packs
Plugin 'thoughtbot/vim-rspec'             " rspec helper
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'             " Pairs of handy bracket mappings
Plugin 'tpope/vim-abolish'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'vim-scripts/YankRing.vim'         " copy pasta
Plugin 'w0rp/ale'                         " linting

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" KEY MAPS
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
nmap \i vii:sort<CR>

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" tmux navigator
" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" open/close quickfix window
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

" use // to clear the search
nmap <silent> // :nohlsearch<CR>

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" PLUGIN SETTINGS
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/home/dev/.linuxbrew/opt/fzf/install
set rtp+=~/.fzf

nmap <Leader>b :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :GFiles<CR>
nmap <Leader>a :Ag<CR>

" rails.vim (Better key maps for switching between controller and view)
nnoremap ,vv :Eview<cr>
nnoremap ,cc :Econtroller<cr>

" Create window splits easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>
"
" " use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
"
" " Open the Ag command and place the cursor into the quotes
nmap ,gg :Ag ""<Left>
nmap ,af :AgFile ""<Left>
"grep the current word using ,k (mnemonic Kurrent)
nnoremap <silent> ,k :Ag <cword><CR>


function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

"grep visual selection
vnoremap ,k :<C-U>execute "Ag " . GetVisual()<CR>

" hashmap
imap <c-l> <space>=><space>

" Open the project tree and expose current file in the nerdtree with Ctrl-\ calls NERDTreeFind iff
" NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" ------- Sends spec to tmux window
" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm2"
" Run spec (file)
map ,rs :call RunCurrentSpecFile()<CR>
" Run line
map ,rl :call RunNearestSpec()<CR>
" Run previous
map ,rp :call RunLastSpec()<CR>
" Run all
map ,ra :call RunAllSpecs()<CR>
" Reset Tmux Vars (for sending to another session/window)
nmap ,rr <Plug>SetTmuxVars
" Send visual selection to tmux
vmap ,rv <Plug>SendSelectionToTmux

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>""

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" OPTIONS
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
syntax enable
set background=dark
colorscheme solarized

" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

set clipboard=unnamed       " Use system keyboard
set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me when a file changes
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set list                    " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
                            " Unicode characters for various things
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
set relativenumber          " Use Relative Line Numbers
set number                  " Use Relative Line Numbers
set noshowmode              " Don't show current mode, airline takes car of it

set nowritebackup           " No backups made while editing
set printoptions=paper:letter " US paper
set ruler                   " Show row/col and percentage
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=2            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set smartcase               " Lets you search for ALL CAPS
set softtabstop=2           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=2               " The One True Tab
set textwidth=100           " 100 is the new 80
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion


" - -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
" Custom Scripts
" - -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
" Use Q to intelligently close a window (if there are multiple windows into the same buffer) or kill
" the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" make nerdtree a little prettier
hi! link NERDTreeFile Constant
hi! link NERDTreeDir Identifier

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cr :let @* = expand("%")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" pretty format a json file
map \jt <Esc>:%!python -m json.tool<CR>

" spell check
map <leader>ss :setlocal spell!<cr>

" - -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
" Open a split for each dirty file in git
" stolen from Gary Bernhardt: https://github.com/garybernhardt/dotfiles
" - -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  if len(filenames) > 0
    exec "edit " . filenames[0]
    for filename in filenames[1:]
      exec "sp " . filename
    endfor
  end
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

nnoremap ,ocf :OpenChangedFiles<CR>
