set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
filetype plugin indent on
syntax on
set incsearch
set ignorecase
set smartcase
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " more powerful backspacing
set t_co=256                                                      " explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " expand tab to space

autocmd filetype php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd filetype php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd filetype coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd filetype html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd filetype sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    "set transparency=30
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40
endif

nnoremap <Space> :
vnoremap <Space> :
nnoremap t j
nnoremap s k
vnoremap t j
vnoremap s k
nnoremap <c-w>t <c-w>j
nnoremap <c-w>s <c-w>k
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-5> \
inoremap <c-6> <bar>
inoremap <c-7> }
inoremap <c-8> {
inoremap <c-9> [
inoremap <c-0> ]
inoremap <c-_> =
inoremap <c-,> +
inoremap <c-'> ~
