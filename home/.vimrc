" vimrc

"Extensions git:
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


" Basics
set nocompatible
set nobackup		" don't save ~ backup files
set nowritebackup
set noswapfile
set autoread		" auto read file when changed from outside
set wrap
set showbreak=↪
filetype plugin indent on	" Enable file type detection.
set noerrorbells
set novisualbell
set vb t_vb=		" reset visual bell
set viminfo^=%
set mouse=a
let g:netrw_dirhistmax = 0
if v:progname =~? "evim"
  finish
endif
set encoding=utf-8
set t_ut=	" crucial for proper vim inside a tmux session

" Keys
set backspace=indent,eol,start
map Q gq		" Don't use Ex mode, use Q for formatting
set whichwrap=<,>,h,l
let mapleader=','


" Commands
set history=50		" keep 50 lines of command line history
set cmdheight=2		" Command line height in lines

" Wild menu
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.a,*.so,*.zip,*.rar,*.swp,*/tmp/*,*/vendor/*,*.exe,*.dll


" Paste
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode
set clipboard^=unnamedplus


" Move Windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" Buffers
set nohidden		" Remove buffer when closing tab


" Folds
set foldmethod=marker
nnoremap <space> za
"	open all folds
nnoremap zO zR
"	close all folds
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
set autoindent		" always set autoindenting on
set smartindent
set smarttab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab		" insert a real tab, not spaces


" Extensions
"execute pathogen#infect()
"execute pathogen#helptags()
"vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'lsdr/monokai'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nanotech/jellybeans.vim'
Plug 'moll/vim-node'
call plug#end()


set cscopetag
let g:airline_powerline_fonts = 1
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.ctrlp'
nnoremap <C-I> :CtrlPBufTagAll<CR>
nnoremap <C-O> :CtrlPTag<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:ctrlp_buftag_ctags_bin = 'ctags'
let g:ctrlp_working_path_mode = 'ra'
"let g:easytags_cmd = 'ctags'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|cmadmin|lost+found)$',
  \ 'file': '\v\.(exe|so|dll|gif|jpg|jpeg|png|lnk|zip|rar|gz|tar|db)$',
  \ }
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1


" Tabs
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

" Diff
function! DiffToggle()
	if &diff 
		windo diffoff
	else
		windo diffthis
	endif
endfunction
		


" View
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set number		" Line numbers
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set laststatus=2	" always a status line
syntax enable
set cursorline		" highlight current line
"let g:Powerline_symbols = 'fancy'
"set background=dark
if has("gui_running")
	set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
else
	let g:solarized_termcolors=256
	set t_Co=256
endif
"colorscheme solarized
colorscheme monokai


" LastCursorPosition
augroup vimrcEx
au!
"autocmd FileType text setlocal textwidth=78	" For all text files set 'textwidth' to 78 characters.

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


"File config:
" vim:foldmethod=marker

