" vimrc

let g:plugin_manager = "plugged"

" Basics
set nocompatible
set nobackup		" don't save ~ backup files
set noswapfile
set autoread		" auto read file when changed from outside
set wrap
set showbreak=>
filetype plugin indent on	" Enable file type detection.
set noerrorbells
set novisualbell
set vb t_vb=
set viminfo^=%
set mouse=a
let g:netrw_dirhistmax = 0
set nomousehide
set mousemodel=popup
set encoding=utf-8
if v:progname =~? "evim"
  finish
endif

if !empty($TMUX)
	set t_ku=OA
	set t_kd=OB
	set t_kr=OC
	set t_kl=OD
endif

"Keys:
set backspace=indent,eol,start
map Q gq
set whichwrap=<,>,h,l
set nohidden

" Commands and Wild Menu
set history=50		" keep 50 lines of command line history
set cmdheight=2		" Command line height in lines
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.a,*.so,*.zip,*.rar,*.swp,*/tmp/*,*/vendor/*,*.exe,*.dll


" Paste
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode
set clipboard^=unnamedplus

" Folds
set foldmethod=marker
nnoremap <space> za
nnoremap zO zR
nnoremap zC zM
set diffopt+=context:99999	" no folds in diffs

" Search
set incsearch		" do incremental searching
set hlsearch		" Highlight search matches
set ignorecase		" Ignore case on searches
set smartcase
"set magic		" Regex magic mode
set showmatch		" show matching (brackets)
set mat=2		" Tenth of a second to blink matching brackets

" Indent
set autoindent
set smartindent
set smarttab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" Leader
let mapleader = ","
nnoremap <leader>ev :tabe $HOME/.vimrc<CR>
nnoremap <leader>et :tabe $HOME/.tmux.conf<CR>
nnoremap <leader>ec :tabe $HOME/.cshrc<CR>
nnoremap <leader>eb :tabe $HOME/.bashrc<CR>
nnoremap <leader>rv :source $HOME/.vimrc<CR>
nnoremap <leader>vr :registers<CR>
nnoremap <leader>vb :buffers<CR>
nnoremap <leader><leader> :pc<CR>
nnoremap <leader>/ :nohl<CR>
nnoremap <leader>rp :CtrlPClearCache<CR>

" Extensions
if g:plugin_manager == 'pathogen'
	execute pathogen#infect()
	execute pathogen#helptags()
endif
"
"vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if g:plugin_manager == 'plugged'
	call plug#begin('~/.vim/plugged')
	Plug 'majutsushi/tagbar'
	Plug 'kien/ctrlp.vim'
	Plug 'bling/vim-airline'
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdtree'
	Plug 'lsdr/monokai'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'nanotech/jellybeans.vim'
	Plug 'moll/vim-node'
	call plug#end()
endif


let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
nmap <C-O> :CtrlPBufTagAll<CR>
nmap <C-L> :CtrlPTag<CR>
nmap <C-\> :cs find s <cword><CR>
let g:tagbar_ctags_bin = 'ctags'
let g:ctrlp_buftag_ctags_bin = 'ctags'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['module.conf']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|cmadmin|lost+found)|(CMpub|linux50)))$',
  \ 'file': '\v\.(exe|so|dll|gif|jpg|jpeg|png|lnk|zip|rar|gz|tar|db)$',
  \ }

let g:airline_powerline_fonts = 1

nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>

let g:ctrlp_cache_dir = $HOME.'/.ctrlpcache'
let g:ctrlp_clear_cache_on_exit = 0
let g:session_autoload = 'no'
let g:session_autosave = 'no'
if has("cscope")
	set csprg='cscope'
	set csto=0
	set cst
	if filereadable("cscope.out")
		cs add cscope.out
	endif
endif

" Tabs and Windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

noremap <C-Right> :tabnext<CR>
noremap <C-Left> :tabprevious<CR>
noremap <C-Up> :tabnew<CR>
nnoremap <Tab> <C-W>w

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Leader
let mapleader=','
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>vr :registers<CR>
nnoremap <leader>vb :buffers<CR>
nnoremap <leader><leader> :pc<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>es :tabe $HOME/.bashrc<CR>
nnoremap <leader>et :tabe $HOME/.tmux.conf<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>rp :CtrlPClearCache<CR>
nnoremap <leader>ru :PlugUpdate<CR>
nnoremap <leader>dd :call DiffToggle()<CR>
map <leader>tn :tabnew<CR>
map <leader>tl :tabnext<CR>
map <leader>th :tabprevious<CR>

" View
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set number		" Line numbers
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set laststatus=2
set scrolloff=10
syntax enable
set cursorline
set novisualbell
"let g:Powerline_symbols = 'fancy'
set background=dark
if has("gui_running")
	set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
else
	let g:solarized_termcolors=256
	set t_Co=256
endif
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme monokai


" LastCursorPosition
augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78	" For all text files set 'textwidth' to 78 characters.

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

augroup END

augroup GitCommitMessage
au!
autocmd BufRead,BufNewfile,BufEnter COMMIT_EDITMSG setlocal colorcolumn=50
augroup END

" Functions

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! DiffToggle()
	if &diff 
		windo diffoff
	else
		windo diffthis
	endif
endfunction

set secure

"File config:
" vim:foldmethod=marker

