" vimrc

"Extensions git:
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" https://github.com/majutsushi/tagbar
" https://github.com/kien/ctrlp.vim
" https://github.com/bling/vim-airline


"Basics:
set nocompatible
set nobackup		" don't save ~ backup files
set autoread		" auto read file when changed from outside
filetype plugin indent on	" Enable file type detection.
set noerrorbells
set novisualbell
set vb t_vb=
set viminfo^=%
set mouse=a
let g:netrw_dirhistmax = 0
if v:progname =~? "evim"
  finish
endif
set t_ut=	" crucial for proper vim inside a tmux session


"Keys:
set backspace=indent,eol,start
map Q gq		" Don't use Ex mode, use Q for formatting
set whichwrap=<,>,h,l
nnoremap <F9> :NERDTreeToggle<CR>


"Commands:
set history=50		" keep 50 lines of command line history
set cmdheight=2		" Command line height in lines
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.a,*.so,*.zip,*.rar,*.swp,*/tmp/*,*/vendor/*,*.exe,*.dll


"Paste:
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode


"Windows:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h


"Buffers:
set nohidden		" Remove buffer when closing tab


"Folds:
set foldmethod=marker
nnoremap <space> za
nnoremap zO zR
nnoremap zC zM


"Search:
set incsearch		" do incremental searching
set hlsearch		" Highlight search matches
set ignorecase		" Ignore case on searches
set smartcase
"set magic		" Regex magic mode
set showmatch		" show matching (brackets)
set mat=2		" Tenth of a second to blink matching brackets


"Indent:
set autoindent		" always set autoindenting on
set smartindent
set smarttab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab


"Extensions:
execute pathogen#infect()
execute pathogen#helptags()
set encoding=utf-8
let g:airline_powerline_fonts = 1
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
nmap <C-I> :CtrlPBufTagAll<CR>
nmap <C-O> :CtrlPTag<CR>
let g:tagbar_ctags_bin = 'c:\ctags\ctags.exe'
let g:ctrlp_buftag_ctags_bin = 'c:\ctags\ctags.exe'
let g:ctrlp_working_path_mode = 'ra'
let g:easytags_cmd = 'c:\ctags\ctags.exe'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|cmadmin|lost+found)$',
  \ 'file': '\v\.(exe|so|dll|gif|jpg|jpeg|png|lnk|zip|rar|gz|tar|db)$',
  \ }
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1


"Tabs:
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>
map <C-Up> :tabnew<CR>
nnoremap <Tab> <C-W>w
"map <C-Down> :tabclose<CR>


"View:
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set number		" Line numbers
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set laststatus=2
syntax enable
set cursorline
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


"LastCursorPosition:
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


"Functions:

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


"File config:
" vim:foldmethod=marker

