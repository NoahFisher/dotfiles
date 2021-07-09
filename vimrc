"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Noah's .vimrc file
"

" Debugging help
autocmd BufEnter *.js iabbr xxx console.log('xxx',
autocmd BufEnter *.rb iabbr pry require 'pry-remote'; binding.remote_pry


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

" Plugin 'fatih/vim-go'

Plugin 'AndrewRadev/ember_tools.vim'      " Try out ember tools
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'austintaylor/vim-indentobject'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plugin 'dense-analysis/ale'               " linting
Plugin 'grep.vim'                         " one search to rule them all
Plugin 'itchyny/lightline.vim'
Plugin 'jgdavey/tslime.vim'               " send things to tmux
Plugin 'junegunn/fzf'                     " fuzzy file finder
Plugin 'junegunn/fzf.vim'                 " vim keybindings
Plugin 'junegunn/vim-easy-align'          " align tables in markdown
Plugin 'morhetz/gruvbox'                  " Different color scheme
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'              " file system explorer
Plugin 'sheerun/vim-polyglot'             " language packs
Plugin 'janko-m/vim-test'                 " test helper
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
" Plugin 'tpope/vim-projectionist'          " add .projectionist.json file for mapping heaven
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'             " Pairs of handy bracket mappings
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/YankRing.vim'         " copy pasta
Plugin 'wfleming/vim-codeclimate'
Plugin 'yssl/QFEnter'                    " Better quickfix window bindings

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

runtime macros/matchit.vim

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

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
" nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
" nnoremap <leader>= :wincmd =<cr>

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
let maplocalleader = "\\"

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/home/dev/.linuxbrew/opt/fzf/install
set rtp+=~/.fzf

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nmap <Leader>a :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>s :Tags<CR>
nmap <Leader>t :GFiles<CR>

" rails.vim (Better key maps for switching between controller and view)
nnoremap ,vv :Eview<cr>
nnoremap ,cc :Econtroller<cr>

" Create window splits easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" " use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" SEARCH SETTINGS
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" " Open the Ag command and place the cursor into the quotes
nmap <leader>gg :Rg 
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
vnoremap <leader>k :<C-U>execute "Rg " . GetVisual()<CR>
"grep the current word using ,k (mnemonic Kurrent)
nnoremap <silent> <leader>k :Rg expand("<cword>")<CR>
" let g:ack_apply_qmappings = 1
" let g:ack_apply_lmappings = 1
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

" hashmap
imap <c-L> <space>=><space>
imap jj <Esc>
imap kk <Esc>

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

" let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let test#ruby#use_binstubs = 0
" ------- Sends spec to tmux window

function! DockerTransform(cmd) abort
  " return test command wrapped in docker stuff
  return 'docker-compose run --rm -e CHROME_HEADLESS=true app '.a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
let test#ruby#rspec#executable = 'bundle exec rspec'
" HACK: tests that start with test_*_spec.rb are getting picked up by Minitest's runner
" instead of rspec
let test#ruby#minitest#file_pattern = '_zzzzzz\.rb'



" RSpec.vim mappings
" let g:rspec_runner = "os_x_iterm2"
let test#strategy = "tslime"
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

nnoremap <silent> <Leader>rs :TestFile<CR>
nnoremap <silent> <Leader>rl :TestNearest<CR>
nnoremap <silent> <Leader>rp :TestLast<CR>
nnoremap <silent> <Leader>ra :TestSuite<CR>
nnoremap <silent> <leader>rtv :TestVisit<CR>

" Reset Tmux Vars (for sending to another session/window)
nmap ,rr <Plug>SetTmuxVars
" Send visual selection to tmux
vmap ,rv <Plug>SendSelectionToTmux

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" commentary isn't using the correct character for cpp/h files.
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType h setlocal commentstring=//\ %s

" add syntax highlighting for prisma's GraphQL data
augroup prisma_dt
  au!
  autocmd BufNewFile,BufRead *.prisma   set syntax=graphql
augroup END

let g:ale_ruby_rubocop_options="--display-cop-names --rails"
" use :ALEFix to run a fixer on a file
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'html.handlebars': ['prettier'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'html.handlebars': ['prettier'],
\   'sql': ['pgformatter'],
\}

map <localleader>a :ALEFix<CR>

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
" OPTIONS
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
syntax enable
set background=dark
colorscheme gruvbox
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
\}
  " \ 'tab_component_function': {
  " \   'filename': 'MyTabFilename',
  " \ },

function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if g:colors_name =~# 'gruvbox'
      runtime autoload/lightline/colorscheme/gruvbox.vim
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction

" Show full path for filename
function! FilenameForLightline()
  return expand('%')
endfunction

" " https://github.com/itchyny/lightline.vim
if !has('gui_running')
  set t_Co=256
endif

set clipboard=unnamed       " System keyboard on linux
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
set textwidth=90            " line length matches common screen size (mac 13" w v splits)
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set complete=.,b,u,]        " pull from keywords in current file, buffers, & tags file
set wildmode=list,list:longest,full " List all options and complete
set wildignore=*.class,*.o,*.pyc,.git,node_modules  " Ignore certain files in tab-completion

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
map <localleader>jt <Esc>:%!python -m json.tool<CR>

" spell check
map <localleader>ss :setlocal spell!<cr>

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
  endif
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

nnoremap ,ocf :OpenChangedFiles<CR>


" -- -- --
" gui settings (font-size)
set gfn=Monaco:h14
" -- -- --


" Align GitHub-flavored Markdown tables
vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

function! OpenPR(sha)
  let pr_number = system("git log --merges --ancestry-path --oneline ". a:sha . "..staging | grep 'pull request' | tail -n1 | awk '{print $5}' | cut -c2-")
  let remote = fugitive#RemoteUrl(".")
  let root = rhubarb#homepage_for_url(remote)
  let url = root . '/pull/' . substitute(pr_number, '\v\C\n', '', 1)
  call netrw#BrowseX(url, 0)
endfunction

function! OpenPivotalStory(sha)
  let pivotal_story_id = system("git show -q --oneline ". a:sha ." | tail -n1 | awk '{print $2}' | sed 's/[^0-9]*//g'")
  let url = 'https://www.pivotaltracker.com/story/show/' . substitute(pivotal_story_id, '\v\C\n', '', 1)
  call netrw#BrowseX(url, 0)
endfunction

augroup fugitive_ext
  autocmd!
  " Browse to the commit under my cursor
  autocmd FileType fugitiveblame nnoremap <buffer> <localleader>gb :execute ":Gbrowse " . expand("<cword>")<cr>

  " Browse to the PR for commit under my cursor
  autocmd FileType fugitiveblame nnoremap <buffer> <localleader>pr :call OpenPR(expand("<cword>"))<cr>

  " Browse to the Pivotal story for this sha (assumes properly formatted commit messages)
  autocmd FileType fugitiveblame nnoremap <buffer> <localleader>gpv :call OpenPivotalStory(expand("<cword>"))<cr>
augroup END

" Synopsis:
"   Extracts into an Rspec let declaration
"   Special thanks to ReinH (#vim room at irc.freenode.net)
function! ExtractIntoRspecLet()
  normal 0
  if empty(matchstr(getline("."), "=")) == 1
    echo "Can't find an assignment"
    return
  end
  normal! dd
  exec "?^\\s*\\<\\(describe\\|context\\)\\>"
  normal! $p
  exec 's/\v([a-z_][a-zA-Z0-9_]*) \= (.+)/let(:\1) { \2 }'
  normal V=

endfunction
command! RExtractLet call ExtractIntoRspecLet()
nnoremap <leader>rel :ERExtractLet<cr>
nnoremap <leader>rel :RExtractLet<cr>
